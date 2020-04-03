if [[ -n $(echo "$1" | grep youtu) ]]; then
	youtube-dl $1 -f mp4 -o "./videos/%(title)s.%(ext)s"
	exit
else
	cd scripts
	bash curl.sh $1
	bash curl-preprocessing.sh
	bash m3u8-download.sh
fi
