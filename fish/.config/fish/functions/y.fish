function y
    set -lx fish_prompt_pwd_dir_length 1
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    if set cwd (cat -- $tmp); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- $cwd
    end
    rm -f -- $tmp
end
