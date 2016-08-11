/**
 * mic to VPT 7 example by Kyle Li
 * VPT website http://hcgilje.wordpress.com/vpt
 * Based on osc VPT example by hc gilje and Xeracy
 * based on oscP5sendreceive nexample + oscp5 documentatio by andreas schlegel
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;
import ddf.minim.*;
import controlP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage myMessage = new OscMessage(""); // message object 

Minim minim;
AudioInput in;

ControlP5 controlP5;   
int knobValue = 20;
Knob myKnob;

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
  myRemoteLocation = new NetAddress("192.168.2.105", 6666);

  controlP5 = new ControlP5(this);
   
  myKnob = controlP5.addKnob("Threshold")
    .setRange(0, 50)
      .setValue(20)
        .setPosition(70, 20)
          .setRadius(80)
            .setNumberOfTickMarks(50)
              .setTickMarkLength(1)
                .snapToTickMarks(true)
                  .setColorForeground(color(255))
                    .setColorBackground(color(0, 160, 100))
                      .setColorActive(color(255, 255, 0))
                        .setDragDirection(Knob.VERTICAL)
                          ;


  minim = new Minim(this);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}


void draw() {
  background(0);
  
  stroke(250,105,0);
  line(0, 240-knobValue, width, 240-knobValue);
  
  stroke(255);
  float a = 0; 

  for (int i = 0; i < in.bufferSize () - 1; i++)
  {
    //line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    //line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
    float b = (in.left.get(i)*50 + in.right.get(i)*50)/2;
    if (b>a) {
      a = b;
    }
    line( i, 240 + b, i+1, 240 + b );
  }

  //println(a);

  if (a>knobValue) {
    int c = int(random(1, 4));
    sendMsg("/sources/"+c+"video/clipnr", int(random(2, 5)));
  }
}

void Threshold(int theValue) {
  knobValue = theValue;
  println("a knob event. setting background to "+theValue);
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

