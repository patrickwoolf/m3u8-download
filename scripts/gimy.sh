rm -v curlresult.txt
read -p "Start episode from: " start
read -p "End episode at: " ep
for (( i="$start"; i<="$ep"; i++ )); do
	while read -r line; do
		echo "$line" >> curlresult.txt
	done <<< $(curl `echo $1 | sed -e 's/.\.html/'$i'\.html/g'` | grep -ohP 'http[^ ]*index.m3u8' | grep -ohP http.*?index\.m3u8 | sed -e 's/\\//g' | sed -e '/\?/d') 
done
sed '$!N; /^\(.*\)\n\1$/!P; D' -i curlresult.txt
