#!/bin/bash
# Builds the Windows installer of a beta from the module package and gathers the release files:
#   ./build.sh ../companion-module-waves-lv1/waves-lv1-2.1.0-beta.1.tgz
# out/ then holds the module package, the Windows installer and the Companion Surface driver
# installers. The macOS installer is built by GitHub Actions when the release is published.
set -euo pipefail
TGZ="$1"
HERE="$(cd "$(dirname "$0")" && pwd)"
ISCC="/c/Program Files (x86)/Inno Setup 6/ISCC.exe"

WORK="$HERE/work"
rm -rf "$WORK" "$HERE/out"
mkdir -p "$WORK" "$HERE/out"
tar -xzf "$TGZ" -C "$WORK"
MOD="$WORK/waves-lv1"
VERSION="$(python -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$MOD/companion/manifest.json")"
# 2.1.0-beta.1 -> 2.1.0.1 (Windows file versions are numbers only)
WINVER="$(echo "$VERSION" | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+)(-[a-z]+\.?([0-9]+))?.*/\1.\3/; s/\.$/.0/')"

"$ISCC" //Q "//DAppVersion=$VERSION" "//DWinVersion=$WINVER" "//DModuleDir=$(cygpath -w "$MOD")" "$(cygpath -w "$HERE/installer/windows.iss")"

cp "$TGZ" "$HERE/out/waves-lv1-$VERSION.tgz"
cp "$MOD/CompanionSurface-Setup.exe" "$HERE/out/CompanionSurface-Setup.exe"
cp "$MOD/CompanionSurface-Setup.pkg" "$HERE/out/CompanionSurface-Setup.pkg"
rm -rf "$WORK"
ls -la "$HERE/out"
