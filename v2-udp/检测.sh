cd ${0%/*}
chmod -R 777 .
. ./config.ini
./bin/"$exec".bin check