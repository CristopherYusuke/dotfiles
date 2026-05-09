source /usr/share/cachyos-fish-config/cachyos-config.fish
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

set -gx GTK_IM_MODULE cedilla
set -gx QT_IM_MODULE cedilla



if status is-interactive
    fzf --fish | source
    starship init fish | source
    # outros comandos interativos aqui
end
