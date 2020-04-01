#!/bin/bash
#bash curl.sh $1 
#bash curl_preprocessing.sh 
#bash curl_preprocessing-2.sh 
#bash curl_postprocessing.sh
#cat curlresult.txt | grep -ohP https\:\/\/.*?index\.m3u8 |  tail +2 | sed -e 's/https.*\%24//g'
#sed -i -e 's#^#\./m3u8-download #' curlresult.sh > download-command.txt
cp ./curlresult.txt ./curlresult.sh
cat curlresult.sh
n=$(wc -l curlresult.sh)
echo
echo 'Total m3u8 available: ' $n
echo
echo 'Please input start and end of options to execute:'
read -p "Input Selection:" input1 input2
start=$input1
end=$input2
s=$start
#if [[ $s == 0 ]]; then
#	s=$start
#fi
ee=$end
#if [[ $ee == $((n+1)) ]]; then
#	ee=$end
#fi
x=$((end-start))
sed -i -e 's#^#\"\./m3u8-download #' curlresult.sh > download-command.txt
sed -i -e ''$s','$ee'!d' curlresult.sh > download-command.txt
read -p "Give the video name: " vname
sed -i -e 's/$/ '$vname'/' curlresult.sh > downlaod-command.txt
cat curlresult.sh
echo
read -p "Waiting..., please check if the curlresult with video name is correct: " waitingi1
for (( i=1; i<=x+1; i++ )); do 
	#sed -e '$i p' curlresult.sh > download-command.txt
	echo i
	sed -i -e ''$i' s/$/'$i'\"/' curlresult.sh > download-command.txt
	#awk '{print "-" "'$i'"}' curlresult.sh > download-command.txt
	exec cat curlresult.sh | grep \.\/m3u8
done

#exec cat curlresult.sh | grep \.\/m3u8 | sed -e '/$start/,/$end/{/$start/d;/$end/d;p;}'
#eval start=\"\$start+1"


echo "You are going to download from source #"$((start+1))
#command=\"$(cat curlresult.sh | grep \.\/m3u8 | tail +"$start")
command=$(cat curlresult.sh | grep \.\/m3u8)
echo "These are going to be executed, you can copy and run them on different sessions: "$command
read -p "Waiting for check..." waiting2

exec $(echo "bash ./parallel.sh" $command)

#IFS=' '  read C <<< $command
#echo $C

#for cmd in "$C"; do {
 # echo "Process \"$cmd\" started";
 # $cmd & pid=$!
 # PID_LIST+=" $pid";
#} done

#trap "kill $PID_LIST" SIGINT

#echo "Parallel processes have started";

#wait $PID_LIST

#echo
#echo "All processes have completed";
