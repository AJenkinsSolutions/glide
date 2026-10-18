# Glide download page

The download page for Glide, an open-source screen recorder for the Mac. One prerendered SvelteKit page plus a `/download` redirect, deployed on Vercel. Run the commands below from this folder.

## Develop

```sh
npm install
npm run dev       # http://localhost:5173
npm run check     # svelte-check
npm run build     # writes .vercel/output
npm run preview   # serves the build on http://localhost:4173
```

## Download link

The Download button points at `/download`, which 302s to `https://github.com/michaelshimeles/glide/releases/latest/download/Glide-universal.dmg`. It works once the latest GitHub release has an asset with that exact name. The URL, version number and system requirements all live in `src/lib/site.ts`.

## Assets

Everything in `src/lib/assets` and the icons and `og.jpg` in `static` come from `scripts/assets.sh`. The script reads the app from the repo root, so run `scripts/build.sh` there first, or point `GLIDE_REPO` at a checkout that already has a built `dist/Glide.app`. It never writes to the app's files.

```sh
scripts/assets.sh
GLIDE_REPO=~/src/glide scripts/assets.sh
```

The demo video is Glide's own synthetic recording (`glide synth`), restyled by `scripts/demo-project.json` and exported by Glide, so it shows no real desktop. The editor screenshots come from `docs/screenshots` at the repo root. The Open Graph card is `scripts/og/og.html` rendered by headless Chrome. You also need `cwebp` and ImageMagick (`brew install webp imagemagick`).

## Deploy

Import the repo as a Vercel project with the SvelteKit preset and set the Root Directory to `site`. No environment variables are needed. Open Graph URLs use `VERCEL_PROJECT_PRODUCTION_URL`, which Vercel sets at build time. Local builds fall back to `http://localhost:4173`.
