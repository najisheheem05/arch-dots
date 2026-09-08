# Ryoku palette for fish and fzf. Rendered by the theme daemon; do not edit.
#
# Dropped straight into conf.d, which fish sources on its own, so nothing in the
# shipped config has to include it. Your ~/.config/fish/user.fish loads last and
# still wins.

# Syntax highlighting.
set -g fish_color_normal f0dedd
set -g fish_color_command ffb3b0
set -g fish_color_keyword e3c28c
set -g fish_color_quote e7bdba
set -g fish_color_redirection d7c1c0
set -g fish_color_end e3c28c
set -g fish_color_error ffb4ab
set -g fish_color_param f0dedd
set -g fish_color_comment d7c1c0
set -g fish_color_selection --background=733332
set -g fish_color_operator e3c28c
set -g fish_color_escape e7bdba
set -g fish_color_autosuggestion d7c1c0
set -g fish_color_cancel ffb4ab
set -g fish_color_search_match --background=733332
set -g fish_color_valid_path --underline

# Completion pager.
set -g fish_pager_color_progress d7c1c0
set -g fish_pager_color_prefix ffb3b0
set -g fish_pager_color_completion f0dedd
set -g fish_pager_color_description d7c1c0
set -g fish_pager_color_selected_background --background=733332

# fzf takes the same palette, so Ctrl-R and Ctrl-T match the terminal they open
# in. Appended to whatever options are already set rather than replacing them.
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#f0dedd,bg:-1,hl:#ffb3b0 \
--color=fg+:#f0dedd,bg+:#733332,hl+:#ffb3b0 \
--color=info:#e7bdba,prompt:#ffb3b0,pointer:#e3c28c \
--color=marker:#e3c28c,spinner:#e7bdba,header:#d7c1c0 \
--color=border:#534342"
