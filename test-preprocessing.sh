cp testresult.txt testresulttmp.txt
rm testresult.txt
while read -r line; do
	echo "$line" >> testresult.txt
done <<< $(cat testresulttmp.txt | grep \.m3u8 | sed -e 's/'%3A'/:/g')
