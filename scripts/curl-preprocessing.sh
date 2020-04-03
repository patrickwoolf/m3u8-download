cp curlresult.txt curlresulttmp.txt
rm curlresult.txt
while read -r line; do
	echo "$line" >> curlresult.txt
done <<< $(cat curlresulttmp.txt | grep \.m3u8 | sed -e 's/'%3A'/:/g' -e 's/'%2F'/\//g')
