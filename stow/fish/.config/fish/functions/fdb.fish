function fdb --wraps='psql -h pg-in2090.dbd.uiocloud.no -d fdb_skagel -U skagel' --description 'alias fdb psql -h pg-in2090.dbd.uiocloud.no -d fdb_skagel -U skagel'
    psql -h pg-in2090.dbd.uiocloud.no -d fdb_skagel -U skagel $argv
end
