function ttswap
    if test $(count $argv) -gt 1
        echo "Too many args.
Usage: ttswap dark/light"
        return
    else if test $(count $argv) -lt 1
        echo "Too few args.
Usage: ttswap dark/light"
        return
    end

    if test "$argv[1]" = dark
        python /etc/nixos/bethany-base/termtheme/termthemer.py dark
        kitten theme catppuccin-macchiato
        yes | fish_config theme save tomorrow-night-bright

    else if test "$argv[1]" = light
        python /etc/nixos/bethany-base/termtheme/termthemer.py light
        kitten theme everforest light hard
        yes | fish_config theme save "kelp forest shallow"

    else
        echo "Unknown error.
Usage: ttswap dark/light"
        return
    end
end
