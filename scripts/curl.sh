m -v curlresult.txt
while read -r line; do
        echo "$line" >> curlresult.txt
	done <<< $(curl $@ | grep -ohP https.*?index\.m3u8 | sed -e 's/https.*\%24//g' -e 's/\\//g')
echo "created curlresult.txt"
