#!/bin/bash -

# Detect active network interface and return appropriate glyph
# Wi-Fi: 󰖩  Ethernet: 󰈁  iPhone USB: 󰄜  None: 󰖪

get_active_interface() {
    # Get the primary interface from the default route
    route -n get default 2>/dev/null | awk '/interface:/ {print $2}'
}

main() {
    local active=$(get_active_interface)

    case "$active" in
        en0)
            # Wi-Fi
            echo -n "󰖩"
            ;;
        en1|en2|en3|en4|en5|en6)
            # Ethernet/Thunderbolt
            echo -n "󰈁"
            ;;
        en8)
            # iPhone USB
            echo -n "󰄜"
            ;;
        bridge*)
            # Bridge (Thunderbolt bridge)
            echo -n "󰈁"
            ;;
        *)
            if [[ -z "$active" ]]; then
                # No connection
                echo -n "󰖪"
            else
                # Unknown - show generic network
                echo -n "󰛳"
            fi
            ;;
    esac
}

main
