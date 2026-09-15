function northwind --wraps='psql -h pg-in2090.dbd.uiocloud.no -d northwind_skagel -U skagel' --description 'alias northwind psql -h pg-in2090.dbd.uiocloud.no -d northwind_skagel -U skagel'
    psql -h pg-in2090.dbd.uiocloud.no -d northwind_skagel -U skagel $argv
end
