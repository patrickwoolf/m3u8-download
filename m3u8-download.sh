#!/bin/bash
#bash curl.sh $1 
#bash curl_preprocessing.sh 
#bash curl_preprocessing-2.sh 
#bash curl_postprocessing.sh
cp ./curlresult.txt ./curlresult.sh
cat curlresult.sh
n=$(wc -l curlresult.sh)
echo
echo 'Total number of m3u8 sources available: ' $n
echo
echo 'Please input start and end of options of the server you want to download from:'
read -p "Input Selection:" input1 input2
start=$input1
end=$input2
s=$start
ee=$end
x=$((end-start))
sed -i -e 's#^#\"\./m3u8-download #' curlresult.sh > download-command.txt
sed -i -e ''$s','$ee'!d' curlresult.sh > download-command.txt
read -p "Give the video name: " vname
sed -i -e 's/$/ '$vname'/' curlresult.sh > downlaod-command.txt
cat curlresult.sh
echo
read -p "Waiting..., please check if the curlresult with video name is correct: " waitingi1
for (( i=1; i<=x+1; i++ )); do 
	echo i
	sed -i -e ''$i' s/$/'$i'\"/' curlresult.sh > download-command.txt
	exec cat curlresult.sh | grep \.\/m3u8
done

echo "You are going to download from source #"$((start+1))
command=$(cat curlresult.sh | grep \.\/m3u8)
echo "These are going to be executed, you can copy and run them on different sessions: "$command
read -p "This is the last step before executing parallel download, checking... If everything is OK press ENTER:" waiting2

exec $(echo "bash ./parallel.sh" $command)
