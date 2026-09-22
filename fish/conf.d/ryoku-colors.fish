# Ryoku palette for fish and fzf. Rendered by the theme daemon; do not edit.
#
# Dropped straight into conf.d, which fish sources on its own, so nothing in the
# shipped config has to include it. Your ~/.config/fish/user.fish loads last and
# still wins.

# Syntax highlighting.
set -g fish_color_normal dee3e6
set -g fish_color_command 89d0ed
set -g fish_color_keyword c4c3eb
set -g fish_color_quote b3cad5
set -g fish_color_redirection c0c8cc
set -g fish_color_end c4c3eb
set -g fish_color_error ffb4ab
set -g fish_color_param dee3e6
set -g fish_color_comment c0c8cc
set -g fish_color_selection --background=004d62
set -g fish_color_operator c4c3eb
set -g fish_color_escape b3cad5
set -g fish_color_autosuggestion c0c8cc
set -g fish_color_cancel ffb4ab
set -g fish_color_search_match --background=004d62
set -g fish_color_valid_path --underline

# Completion pager.
set -g fish_pager_color_progress c0c8cc
set -g fish_pager_color_prefix 89d0ed
set -g fish_pager_color_completion dee3e6
set -g fish_pager_color_description c0c8cc
set -g fish_pager_color_selected_background --background=004d62

# fzf takes the same palette, so Ctrl-R and Ctrl-T match the terminal they open
# in. Appended to whatever options are already set rather than replacing them.
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#dee3e6,bg:-1,hl:#89d0ed \
--color=fg+:#dee3e6,bg+:#004d62,hl+:#89d0ed \
--color=info:#b3cad5,prompt:#89d0ed,pointer:#c4c3eb \
--color=marker:#c4c3eb,spinner:#b3cad5,header:#c0c8cc \
--color=border:#40484c"
