#!/bin/bash

echo "=== Detecting pointer devices ==="

# Gather all pointer device IDs
pointer_ids=$(xinput --list \
    | grep -i "pointer" \
    | sed -E 's/.*id=([0-9]+).*/\1/')

if [ -z "$pointer_ids" ]; then
    echo "No pointer devices found."
    exit 1
fi

for id in $pointer_ids; do
    # Get device name
    name=$(xinput --list --name-only "$id" 2>/dev/null)

    echo "Device: $name (id=$id)"

    # Try to set natural scrolling
    if xinput --set-prop "$id" 'libinput Natural Scrolling Enabled' 1 2>/dev/null; then
        echo "  → Natural scrolling ENABLED"
    else
        echo "  → Property not supported"
    fi

    echo
done

echo "=== Done ==="
