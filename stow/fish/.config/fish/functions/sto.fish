function sto
    set -f dir /etc/nixos/bethany-base/stow
    set -f modules (path basename $dir/*)
    stow -d $dir -t ~ -S $modules $argv
end
