function compdirs --argument-names remotehost remotepath localpath --description "compares directory on local host to remote host. https://dev.to/alexisayenko/understanding-rsync-itemize-changes-5fgi"
    rsync -rcni --delete "$remotehost:$remotepath/" "$localpath/"
end
