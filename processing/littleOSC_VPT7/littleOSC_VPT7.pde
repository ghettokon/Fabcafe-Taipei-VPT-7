/**
 * LittleOSC to VPT 7 example by Kyle Li
 * VPT website http://hcgilje.wordpress.com/vpt
 * Based on osc VPT example by hc gilje and Xeracy
 * based on oscP5sendreceive nexample + oscp5 documentatio by andreas schlegel
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage myMessage = new OscMessage(""); // message object 

void setup() {
  size(300, 300);
  frameRate(25);
  /* start oscP5, listening for incoming messages from custom interface at port 6280 */
  oscP5 = new OscP5(this, 6280);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. In this case to VPT 7
   */
  
  //make sure this IP address matches the root IP address
  myRemoteLocation = new NetAddress("192.168.1.207", 6666);
}


void draw() {
  background(0);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  theOscMessage.print();
  print("osc address ");
  println(theOscMessage.addrPattern());
  print("osc arguments ");
  println(theOscMessage.arguments());
  print("osc typetag ");
  println(theOscMessage.typetag());

  //detect which button is which
  if (theOscMessage.checkAddrPattern("/1/push1")==true) {
    sendMsg("/sources/1video/clipnr", int(random(2,5)));
  }
  if (theOscMessage.checkAddrPattern("/1/push2")==true) {
    sendMsg("/sources/2video/clipnr", int(random(2,5)));
  }
  if (theOscMessage.checkAddrPattern("/1/push3")==true) {
    sendMsg("/sources/3video/clipnr", int(random(2,5)));
  }
  if (theOscMessage.checkAddrPattern("/1/push4")==true) {
    sendMsg("/sources/4video/clipnr", int(random(2,5)));
  }
}

//  easiest way to send a single OSC message
void sendMsg(String address, float value)
{
  myMessage.clear();                              // clear the message
  myMessage.setAddrPattern(address);              // set the address (ex: "/layer1/fade" 
  myMessage.add(value);                           // add an argument to the address
  println(address + " " + value);
  oscP5.send( myMessage, myRemoteLocation);  // send the message
}

