# FabCafe Taipei Projection Mapping Workshop  
### by Kyle Li    
Workshop 1:VPT7 Basics - Interface and basic usages   
Workshop 2:VPT7 Advanced techniques - control VPT 7 with alternative interfaces through OSC   

Projection Mapping is a technique used to map projection on uneven physical spaces. Building facade, funrniture, ordinary household object, stage, garmet, and our body are common surfaces for projection mapping fun!    

We will be using VPT 7 by HC Gilje, a free and cross-platform projection mapping tool. Besides managing and remixing video sources, VPT 7 is capable of recoding live video and playback, distoring and mapping videos onto uneven physical surfaces, various real-time controls, HD play-back, or even custom interfaces for purpose of interactive installation.    
https://hcgilje.wordpress.com/vpt/  

Programming wise, we will be using Processing, a interface development editor (IDE) designed by MIT for artists and designers. It has massive user community and online resours, very awesome tool for prototyping and experiment.  
https://processing.org  

### Hardware:  
自備筆電的螢幕解析度的垂直像素必須大於768像素，請自行挑整。  

### Download:    
1. On your mobile devices, download LittleOSC  
2. Download VPT 7 software https://hcgilje.wordpress.com/vpt/ unzip and drag the whole folder onto your desktop  
3. Download the latest Processing IDE https://processing.org/download/ You can bypass the donation (No Donation) to download，but if you fall in love with it in the future, donate some then.  
4. Download Processing plugin OscP5，http://www.sojamo.de/libraries/oscP5/ unzip and drag the whole folder onto your desktop for instatllation later.  
5. Download Processing plugin controlP5，http://www.sojamo.de/libraries/controlP5/ unzip and drag the whole folder onto your desktop for instatllation later.  
  
![LittleOSC icon](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/LittleOSC_icon.jpg)
![VPT 7 icon](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/vpt7_icon.jpg)
![Processing icon](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/Processing_icon.jpg)
![OscP5 download](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/OSP5.jpg)
![OscP5 download](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/controlP5.jpg)  

### Setup Network:  
The purpose of this step is to match the IP address on your laptop and on the mobile app so they can talk to each other. The first thing is to make sure your mobile device(s) and your laptop are in the same network.  

####WINDOWS:  
1. Opern Command Prompt and type in ipconfig, press enter key afterward  
2. Find the number behind IPv4 Address，there should be 4 sets of number separated by dots, this is the IP address of your latop  
![Win IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/commandp.jpg)  
3. Open LittleOSC on your mobile devices and type in the IP address found above
4. Type in 6280 in Port   
![IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/loAndriod.jpg)  

####MAC:  
1. Go to Network in your System Preference  
2. In the dialog window, select the network you are using on the left, and on the right you will find your IP address   
![Mac IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/mac_ip.jpg)  
3. Open LittleOSC on your mobile devices and type in the IP address found above  
4. Type in 6280 in Port   
![IPv4 Address](https://github.com/ghettokon/fabcafeTaipei-VPT-7/raw/master/media/loMac.jpg)  

###VPT 7 Preparation

###Little OSC → Processing testing  

###Processing → VPT 7 testing

/sources  
+/1video,/2video,/3video,/4video,/5video,/6video,/7video,/8video  
++/clip s name of video  
++/clipnr i (relative position in sourcemenu, 0:off, 1:first video, 2:second video etc)  
++/rate f (1. normal speed, -1 normal speed backwards)  
++/start t  
++/stop t  
  
/sources  
+/1cam,/2cam  
++/on i (0,1) 
VPT 7 full reference:    
http://nervousvision.com/vpt/vpt7_osc-list.html  

###Party Time!

###Troubleshooting
1. Laptop and mobile device(s) are in the same network
2. Little OSC and laptop has the same ip address
3. Little OSC's port number matches the one in the Processing sketch  
4. Processing is running
5. Wi-Fi Router is competible with UDP and OSC (some networks will intensionally filter UDT and OSC out to avoid data clogging)
