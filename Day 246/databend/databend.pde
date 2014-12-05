PImage a;  // Declare variable "a" of type PImage
boolean paused = false;
int iterations = 1000;
int count=0;

String format = "jpg";

void setup() {
  background(0);
  byte[] data=loadBytes("picture."+format);
  a = loadImage("picture."+format);
  saveBytes("output."+format,data);
  size(a.width,a.height,P2D);
}

void draw() {
  byte[] data=loadBytes("output."+format);

  if (count<=iterations){
    for(int i=0;i<4;i++)
    {
      int loc=(int)random(128,data.length-1);//choose byte outside guessed header size
      data[loc]=(byte)random(249);
    }

    saveBytes("output."+format,data);
    a = loadImage("output."+format);
    image(a, 0, 0); //redraw modified image
    count++;
  }

  //   // if (count<=iterations){
  //   for(int i=64;i<data.length-1;i++)
  //   {
  //     int loc=i;
  //     data[loc]=(byte)random(10);
  //   }

  //   saveBytes("output."+format,data);
  //   a = loadImage("output."+format);
  //   image(a, 0, 0); //redraw modified image
  // //   count++;
  // // }
}

void keyPressed() {

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