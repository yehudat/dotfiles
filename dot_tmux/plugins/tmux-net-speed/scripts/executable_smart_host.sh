#!/bin/bash -

# Smart hostname: if hostname or username contains 'yehuda', show just that token
# Special characters (- _ . space) are treated as separators

get_smart_name() {
    local host=$(hostname)
    local user=$(whoami)

    # Check hostname first, then username
    for name in "$host" "$user"; do
        # Split by special characters and find token containing 'yehuda'
        local token=$(echo "$name" | awk -F'[-_. ]' '{for(i=1;i<=NF;i++) if(tolower($i) ~ /yehuda/) {print $i; exit}}')
        if [[ -n "$token" ]]; then
            echo "$token"
            return
        fi
    done

    # Fallback to short hostname
    hostname -s
}

main() {
    echo -n "$(get_smart_name)"
}

main
