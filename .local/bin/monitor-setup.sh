#!/bin/bash
case "$(hostname -s)" in
    cdpresto-desk2)
        xrandr --output HDMI-3 --primary --mode 3840x2160 --left-of HDMI-4 \
               --output HDMI-4 --mode 3840x2160
        ;;
    adl-nuc)
        xrandr --output DisplayPort-1 --primary --mode 3840x2160 --left-of DisplayPort-2 \
               --output DisplayPort-2 --mode 3840x2160
        ;;
    server|fed-nuc|hades-cyn|cdpresto-mobl2)
        # single monitor or headless ¿ nothing to configure yet
        ;;
    *)
        echo "monitor-setup.sh: no monitor config for host $(hostname -s)" >&2
        ;;
esac
