/**
 * leapmotion to VPT 7 example by Kyle Li
 * VPT website http://hcgilje.wordpress.com/vpt
 * Based on osc VPT example by hc gilje and Xeracy
 * based on oscP5sendreceive nexample + oscp5 documentatio by andreas schlegel
 * based on leap_finger_example and leap_position_example example by Michael Heuer
 * oscP5 website at http://www.sojamo.de/oscP5
 */
import oscP5.*;
import netP5.*;

import com.leapmotion.leap.Controller;
import com.leapmotion.leap.Finger;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Vector;
import com.leapmotion.leap.processing.LeapMotion;

OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage myMessage = new OscMessage(""); // message object 

int fingers = 0;
LeapMotion leapMotion;
Vector handpos = new Vector(0, 0, 0);

float threshold = 50; 

void setup() {
  size(300, 300);
  frameRate(25);
  textAlign(CENTER);
  /* start oscP5, listening for incoming messages from custom interface at port 6280 */
  oscP5 = new OscP5(this, 6280);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. In this case to VPT 7
   */

  //make sure this IP address matches the root IP address
  myRemoteLocation = new NetAddress("192.168.1.207", 6666);

  //setting up leapmotion
  leapMotion = new LeapMotion(this);

  sendMsg("/1layer/blur/on", 1);
  sendMsg("/2layer/blur/on", 1);
  sendMsg("/3layer/blur/on", 1);

  sendMsg("/1layer/zoom/on", 1);
  sendMsg("/2layer/zoom/on", 1);
  sendMsg("/3layer/zoom/on", 1);
}


void draw() {
  background(0);

  pushMatrix();
  translate(width/2.0, height-(handpos.getY()-threshold));
  fill(244, 220, 146);
  ellipse(0, 0, 80, 80);
  fill(226, 86, 99);
  textSize(height / 5.0);
  text(String.valueOf(fingers), 0, 20);
  popMatrix();

  switch (fingers) {
  case 1:
    sendMsg("/1layer/fade", (handpos.getY()-50)/height);
    sendMsg("/2layer/fade", (handpos.getY()-50)/height);
    sendMsg("/3layer/fade", (handpos.getY()-50)/height);
    break;

  case 2:
    sendMsg("/1layer/blur/blur", (handpos.getY()-50)/height);
    sendMsg("/2layer/blur/blur", (handpos.getY()-50)/height);
    sendMsg("/3layer/blur/blur", (handpos.getY()-50)/height);
    break;

  case 3:
    sendMsg("/1layer/zoom/xzoom", (handpos.getY()-50)/height);
    sendMsg("/2layer/zoom/xzoom", (handpos.getY()-50)/height);
    sendMsg("/3layer/zoom/xzoom", (handpos.getY()-50)/height);    
    sendMsg("/1layer/zoom/yzoom", (handpos.getY()-50)/height);
    sendMsg("/2layer/zoom/yzoom", (handpos.getY()-50)/height);
    sendMsg("/3layer/zoom/yzoom", (handpos.getY()-50)/height);
    break;

  case 4:

    break;

  case 5:

    break;
  }
}

void onFrame(final Controller controller)
{
  fingers = countExtendedFingers(controller);
}

int countExtendedFingers(final Controller controller)
{
  int fingers = 0;
  if (controller.isConnected())
  {
    Frame frame = controller.frame();
    if (!frame.hands().isEmpty())
    {
      for (Hand hand : frame.hands ())
      {
        handpos = hand.wristPosition();
        println(handpos.getY());
        if (handpos.getY()<threshold) {
          handpos = new Vector(handpos.getX(), threshold, handpos.getZ());
        }
        if (handpos.getY()>height+50) {
          handpos = new Vector(handpos.getX(), height+50, handpos.getZ());
        }        
        int extended = 0;
        for (Finger finger : hand.fingers ())
        {
          if (finger.isExtended())
          {
            extended++;
          }
        }
        fingers = Math.max(fingers, extended);
      }
    }
  }
  return fingers;
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

