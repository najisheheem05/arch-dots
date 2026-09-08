# Ryoku palette for fish and fzf. Rendered by the theme daemon; do not edit.
#
# Dropped straight into conf.d, which fish sources on its own, so nothing in the
# shipped config has to include it. Your ~/.config/fish/user.fish loads last and
# still wins.

# Syntax highlighting.
set -g fish_color_normal e4e1e9
set -g fish_color_command bec2ff
set -g fish_color_keyword e7b9d5
set -g fish_color_quote c5c4dd
set -g fish_color_redirection c7c5d0
set -g fish_color_end e7b9d5
set -g fish_color_error ffb4ab
set -g fish_color_param e4e1e9
set -g fish_color_comment c7c5d0
set -g fish_color_selection --background=3d4279
set -g fish_color_operator e7b9d5
set -g fish_color_escape c5c4dd
set -g fish_color_autosuggestion c7c5d0
set -g fish_color_cancel ffb4ab
set -g fish_color_search_match --background=3d4279
set -g fish_color_valid_path --underline

# Completion pager.
set -g fish_pager_color_progress c7c5d0
set -g fish_pager_color_prefix bec2ff
set -g fish_pager_color_completion e4e1e9
set -g fish_pager_color_description c7c5d0
set -g fish_pager_color_selected_background --background=3d4279

# fzf takes the same palette, so Ctrl-R and Ctrl-T match the terminal they open
# in. Appended to whatever options are already set rather than replacing them.
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#e4e1e9,bg:-1,hl:#bec2ff \
--color=fg+:#e4e1e9,bg+:#3d4279,hl+:#bec2ff \
--color=info:#c5c4dd,prompt:#bec2ff,pointer:#e7b9d5 \
--color=marker:#e7b9d5,spinner:#c5c4dd,header:#c7c5d0 \
--color=border:#46464f"
