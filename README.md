# FabCafe Taipei Projection Mapping Workshop  
### 光雕投影工作坊 by Kyle Li  
工作坊1:VPT7基本==講解VPT7的介面和使用方法   
工作坊2:VPT7進階==講解利用 Processing 和 OSC(Open Sound Control) 來作為各式客製控制介面與 VPT 7 之間的橋樑

立體光雕 ( Projection Mapping )，也可以解讀成動態影像貼圖或空間式的擴增實境，是一種利用投影技術來將一個擁有不規則面的實體物件轉化成為一個可以投影的屏幕。一般來說，建築物的外牆、家具、生活雜物、表演的舞台、服裝和人的身體都是理想的立體光雕對象。

這個工作坊所用的工具叫做 VPT 7 (Video Projection Tool) 是由 HC Gilje 設計的免費的多功能軟體，適用於蘋果和微軟。除了一般投影的合成外，VPT更可以用來將動態影像投影在複雜的物體表面上、整合預錄和
即時的影片投射、midi 控制器、多螢幕的HD高畫質播放、或者是使用在以微處理器(Arduino)或是攝像追蹤為主的互動裝置藝術。  
https://hcgilje.wordpress.com/vpt/

編程的部分我們使用 Processing，由原麻省理工學院學生為設計師和藝術家所設計的編程軟體，有非常大的使用者族群和線上資源。對於原型的製作和測試(Prototyping)來說是一款很方便的工具。  
https://processing.org  

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
此步驟的用意是將 LittleOSC 的網路設定正確，所以你的筆電可以收到你的 LittleOSC 所送出的 OSC 訊息。務必確定你的筆電和你的手機是登入在同一個網路裡。  

####WINDOWS:  
1. 打開Command Prompt, 鍵入ipconfig然後按ENTER鍵。  
2. 找出你的筆電所屬的IPv4 Address，總共會有四個數字，這個是你筆電在此網路中的位址。  
![Win IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/commandp.jpg)  
3. 在你的手機或平板開啟剛剛下載的 LittleOSC APP，把上面找到的位址填進去。  
4. Port 的部分填 6280   
![IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/loAndriod.jpg)  

####MAC:  
1. 去系統偏好(System Preference)裡按下網路(Network)  
2. 網路視窗裡，在左邊選擇你所登入的網路，右邊上方會顯示你現在的IP位址，總共會有四個數字，這個是你筆電在此網路中的位址。  
![Mac IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/mac_ip.jpg)  
3. 在你的手機或平板開啟剛剛下載的 LittleOSC APP，把上面找到的位址填進去。  
4. Port 的部分填 6280   
![IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/loMac.jpg)  

###VPT 7 準備

###Little OSC → Processing 測試

###Processing → VPT 7 測試  
/1video,/2video,/3video,/4video,/5video,/6video,/7video,/8video  
+/clip s name of video  
+/clipnr i (relative position in sourcemenu, 0:off, 1:first video, 2:second video etc)  
+/rate f (1. normal speed, -1 normal speed backwards)  
+/start t  
+/stop t  
/1cam,/2cam  
+/on i (0,1) 
VPT 7 全部可用參數:    
http://nervousvision.com/vpt/vpt7_osc-list.html  

###Party Time!

###Troubleshooting(除錯)  
1. 筆電和手機在同一個網路裡  
2. Little OSC 內的所填的IP位址要和筆電的一樣  
3. Little OSC 內所填的 Port 要和 Processing 程序裡接收的 Port 同一個數字  
4. Processing 要按 Play
5. Wi-Fi Router 要支援 UDP 和 OSC 的傳輸(一般都會支援，除非有經過特殊設定)
