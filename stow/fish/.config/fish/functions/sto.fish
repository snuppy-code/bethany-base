function sto --wraps='stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty lazygit starship espanso' --description 'alias sto stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty lazygit starship espanso'
    stow -d /etc/nixos/bethany-base/stow -t ~ -S zed fish ssh kitty lazygit starship espanso $argv
end
