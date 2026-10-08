function sshunmount --argument-names remotehostname
    fusermount -u ~/$remotehostname
end
