function nice
    printf "$(set_color -f magenta)%-20s$(set_color --reset)%s\n" "nix store optimise" "hardlinks together identical files" \
        "nh clean" "extends `nix-collect-garbage` with gcroot cleanup, profile targeting, and time-based retention" \
        "nh os switch" "" \
        "nh os boot" ""
end
