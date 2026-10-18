#!/bin/sh
# Rebuilds the site's images and demo video from the app in this repo. Run
# scripts/build.sh at the repo root first, or point GLIDE_REPO at a checkout
# with a built dist/Glide.app. Reads the app's files, never writes to them.
#
#   site/scripts/assets.sh
#   GLIDE_REPO=~/src/glide site/scripts/assets.sh
#
# The demo is Glide's own synthetic recording (`glide synth`, no screen content),
# restyled by scripts/demo-project.json and exported by Glide itself. The OG
# image needs Google Chrome; cwebp and ImageMagick come from Homebrew.
set -eu
cd "$(dirname "$0")/.."
GLIDE_REPO="${GLIDE_REPO:-$(cd .. && pwd)}"
GLIDE="$GLIDE_REPO/dist/glide"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
ASSETS=src/lib/assets
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP" scripts/og/poster.png scripts/og/icon.png' EXIT
mkdir -p "$ASSETS" static

echo "==> Demo video"
(cd "$TMP" && "$GLIDE" synth demo.glide --duration 12 >/dev/null)
cp scripts/demo-project.json "$TMP/demo.glide/project.json"
"$GLIDE" export "$TMP/demo.glide" -o "$ASSETS/demo.mp4" --height 1350 --fps 60 --codec h264 --target-mb 3
"$GLIDE" export "$TMP/demo.glide" -o "$ASSETS/demo-720.mp4" --height 720 --fps 60 --codec h264 --target-mb 1
"$GLIDE" frame "$TMP/demo.glide" -t 0 --height 1350 -o "$TMP/poster.png" >/dev/null
cwebp -quiet -q 78 "$TMP/poster.png" -o "$ASSETS/demo-poster.webp"

echo "==> Editor screenshots"
for name in editor editor-light; do
	src="$GLIDE_REPO/docs/screenshots/$name.png"
	cwebp -quiet -q 84 -sharp_yuv "$src" -o "$ASSETS/$name.webp"
	cwebp -quiet -q 84 -sharp_yuv -resize 1000 0 "$src" -o "$ASSETS/$name-1000.webp"
done

echo "==> Icons"
iconutil -c iconset -o "$TMP/AppIcon.iconset" "$GLIDE_REPO/dist/Glide.app/Contents/Resources/AppIcon.icns"
ICON="$TMP/AppIcon.iconset/icon_512x512@2x.png"
# The 1024 px icon follows the macOS grid: the tile itself is 824 px, inset 100 px.
magick "$ICON" -crop 824x824+100+100 +repage "$TMP/tile.png"
magick "$ICON" -resize 224x224 -strip "$TMP/icon-224.png"
cwebp -quiet -q 90 -alpha_q 100 "$TMP/icon-224.png" -o "$ASSETS/icon.webp"
magick "$TMP/tile.png" -resize 64x64 -strip static/favicon.png
magick "$TMP/tile.png" -resize 180x180 -strip static/apple-touch-icon.png
magick "$TMP/tile.png" -define icon:auto-resize=48,32,16 static/favicon.ico

echo "==> Open Graph image"
cp "$TMP/poster.png" scripts/og/poster.png
cp "$ICON" scripts/og/icon.png
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
	--window-size=1200,630 --screenshot="$TMP/og.png" "file://$PWD/scripts/og/og.html" 2>/dev/null
magick "$TMP/og.png" -strip -quality 88 static/og.jpg

ls -l "$ASSETS" static
