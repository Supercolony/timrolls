import ddf.minim.*;

boolean record;

PVector[]  tabPoint;
int        circlePoints = 512;
int        circleSize   = 250;

AudioPlayer player;
Minim minim;

HColorPool colors;
int temp;

void setup() {
  size(800,800);
  H.init(this).background(#efefe7).use3D(false);
  // background(0);
  frameRate(20);

  colors = new HColorPool()

    .add(#ffffff,20) //white
    .add(#cccccc,5) //grey
    .add(#ff8d37) //light orange
    .add(#e7e7e7,20) // grey
    .add(#1c0d68) //purple
    .add(#5001be) //light purp
    .add(#02fcfa) //teal
    .add(#fe39a2) //pink
    .add(#7bfc88) //green
    // .add(#dee7ff)
    // .add(#c7f6fe)
    // .add(#2f3b5c)
    .strokeOnly()
  ;

  //initialize angle array  
  tabPoint = new PVector[circlePoints];
  float angle = TWO_PI/(circlePoints);
  
  for(int i=0;i<circlePoints;i++)
  {
    tabPoint[i] = new PVector(circleSize*cos(angle*i), circleSize*sin(angle*i));
  }
  
  minim = new Minim(this);
  
  // load file
  player = minim.loadFile("LTLP.mp3",512);
  // play file
  player.play();

  smooth();

}

void draw()
{
  PVector move = new PVector();
  
  temp= colors.getColor();
  noFill();
  stroke(temp,100);
  strokeWeight(1);
  translate(width/2,height/2);
  beginShape();
    curveVertex(tabPoint[0].x,tabPoint[0].y);
    for(int i=0;i<circlePoints;i++)
    {
      curveVertex(tabPoint[i].x,tabPoint[i].y);
    } 
    curveVertex(tabPoint[0].x,tabPoint[0].y);
    curveVertex(tabPoint[1].x,tabPoint[1].y);
  endShape(); 
  //--- Animation
  for(int i=0;i<circlePoints;i++)
  {
    move.x = tabPoint[i].x;
    move.y = tabPoint[i].y;
    move.normalize();
    move.mult(player.mix.get(i)*40);
    tabPoint[i].x += move.x;
    tabPoint[i].y += move.y;
  } 
}

void keyPressed() {
  if (key == ' ') {
    if (paused) {
      loop();
      paused = false;
    } else {
      noLoop();
      paused = true;
    }
  }

  // if (key == '+') {
  //  drawThings();
  // }

  if (key == 'r') {
    record = true;
    saveFrame("png/render_####.png");

  }

  if (key == 'c') {

  }

}



