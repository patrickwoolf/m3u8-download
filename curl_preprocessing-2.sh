while read -r line; do
	echo "$line" > curlresult.txt
done <<< $(cat curlresult.txt | grep \.m3u8 | sed -e 's/'%2F'/\//g')
