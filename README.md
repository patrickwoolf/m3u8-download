# pwdownloader.sh, a semi-automated video downloader
## Author
> patrickwoolf
## Importance
Download online videos in *whole series semi-automatically* from several mainstream video streamers online, e.g. [小鴨影音](http://www.777drama.com/), [Gimy劇迷](https://gimy.tv/), [MOMOVOD](https://www.momovod.com/), [楓林TV](https://fenglin.tv/), ...:
*The above streaming sites are currently down, there's temporary workaround compatible with kubo, please pull from [sitesclosed branch](https://github.com/patrickwoolf/m3u8-download/tree/sitesclosed).*
<img src=./img/screenshot-1.png> 
<img src=./img/screenshot-2.png>
## Installation                                                                                                     
* Change directory into the folder you want to save your videos.                                        
```bash                                           
$ cd $DIR                                                                                               
```
<details>
	<summary>[← ] If you are a <b>Windows user</b>, you could download <b>Ubuntu WSL</b> from Microsoft Store, and run the commands below.</summary>

* <img src=./img/wsl-store.png>
* <img src=./img/ubuntustore.png>
* Open Ubuntu from your application launcher (press Super/Windows and type in Ubuntu, open the terminal console)
* Download necessary packages from apt: 
``` bash 
$ sudo apt install ffmpeg sed git
```
* Change directory to your windows system, for example, C:\Users\User\Videos\ 
```bash 
$ cd /mnt/c/Users/User/Videos/
```
</details>

<details>
	<summary>If you are a <b>iOS user</b>, you could download <a href="https://testflight.apple.com/join/97i7KM8O">iSH from Testflight</a>, and do the following command:</summary>

``` bash
$ apk add git
$ git clone -b iOS https://github.com/patrickwoolf/m3u8-download.git
$ cd m3u8-download
$ ash setup.sh
```
And now you could jump to [Usage](https://github.com/patrickwoolf/m3u8-download/tree/master#usage).
</details>

* Clone directly from this repository
```bash
$ git clone https://github.com/patrickwoolf/m3u8-download.git
$ cd m3u8-download
$ bash setup.sh
```
## Usage
### If you want to download videos from YouTube...
```bash
$ bash pwdownloader.sh [YouTube url]
```
..., the above command works just fine.
### Other sites
You can download from several video streamers online, e.g. [Gimy劇迷](https://gimy.tv/), [MOMOVOD](https://www.momovod.com/), [楓林TV](https://fenglin.tv/), ...
```bash
$ bash pwdownloader.sh [URL] # URL of whichever episode of the TV show will be fine, tye code will grab all epispdes available for you. Please note that URL of a overview page doesn't work.
```

<!--
```bash 
$ bash curl.sh [URL] # URL of whichever episode you are interested in, please note that URL of a overview page doesn't work.
$ bash curl_preprocessing.sh
$ bash m3u8-download.sh
```
-->

You shall be prompted to choose from several m3u8 sources, please choose URLs from the same server. 
<img src=./img/screenshot-11.png>
For example, if one show has 6 episodes in total, and there are 5 servers, then you may be asked to decide the start and end indices of servers (a total of 30). Please be reminded that your input should be like <code>*a* *b*</code>, e.g. <code>19 24</code>.
<img src=./img/screenshot-12.png>
<img src=./img/screenshot-13.png>

Then you would be able to type in the video name you want, notice that the episode number would be added automatically later, it's not necessary to type the episodes as well.
<img src=./img/screenshot-14.png>
Check if the video name is correct...
<img src=./img/screenshot-15.png>
Check if the episodes are correct..., the bash script would be copied to a file named <code>download-command.sh</code>
<img src=./img/screenshot-16.png> 

After these process your videos will be downloaded in ./videos.

### What does each script do?
* <code>curl.sh</code> grabs the source code from online video sites.
* <code>curl_preprocessing.sh</code> changes the m3u8 URLs curled from the website to human readable ones, which is then a text file *curlresult.txt*.
* <code>m3u8-download.sh</code> finalizes the prepare process. It reads your input server choice, on which *curlresult.sh* based. *curlresult.sh* is a list of command which will be parallely executed.
* <code>parallel.sh</code> is a script to assign multiple commands to PID, allowing parallel execution. Credit belongs to [Alessandro Pezzato](https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal).
* <code>m3u8-download</code> is a script originally created by [williamchanrico](https://github.com/williamchanrico/m3u8-download), using <code>ffmpeg</code> command to grab and combine *.ts* from m3u8 online stream.

## Workarounds for DramaQ
Because for dramaq, grabbing m3u8 directly from curl may not be feasible, here's a sideway you can take to take advantage of the power of m3u8-download.
* First open Firefox and go to the video website of your interest, but do not play now.
  <img src=./img/screenshot-3.png>
* Open Network Monitor pressing shortcut F12, you should see the "Network" button in the toolbar.
  <img src=./img/screenshot-4.png>
  <img src=./img/screenshot-5.png>
* Go back to the video player, press F5 or whatever to reload the page. Now you shall play the embedded video.
  <img src=./img/screenshot-6.png>
* Go back to Network Monitor, now type "m3u8" (without ") in the filter on the upper left. You shall see something like index.m3u8 or \*.m3u8 now. 
* Right click on and copy the link, open the terminal on your computer:
  <img src=./img/screenshot-7.png>
  <img src=./img/screenshot-9.png>
	* Ubuntu/Debian and other Linux: 
		```bash
		$ bash ./scripts/m3u8-download [m3u8 url] [FILENAME]
		```
	* MacOS
		* Download homebrew.
		* brew install ffmpeg.
		```bash
		$ bash ./scripts/m3u8-download [m3u8 url] [FILENAME]
		```
	* Windows
		<details>
			<summary>Download WSL (Windows Subsystem for Linux) from Microsoft Store</summary>
		
		* <img src=./img/wsl-store.png>
		* Choose Ubuntu
		* <img src=./img/ubuntustore.png>
		* Open Ubuntu from your application launcher (press Super/Windows and type in Ubuntu, open the terminal console)
		* download necessary packages from apt
		```bash
		$ sudo apt install ffmpeg sed git
		```
		* change directory to your windows system, for example, C:\Users\User\Videos\
		```bash
		$ cd /mnt/c/Users/User/Videos/
		$ git clone https://github.com/patrickwoolf/m3u8-download.git
		$ cd m3u8-download/
		```
		</details>
		
		* Now you can use this repository smoothly.
		```bash
		$ bash ./scripts/m3u8-download [URL] [FILENAME YOU WANT]
		```
		* Whoa, your video would be downloaded now. Have a coffee, it will be finished in a few minutes based on the size of the video.
## Acknowledgement
* [Alessandro Pezzato on Stack Overflow](https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal)
* [williamchanrico/m3u8-download](https://github.com/williamchanrico/m3u8-download)
