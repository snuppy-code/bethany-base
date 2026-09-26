function uiossh
    set -l usage "Usage: uiossh [personal|fdb|northwind]\nThen tap yubikey."
    set -l dir "/etc/nixos/bethany-base/data/in2090"
    switch $argv[1]
        case personal
            set -l tgt skagel
        case fdb
            set -l tgt fdb_skagel
        case northwind 
            set -l tgt northwind_skagel
        case '*'
            echo -e "$usage"
            return 1
    end
    set -l pw (age -d -i "$dir/cassius-stub1" "$dir/uio-pass.age")
    or begin
        echo "decryption failure"
        return 0
    end
    set -x PGPASSWORD $pw
    psql -h pg-in2090.dbd.uiocloud.no -d "$tgt" -U skagel
end
