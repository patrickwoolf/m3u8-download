#!/bin/bash
#bash curl.sh [URL] 
#bash curl_preprocessing.sh 
## YouTube support
if [[ -n $1 ]]; then
	if [[ -z $(grep "youtub-dl" -r /usr/local/bin/ /usr/bin/) ]]; then
		sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

		sudo chmod a+rx /usr/local/bin/youtube-dl
	fi
	youtube-dl $1 -f mp4 -o "./videos/%(title)s.%(ext)s"
fi
## Main code starts here:
cp ./curlresult.txt ./curlresult.sh
cat curlresult.sh
n=$(wc -l < curlresult.sh)
mkdir -p ../videos
echo
echo 'Total number of m3u8 sources available: ' $n
read -p "Please choose which server you want (e.g. you.tube): " 'server'
echo "Your server first appears on the list at index" $(grep -n -m 1 "$server" ./curlresult.sh | sed  's/\([0-9]*\).*/\1/')
echo
echo -e "Please input start and end indices of the episodes you want to download: (If you want \e[3mx\e[0m episodes downloaded, and the number shown above is \e[3ma\e[0m, then the 2nd input should be \e[3ma+x-1\e[0m)"
read -p "Start (a) End (a+x-1) " input1 input2
start=$input1
end=$input2
s=$start
ee=$end
x=$((end-start))
sed -i -e 's#^#\"\./m3u8-download #' curlresult.sh > download-command
sed -i -e ''$s','$ee'!d' curlresult.sh > download-command
read -p "Give the video name (no space): " vname
sed -i -e 's#$# \..\/videos\/#' curlresult.sh > download-command
sed -i -e 's/$/'$vname'/' curlresult.sh > download-command
read -p "Which episode does your download start with? " ep
for (( i=1; i<=x+1; i++ )); do 
	sed -i -e ''$i' s/$/'$ep'\"/' curlresult.sh > download-command
	ep=$(($ep+1))
done
cat curlresult.sh
echo
read -p "Waiting..., please check if the curlresult with video name is correct: " waiting1
echo "You are going to download from source #"$((start))
command=$(cat curlresult.sh | grep \.\/m3u8)
echo
echo "These are going to be executed, you can copy and run them on different sessions: "
echo
echo "bash ./parallel.sh" $command > download-command.sh
cat download-command.sh
echo "............................................."
echo
read -p "This is the last step before executing parallel download, checking... If everything is OK press ENTER:" waiting2
echo "du -h ../videos/"$vname"* | cut -f1" >> download-command.sh
#exec $(echo "bash ./parallel.sh" $command)
exec bash download-command.sh
