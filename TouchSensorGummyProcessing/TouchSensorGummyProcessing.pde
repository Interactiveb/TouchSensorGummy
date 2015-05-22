import processing.serial.*;
import ddf.minim.*;
import ddf.minim.effects.*;

Serial _port;
int buttonValue = 0;
int lastbutton = 0;

//<------Static States------>
PImage bg;
PImage Pink;
PImage Yellow;
PImage Blue;
PImage Green;
//<-----LaughPoses----->
PImage P1;
PImage Y1;
PImage B1;
PImage G2;
//<-----Place Holders---->
PImage place;
PImage BearP;
PImage BearY;
PImage BearB;
PImage BearG;
//<-----




AudioSample w;
AudioSample s;
AudioSample d;
AudioSample a;

AudioPlayer player;
Minim minim;

void setup() {
  size(1149, 858);
  frameRate(10);
  //Background
  bg = loadImage ("Tropic.jpg");
  //Bears
  Pink=loadImage ("P.png");
  Yellow=loadImage ("Y.png");
  Blue=loadImage ("B.png");
  Green=loadImage ("G.png");
  //Laughs
  P1=loadImage ("P1.png");
  Y1=loadImage ("Y1.png");
  B1=loadImage ("B1.png");
  G2=loadImage ("G2.png");
  place = bg;
  BearP = Pink;
  BearY = Yellow;
  BearB = Blue;
  BearG = Green;

  //Pink=P1;
  //BearY=Y1;
  //BearB=B1;
  //BearG=G1;
  minim = new Minim (this);

  w = minim.loadSample("laugh_female.mp3");
  s = minim.loadSample("7_year_old_boy_laughs.mp3");
  d = minim.loadSample("evil_clown_laugh.mp3");
  a = minim.loadSample("laugh_short_goofy_male.mp3");

  _port = new Serial(this, "/dev/tty.usbmodem1451", 9600);
  _port.bufferUntil('\n');
}
void serialEvent(Serial p) {
  try {
    String str = p.readStringUntil('\n');

    String[] tokens = splitTokens(str, " \r\n\t,");
    //splitTokens(s, " "); //we didn't do this
    if (tokens.length >= 1) {

      buttonValue = (Integer.parseInt(tokens[0])); 
      //<-----Calling Audio----->
      if ( buttonValue!=lastbutton) {
        if ( buttonValue == 1) w.trigger();

        if ( buttonValue == 2) s.trigger();
        if ( buttonValue == 3) d.trigger();
        if ( buttonValue == 4) a.trigger();
        //<----Calling Images---->
        if (buttonValue == 1) {  //curly brace! no semicolon.
          BearP = P1;
        }

        if (buttonValue == 2) {  
          BearY = Y1;
        }
        if (buttonValue == 3) {  
          BearB = B1;
        }
        if (buttonValue == 4) {  
          BearG = G2;
        }    //end the if statement. Now we are done with it

        if (buttonValue == 0) {
          keyReleased();  //stop the sounds
          //<-----reset the bear----->
          BearP = Pink;    
          BearY = Yellow;
          BearB = Blue;
          BearG = Green;
        }

        lastbutton=buttonValue;
      }

      println(buttonValue);
    } //test sensor
  }
  catch (Exception ex) {
    println(ex.getMessage());
  }
}  //close out our function
void draw() {
  background (0);
  imageMode(CENTER);
  image(place, width/2, height/2);
  image(BearP, width/2, height/2);
  image(BearY, width/2, height/2);
  image(BearB, width/2, height/2);
  image(BearG, width/2, height/2);

  //<--->
}

//void draw() { 
//if (Gbutton >= 0 ) {//then 
//float bgColor = map(Gbutton, 0, 4, 0, 255);
//background(bgColor);
//}

//void  keyPressed() {
//playing audio----Need to link them now to capacitator
// if ( key == 'w'|| key=='1') w.trigger();
// if ( key == 's'|| key=='2') s.trigger();
//  if ( key == 'd'|| key=='3') d.trigger();
// if ( key == 'a'|| key=='4') a.trigger();
//Image loading

// if (keyPressed) {
//   if (key == 'w' || key == '1') {
//place = P1;
//  } else if (key == 's' || key == '2') {
//place = Y1;
//   }
//  if (key == 'd' || key == '3') {
//  place = B1;
//  } else if (key == 'a' || key == '4') {
//    place = G1;//
//  }
//  }
//}

//wwprintln ("Pressed" + millis());


void keyReleased() {
  println("Released  " + millis());
  // when releasing button so does sound
  w.close();
  w = minim.loadSample("laugh_female.mp3");
  s.close();
  s = minim.loadSample("7_year_old_boy_laughs.mp3");
  a.close();
  a = minim.loadSample("laugh_short_goofy_male.mp3");
  d.close();
  d = minim.loadSample("evil_clown_laugh.mp3");
}
// always stop Minim before exiting
// minim.stop();
//if ((key == 'a') || (key == 'a')) {
// player.play();

