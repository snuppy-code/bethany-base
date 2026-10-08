function whatsmyip --wraps='curl -4 icanhazip.com' --description 'alias whatsmyip curl -4 icanhazip.com'
    curl -4 icanhazip.com $argv
end
