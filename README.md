# m3u8-download.sh, a semi-automated video downloader based on ffmpeg utilizing online m3u8 filetype
## Installation
* Change directory into the folder you want to save your videos.
> $ cd $DIR
* Clone directly from this repository
> $ git clone https://github.com/patrickwoolf/m3u8-download <br>
> $ cd m3u8-download
## Importance
*Download series in a pack semi-automatically from several online video sources:*
| <img src=./img/screenshot-1.png> | <img src=./img/screenshot-2.png> |
|---|---|
## Usage
> $ bash curl.sh [URL]<br>
> $ bash curl_preprocessing.sh<br>
> $ bash curl_preprocessing-2.sh<br>
> $ bash curl_postprocessing.sh<br>
> $ bash m3u8-download.sh

* You shall be prompted to choose from the m3u8 sources, please choose URLs from the same server. For example, if twelve episodes were provided on the website, and there are 7 servers, then you may be asked to decide the start and end indices of servers (a total of 84). Please be reminded that your input should be like <code>*a* *b*</code>, e.g. <code>73 84</code>.

### What does each script do?
* <code>curl.sh</code> grabs the source code from online video sites.
* <code>curl_preprocessing.sh</code> and <code>curl_preprocessing-2.sh</code> change the m3u8 URLs curled from the website to human readable ones, which is then a text file *curlresult.txt*.
* <code>curl_postprocessing</code> reads and splits each line of the web source into *curlresult.txt*.
* <code>m3u8-download.sh</code> finalizes the prepare process, it reads your input server choice, on which creates *curlresult.sh* based. *curlresult.sh* is a list of command which will be parallely executed thanks to [Alessandro Pezzato](https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal).
* <code>m3u8-download</code> is a script originally created by [williamchanrico](https://github.com/williamchanrico/m3u8-download), using <code>ffmpeg</code> command to grab and combine *.ts* from m3u8 online stream.

## Acknowledgement
* [Alessandro Pezzato on Stack Overflow](https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal)
* [williamchanrico/m3u8-download](https://github.com/williamchanrico/m3u8-download)
