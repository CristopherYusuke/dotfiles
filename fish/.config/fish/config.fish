source /usr/share/cachyos-fish-config/cachyos-config.fish

# Greeting
# function fish_greeting
#     fastfetch
# end
#
fish_vi_key_bindings

set -gx GTK_IM_MODULE cedilla
set -gx QT_IM_MODULE cedilla

if status is-interactive
    # Input methods

    # Editor
    set -gx EDITOR nvim

    # Tools
    fzf --fish | source
    starship init fish | source
end
