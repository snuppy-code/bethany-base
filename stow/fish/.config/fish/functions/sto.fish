function sto
    if not contains $hostname lilin tabris
        echo "This command won't work for you without changes!"
        exit 1
    end

    set -f common_dir /etc/nixos/bethany-base/stow
    set -f common_modules (path basename $common_dir/*)
    set -f my_dir "/etc/nixos/bethany-base/hosts/$hostname/stow"
    set -f my_modules (path basename $my_dir/*)

    if test 0 -lt "$(count $my_modules)"
        echo "Stowing from $my_dir to $HOME the following modules: $my_modules"
        stow -d $my_dir -t $HOME -S $my_modules
    else
        echo "info: skipping modules from $my_dir as it is empty ($my_modules)"
    end

    if test 0 -lt "$(count $common_modules)"
        echo "Stowing from $common_dir to $HOME the following modules: $common_modules"
        stow -d $common_dir -t $HOME -S $common_modules
    else
        echo "info: skipping modules from $common_dir as it is empty ($common_modules)"
    end
end
