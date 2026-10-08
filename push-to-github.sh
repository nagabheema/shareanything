#!/usr/bin/env bash
# One-command push to GitHub (Mac / Linux / Git Bash)
set -e
DEFAULT_USER="nagabheema"

read -p "GitHub username [$DEFAULT_USER]: " GH_USER
GH_USER=${GH_USER:-$DEFAULT_USER}
read -p "Repository name (e.g. my-project): " REPO
read -p "Commit message [Update]: " MSG
MSG=${MSG:-Update}

[ -d .git ] || git init
git add -A
git commit -m "$MSG" || echo "Nothing new to commit."
git branch -M main

if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  echo "Using GitHub CLI..."
  if ! git remote get-url origin >/dev/null 2>&1; then
    gh repo create "$GH_USER/$REPO" --public --source=. --remote=origin || true
  fi
  git push -u origin main
  # Turn on GitHub Pages (deploy via Actions) - ignore if already on
  gh api -X POST "repos/$GH_USER/$REPO/pages" -f build_type=workflow >/dev/null 2>&1 || true
else
  echo "GitHub CLI not found, using plain git."
  echo "Make sure an EMPTY repo named '$REPO' exists: https://github.com/new"
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$GH_USER/$REPO.git"
  git push -u origin main
  echo "Now enable Pages: Repo > Settings > Pages > Source = GitHub Actions"
fi

echo ""
echo "Done! Your site will be live in ~1-2 minutes at:"
echo "https://$GH_USER.github.io/$REPO/"
