while read -r line; do
	echo "$line" >> curlresult.txt
done <<< $(cat curlresult.txt | grep -ohP https\:\/\/.*?index\.m3u8 |  tail +2 | sed -e 's/https.*\%24//g')
