#!/bin/bash
# Builds the macOS installer from the module package:
#   installer/mac/build_pkg.sh waves-lv1-2.1.0-beta.1.tgz [out dir]
set -euo pipefail
TGZ="$1"
OUT="${2:-out}"
HERE="$(cd "$(dirname "$0")" && pwd)"

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
tar -xzf "$TGZ" -C "$WORK"
VERSION="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$WORK/waves-lv1/companion/manifest.json")"

mkdir -p "$WORK/root" "$WORK/scripts" "$OUT"
mv "$WORK/waves-lv1" "$WORK/root/waves-lv1-$VERSION"
sed "s/__VERSION__/$VERSION/" "$HERE/postinstall" > "$WORK/scripts/postinstall"
chmod 755 "$WORK/scripts/postinstall"

pkgbuild --root "$WORK/root" \
	--install-location "/Library/Application Support/Waves LV1 Companion Beta" \
	--scripts "$WORK/scripts" \
	--identifier pt.azlourenco.waves-lv1-companion-beta \
	--version "$VERSION" \
	"$OUT/WavesLV1-Companion-$VERSION.pkg"
echo "built $OUT/WavesLV1-Companion-$VERSION.pkg"
