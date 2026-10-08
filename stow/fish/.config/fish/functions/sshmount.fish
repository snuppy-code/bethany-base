function sshmount --argument-names remotehostname
    mkdir -p ~/$remotehostname
    sshfs snuppy@$remotehostname:/home/snuppy/ ~/$remotehostname/
end
