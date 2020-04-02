while read -r line; do
        echo "$line" >> testresult.txt
done <<< $(curl $@ | grep -ohP https.*?index\.m3u8 | sed -e 's/https.*\%24//g')
