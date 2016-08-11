/*   VPT OSC DEMO 1.0
 by Xeracy (2/19/2011)
 Required Libraries 
 oscP5     - http://www.sojamo.de/libraries/oscP5/
 controlP5 - http://www.sojamo.de/libraries/controlP5/
 */

import oscP5.*;        // oscP5 library
import netP5.*;        // included with oscP5 library
import controlP5.*;    // GUI library

OscP5 oscP5;                               // oscP5 object                      
NetAddress vptControllerAddress;           // VPT IP Address       
OscMessage myMessage = new OscMessage(""); // message object 
ControlP5 controlP5;                       // gui object
RadioButton rb1;

int currentVideo = 0; 

void setup() {
  size(480, 360);
  frameRate(25);

  // use 127.0.0.1 if you are running this on the same computer as VPT. otherwise, use the IP address of the remote machine.
  vptControllerAddress = new NetAddress("127.0.0.1", 6666);   

  // add control sliders (name, min, max, initial, x, y, width, height)
  controlP5 = new ControlP5(this);

  //use two deminsion array to draw a grid of sliders
  String[] UINames = {
    "Fade", "Brightness", "Contrast", "Blur", "Saturation", "Zoom", "Red", "Green", "Blue"
  };
  int[] minNums    = {
    0, 0, 0, 0, 0, -3, 0, 0, 0
  };
  int[] maxNums    = {
    1, 2, 2, 4, 1, 3, 1, 1, 1
  };
  for (int i = 0; i<3; i++) {
    for (int j = 0; j<3; j++) {
      controlP5.addSlider(UINames[i*3+j], minNums[i*3+j], maxNums[i*3+j], 1, 135+j*110, 20+i*110, 90, 90).setId(i*3+j+1);
    }
  }

  //set up radio buttons
  rb1 = controlP5.addRadioButton("radioButtons")
    .setPosition(12, 20)
      .setSize(20, 20)
        .setColorForeground(color(120))
          .setColorActive(color(255, 61, 127))
            .setColorLabel(color(255))
              .setItemsPerRow(2)
                .setSpacingColumn(42)
                  .setSpacingRow(20)
                    .addItem("Layer 1", 0)
                      .addItem("Layer 2", 1)
                        .addItem("Layer 3", 2)
                          .addItem("Layer 4", 3)
                            ;

  // start oscP5, listening for incoming messages at port 10000 
  oscP5 = new OscP5(this, 10000);
  
  //default button 1 (Video 1) is on
  rb1.activate(currentVideo);

  background(0);  
  smooth();
}

void draw() {
  background(0); // keep the background clear.
  //stroke(255);
  //line(175,0,175,height);
}

//  easiest way to send a single OSC message
void sendMsg(String address, float value)
{
  myMessage.clear();                              // clear the message
  myMessage.setAddrPattern(address);              // set the address (ex: "/layer1/fade" 
  myMessage.add(value);                           // add an argument to the address
  println(address + " " + value);
  oscP5.send( myMessage, vptControllerAddress );  // send the message
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(rb1)) {
    print("got an event from "+theEvent.getName()+"\t");
    for (int i=0; i<theEvent.getGroup ().getArrayValue().length; i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
    println("\t "+theEvent.getValue());
    currentVideo = int(theEvent.getGroup().getValue());
    if (currentVideo !=-1) {
      sendMsg("/"+(currentVideo+1)+"layer/blur/on", 1);
      sendMsg("/"+(currentVideo+1)+"layer/brcosa/on", 1);
      sendMsg("/"+(currentVideo+1)+"layer/zoom/on", 1);
    }
  }
}

// each slider calls its own event function:
public void Fade(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/fade", theValue);
}

public void Red(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/red", theValue);
}

public void Green(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/green", theValue);
}

public void Blue(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/blue", theValue);
}

public void Brightness(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/brcosa/brightness", theValue);
}

public void Contrast(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/brcosa/contrast", theValue);
}

public void Saturation(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/brcosa/saturation", theValue);
}

public void Zoom(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/zoom/xzoom", theValue);
  sendMsg("/"+(currentVideo+1)+"layer/zoom/yzoom", theValue);
}

public void Blur(float theValue) {
  sendMsg("/"+(currentVideo+1)+"layer/blur/blur", theValue);
}

