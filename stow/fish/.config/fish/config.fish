set -g fish_greeting
set -gx EDITOR nvim

# todo universal variables are cool..
# todo for fido? some kind of notification when yubikey needs tapping

if status is-interactive

    ssh-add -l &>/dev/null
    # ssh-add -l exit code is:
    # 0 if agent got keys
    # 1 if agent got no keys
    # 2 if can't reach agent
    set ecode $status
    if test $ecode -eq 2
        echo "divine link severed !!!!!!!! (can't reach ssh-agent, did you remove it nix config?)"
    end
    if test $ecode -eq 1
        echo "ssh-agent loading keys..."
        ssh-add -K
        clear
    end

    echo ""
    if test $hostname = lilin
        cat /etc/nixos/bethany-base/assets/nixlogo/unicode/green-yellow
    end
    if test $hostname = tabris
        cat /etc/nixos/bethany-base/assets/nixlogo/unicode/yellow-magenta
    end
    echo ""

    abbr --add sto "stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty"
    abbr --add nval "nix-instantiate --eval"
    abbr --add nvals "nix-instantiate --eval --strict"
    abbr --add nos nh os switch
end
