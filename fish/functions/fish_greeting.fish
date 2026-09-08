function fish_greeting
    set term (ps -p (ps -p %self -o ppid= | string trim) -o comm= | string trim)
    set cols (tput cols)
    set padding (math $cols - (string length "$term"))
    #printf "%*s\n" $cols "$term"
    #echo -ne '\x1b[38;5;16m'  # Set colour to primary
    #echo '     ______           __          __  _       '
    #echo '    / ____/___ ____  / /__  _____/ /_(_)___ _ '
    #echo '   / /   / __ `/ _ \/ / _ \/ ___/ __/ / __ `/ '
    #echo '  / /___/ /_/ /  __/ /  __(__  ) /_/ / /_/ /  '
    #echo '  \____/\__,_/\___/_/\___/____/\__/_/\__,_/   '
    #set_color normal
    #echo "▀█████████▄   ▄█          ▄████████ ███▄▄▄▄    ▄████████"
    #echo "  ███    ███ ███         ███    ███ ███▀▀▀██▄ ███    ███"
    #echo "  ███    ███ ███         ███    ███ ███   ███ ███    █▀ "
    #echo " ▄███▄▄▄██▀  ███         ███    ███ ███   ███ ███       "
    #echo "▀▀███▀▀▀██▄  ███       ▀███████████ ███   ███ ███       "
    #echo "  ███    ██▄ ███         ███    ███ ███   ███ ███    █▄ "
    #echo "  ███    ███ ███▌    ▄   ███    ███ ███   ███ ███    ███"
    #echo "▄█████████▀  █████▄▄██   ███    █▀   ▀█   █▀  ████████▀ "
    #echo "             ▀                                          "
    #echo "  '||''|.   '||                          "
    #echo "   ||   ||   ||   ....   .. ...     .... "
    #echo "   ||'''|.   ||  '' .||   ||  ||  .|   ''"
    #echo "   ||    ||  ||  .|' ||   ||  ||  ||     "
    #echo "  .||...|'  .||. '|..'|' .||. ||.  '|...'"

    #    fastfetch --key-padding-left 3
end
