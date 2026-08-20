function ng --wraps='git add .; nh os switch' --description 'alias ng git add .; nh os switch'
    git add .; nh os switch $argv
end
