#!/usr/bin/env bash
# install-hosts.sh - merge ~/.config/hosts.d/hosts into /etc/hosts
# Safe to re-run: replaces only the marked block, leaves the rest of
# /etc/hosts (localhost entries, anything else already there) alone.
set -euo pipefail

SRC="$HOME/.config/hosts.d/hosts"
DEST="/etc/hosts"
BEGIN_MARK="# BEGIN dotfiles-managed hosts"
END_MARK="# END dotfiles-managed hosts"

if [ ! -f "$SRC" ]; then
    echo "Source file not found: $SRC" >&2
    exit 1
fi

TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

if grep -q "^$BEGIN_MARK$" "$DEST" 2>/dev/null; then
    # Replace existing block in place
    awk -v begin="$BEGIN_MARK" -v end="$END_MARK" '
        $0 == begin {print; while ((getline line < "'"$SRC"'") > 0) print line; skip=1; next}
        $0 == end {print; skip=0; next}
        !skip {print}
    ' "$DEST" > "$TMP"
else
    # No existing block - append a new one
    cp "$DEST" "$TMP"
    {
        echo ""
        echo "$BEGIN_MARK"
        cat "$SRC"
        echo "$END_MARK"
    } >> "$TMP"
fi

sudo cp "$DEST" "${DEST}.bak.$(date +%Y%m%d%H%M%S)"
sudo cp "$TMP" "$DEST"
echo "Installed $SRC into $DEST (backup saved alongside it)."
