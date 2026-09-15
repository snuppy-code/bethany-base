function personaldb --wraps='psql -h pg-in2090.dbd.uiocloud.no -d skagel -U skagel' --description 'alias personaldb psql -h pg-in2090.dbd.uiocloud.no -d skagel -U skagel'
    psql -h pg-in2090.dbd.uiocloud.no -d skagel -U skagel $argv
end
