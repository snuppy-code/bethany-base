function sto --wraps='stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty lazygit starship' --description 'alias sto stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty lazygit starship'
    stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty lazygit starship $argv
end
