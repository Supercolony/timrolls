import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class databend extends PApplet {

PImage a;  // Declare variable "a" of type PImage
boolean paused = false;
int iterations = 1000;
int count=0;

String format = "jpg";

public void setup() {
  background(0);
  byte[] data=loadBytes("picture."+format);
  a = loadImage("picture."+format);
  saveBytes("output."+format,data);
  size(a.width,a.height,P2D);
}

public void draw() {
  byte[] data=loadBytes("output."+format);

  if (count<=iterations){
    for(int i=0;i<4;i++)
    {
      int loc=(int)random(10,data.length-1);//choose byte outside guessed 128 byte header
      data[loc]=(byte)random(220);
    }

    saveBytes("output."+format,data);
    a = loadImage("output."+format);
    image(a, 0, 0); //redraw modified image
    count++;
  }
}

public void keyPressed() {

  if (key == ' ') { //pause on spacebar
    if (paused) {
      loop();
      paused = false;
    } else {
      noLoop();
      paused = true;
    }
  }

  if (key == 'r') {
    saveFrame("../output/output_####."+format);
  }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "databend" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
