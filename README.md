# Deploy Kit: push to GitHub + free online hosting

Works on computer AND mobile. 100% free. ~5 minutes.

## Steps
1. Unzip this kit INTO your project folder (so `index.html` / `package.json` sit next to `push-to-github.sh`).
   Delete the placeholder `index.html` if your project has its own.
2. Run the push script:
   - Windows: double-click `push-to-github.bat`
   - Mac/Linux/Git Bash: `./push-to-github.sh`
3. First time only: create an EMPTY repo at https://github.com/new (same name you type in the script).
   (If you have the GitHub CLI `gh` installed and logged in, the script does this for you.)
4. First time only, if the script says so: Repo > Settings > Pages > Source = **GitHub Actions**.
5. Wait 1-2 minutes. Your link:
   `https://YOUR-USERNAME.github.io/REPO-NAME/`

## Share with anyone
- Send the link on WhatsApp/Telegram: opens on any phone or PC.
- Make a QR code (free): https://www.qrcode-monkey.com , paste your link.

## Updating later
Just run the push script again. The site redeploys automatically.

## Notes
- Plain HTML/CSS/JS: works as is.
- Vite/React: in `vite.config.js` set `base: '/REPO-NAME/'`.
  Create React App: add `"homepage": "."` in package.json.
- GitHub Pages hosts FRONTEND only. For a backend/API use free tiers of Render.com or Railway, and put its URL in your frontend.
- Never commit secrets: keep keys in `.env` (already git-ignored).

## Faster alternatives (no GitHub needed)
- Netlify Drop: https://app.netlify.com/drop , drag your build folder, instant link.
- Vercel: `npx vercel` or import your GitHub repo at vercel.com.
- Cloudflare Pages: connect GitHub repo, free & fast.
