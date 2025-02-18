#!/bin/bash

# backup dos programas instalados

BKP_DIR="/home/fxlip"
BKP_DATE=$(date "+%d-%m-%Y")
BKP_DIR_TMP="$BKP_DIR/Documentos/Pacotes"
hostname=$(hostname -s)

function backup(){

test ! -d $BKP_DIR && mkdir -p $BKP_DIR
test ! -d $BKP_DIR_TMP && mkdir -p $BKP_DIR_TMP
cd $BKP_DIR_TMP && rm -f $BKP_DIR_TMP/* ;

# Gera o script de restauração (no mesmo diretório do backup).
cat > restore.sh << "EOF"
#!/bin/bash

# ============================================================================
dpkg --set-selections < pkg.lst
apt-get update
apt-get dist-upgrade
apt-get dselect-upgrade
apt-get -f install

EOF

chmod +x restore.sh

# Gera uma lista com todos os programas instalados e salva no arquivo pkg.lst
dpkg --get-selections -a > pkg.lst

lista=$(ls -t $BKP_DIR_TMP)
# Gera um md5 do script de restauração e da lista de programas para uma posterior análise.
(find $lista -type f -print0 | xargs -0 md5sum > $BKP_DIR_TMP/$hostname-$BKP_DATE.md5) && sync ;

lista2=$(ls -t $BKP_DIR_TMP)
tar -czvf ../$hostname-$BKP_DATE.tgz $lista2
cd $BKP_DIR

# Gera um md5 do backup em formato tar.
md5sum $hostname-$BKP_DATE.tgz > $hostname-$BKP_DATE.tgz.md5

}

backup ;

exit 0
