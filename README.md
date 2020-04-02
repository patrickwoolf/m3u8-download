# m3u8-download.sh, a semi-automated video downloader
## Author
> patrickwoolf
## Installation
* Change directory into the folder you want to save your videos.
> $ cd $DIR
* Clone directly from this repository
> $ git clone https://github.com/patrickwoolf/m3u8-download.git <br>
> $ cd m3u8-download
## Importance
Download series *in a pack semi-automatically* from several online video sources:
| <img src=./img/screenshot-1.png> | <img src=./img/screenshot-2.png> |
|---|---|
## Usage
> $ bash curl.sh [URL] # URL of whichever episode you are interested in, please note that URL of a overview page doesn't work.<br>
> $ bash curl_preprocessing.sh<br>
> $ bash curl_preprocessing-2.sh<br>
> $ bash curl_postprocessing.sh<br>
> $ bash m3u8-download.sh

You shall be prompted to choose from several m3u8 sources, please choose URLs from the same server. For example, if twelve episodes were provided on the website, and there are 7 servers, then you may be asked to decide the start and end indices of servers (a total of 84). Please be reminded that your input should be like <code>*a* *b*</code>, e.g. <code>73 84</code>.

### What does each script do?
* <code>curl.sh</code> grabs the source code from online video sites.
* <code>curl_preprocessing.sh</code> and <code>curl_preprocessing-2.sh</code> change the m3u8 URLs curled from the website to human readable ones, which is then a text file *curlresult.txt*.
* <code>curl_postprocessing</code> reads and splits each line of the web source into *curlresult.txt*.
* <code>m3u8-download.sh</code> finalizes the prepare process, it reads your input server choice, on which creates *curlresult.sh* based. *curlresult.sh* is a list of command which will be parallely executed thanks to [Alessandro Pezzato](https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal).
* <code>m3u8-download</code> is a script originally created by [williamchanrico](https://github.com/williamchanrico/m3u8-download), using <code>ffmpeg</code> command to grab and combine *.ts* from m3u8 online stream.

## Workarounds for DramaQ
Because for dramaq, grabbing m3u8 directly from curl may not be feasible, here's a sideway you can take to take advantage of the power of m3u8-download.
* First open Firefox and go to the video website of your interest, but do not play now.
  <img src=./img/screenshot-3.png>
* Open Network Monitor pressing shortcut F12, you should see the "Network" button in the toolbar.
  |<img src=./img/screenshot-4.png>|<img src=./img/screenshot-5.png>|
  |---|---|
* Go back to the video player, press F5 or whatever to reload the page. Now you shall play the embedded video.
  <img src=./img/screenshot-6.png>
* Go back to Network Monitor, now type "m3u8" (without ") in the filter on the upper left. You shall see something like index.m3u8 or \*.m3u8 now. 
* Right click on and copy the link, open the terminal on your computer:
  |<img src=./img/screenshot-7.png>|<img src=./img/screenshot-9.png>|
  |---|---|
	* Ubuntu/Fedora and other Linux: 
		* <img src=./img/screenshot-10.png>
	* MacOS
		* Download homebrew.
		* brew install ffmpeg.
		* run m3u8-download above-mentionedly.
	* Windows
		* Download WSL (Windows Subsystem for Linux) from Microsoft Store
		* <img src=./img/wsl-store.png>
		* Choose Ubuntu
		* <img src=./img/ubuntustore.png>
		* Open Ubuntu from your application launcher (press Super/Windows and type in Ubuntu, open the terminal console)
		* download necessary packages from apt
		* > sudo apt install ffmpeg sed git
		* change directory to your windows system, for example, C:\Users\User\Videos\
		* > cd /mnt/c/Users/User/Videos/
		* > git clone https://github.com/patrickwoolf/m3u8-download.git
		* Now you can use this repository smoothly.
		* > bash ./m3u8-download \[URL\] \[FILENAME YOU WANT\]
		* Whoa, your video would be downloaded now. Have a coffee, it will be finished in a few minutes based on the size of the video.
## Acknowledgement
* [Alessandro Pezzato on Stack Overflow](https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal)
* [williamchanrico/m3u8-download](https://github.com/williamchanrico/m3u8-download)
