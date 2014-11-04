import ddf.minim.*;

boolean record;

PVector[]  tabPoint;
int        circlePoints = 512;
int        circleSize   = 200;

AudioPlayer player;
Minim minim;

HColorPool colors;
int temp;

void setup() {
  size(1280,720, P3D);
  H.init(this).background(#01191c).use3D(true);
  // background(0);
  frameRate(10);


    colors = new HColorPool()

    .add(#072428) //white
    .add(#001214,5) //grey
    .add(#234d51) //light orange
    .add(#194c52) // grey
    .add(#2a8691) //purple
    .add(#6dd2ab) //light purp
    .add(#e6ffe4) //teal
    .add(#75dec3) //pink
    .add(#c2f4cc) //green
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
    tabPoint[i] = new PVector(circleSize*cos(angle*i), circleSize*sin(angle*i), circleSize*cos(angle*i+10));
  }
  
  minim = new Minim(this);
  
  // load file
  player = minim.loadFile("Illabye.mp3",512);
  // play file
  player.play();

  smooth();

}

void draw()
{
  PVector move = new PVector();
  
  temp= colors.getColor();
  noFill();
  stroke(temp,10);
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
    move.z = tabPoint[i].z;
    move.normalize();
    move.mult(player.mix.get(i)*30);
    tabPoint[i].x += move.x;
    tabPoint[i].y += move.y;
    tabPoint[i].y += move.z;
  }

  // if(frameCount % 1 == 0 && frameCount < 360){
    saveFrame("../frames/image-#####.png");
  // }

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
    // record = true;
    saveFrame("png/render_####.png");

  }

  if (key == 'c') {

  }

}



