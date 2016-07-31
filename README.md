# FabCafe Taipei Projection Mapping Workshop  
# 光雕投影工作坊 by Kyle Li

### Hardware (硬體需求):  
自備筆電的螢幕解析度的垂直像素必須大於768像素，請自行挑整。  

### Download (下載):    
1. 手機部分:下載 LittleOSC APP  
2. 下載 VPT 7 軟件 https://hcgilje.wordpress.com/vpt/ 下載解壓縮後，把整個檔案夾放在桌面上。  
3. 下載 Processing 最新版本 https://processing.org/download/ 可以選不捐款(No Donation)跳過直接下載，將來常用的話，建議未來多少捐一點。   
4. 下載 Processing 插件1 OscP5，http://www.sojamo.de/libraries/oscP5/ 下載解壓縮後，把整個 OscP5 檔案夾放在桌面上方便等一下安裝。 
5. 下載 Processing 插件2 controlP5，http://www.sojamo.de/libraries/controlP5/ 下載解壓縮後，把整個 controlP5 檔案夾放在桌面上方便等一下安裝。 
  
![LittleOSC icon](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/LittleOSC_icon.jpg)
![VPT 7 icon](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/vpt7_icon.jpg)
![Processing icon](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/Processing_icon.jpg)
![OscP5 download](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/OSP5.jpg)
![OscP5 download](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/controlP5.jpg)  

### Setup Network (網路設定):  
此步驟的用意是將 LittleOSC 的網路設定正確，所以你的筆電可以收到你的 LittleOSC 所送出的 OSC 訊息。務必確定你的筆電和你的手機在同一個網路裡。

WINDOWS:  
1. 打開Command Prompt, 輸入ipconfig然後按ENTER鍵。  
2. 找出你的筆電所屬的IPv4 Address，幒共會有四個數字，這個是你筆電在此網路中的位址。  
![IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/commandp.jpg)  
  
3. 在你的手機或平板開啟 LittleOSC APP，把剛剛找到的位址輸入進去。Port 的部分填 6280   
![IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/loAndriod.jpg)  
  
MAC:

