while read -r line; do
	echo "$line" > curlresult.txt
done <<< $(curl $@ | grep \.m3u8)
