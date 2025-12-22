# 1. SETUP PATH FIRST (Crucial for zoxide/pipx tools)
# Created by `pipx`
set PATH $PATH /home/zero/.local/bin

if status is-interactive
    # --- 2. CORE TOOLS ---

    # Starship Prompt
    starship init fish | source

    # Zoxide (The Teleporter)
    if command -v zoxide &>/dev/null
        zoxide init fish | source
    end

    # Direnv
    if command -v direnv &>/dev/null
        direnv hook fish | source
    end

    # --- 3. ALIASES & EYE CANDY ---

    # Short Aliases and Abbreviations
    abbr c clear

    # Modern replacements
    alias ls='eza --icons --group-directories-first -1'
    alias ll='eza --icons --group-directories-first -l'

    # alias lgt='eza --tree -l --icons --group-directories-first --git'
    alias la='eza -la --icons --group-directories-first'
    alias lt='eza --tree --icons --group-directories-first'
    alias l='eza -lhF --icons --group-directories-first'

    # Colorful tree view with 2 levels by default
    alias tree='eza --tree --icons --group-directories-first -L 2'
    #alias cat='bat'

    # Safety nets
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'

    # Git Abbreviations
    abbr lg lazygit
    abbr ga 'git add .'
    abbr gc 'git commit -m'
    abbr gp 'git push'
    abbr gs 'git status'

    # --- 4. INTEGRATIONS ---

    # YAZI WRAPPER (Fixes "cd" on exit)
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Custom Caelestia Colors
    command cat ~/.local/state/caelestia/sequences.txt 2>/dev/null
end
