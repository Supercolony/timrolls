
ParticleManager pm;

PShader flipHalf;
PShader flipHalfY;

boolean record = false;
boolean flipX = false;
boolean flipY = false;

int artnum   = 4;
PImage[] art = new PImage[artnum];
PImage img;
PGraphics container;

int arrayMax = 200;
color[] arrayColor;
int[]   arrayInt;

int maxBursts = 100;
int counter;

PVector loc;

void setup() {
	size(displayWidth, displayHeight, P3D);
	
        H.init(this).background(#e7e7e7).autoClear(false);
	
        smooth(); 
        hint(DISABLE_DEPTH_TEST);

//	container = createGraphics(width,height, P3D);

	pm = new ParticleManager();

	img = loadImage("color.jpg");

        flipHalf = loadShader("flipHalf.glsl");
        flipHalfY = loadShader("flipHalfY.glsl");
        
        loc = new PVector( width/2, height/2);

//load art assets
for (int i = 0; i < artnum; ++i) { 
		String temp = (String)"0"+(i+1)+".png";
		art[i] = loadImage(temp);
                
	}

	  arrayColor = new color[ arrayMax ]; // aray of colors
          arrayInt   = new color[ arrayMax ]; // array of corresponding positions

// fill array with colors
      for (int i = 0; i < arrayMax; i++) {
            float tempPos = (img.width / arrayMax) * i;
            arrayColor[i] = img.get(Math.round(tempPos), 0); //get color based on tempPos
            arrayInt[i] = i; //fill int array with sequential values
	}  


}

void draw() {
//	H.drawStage();
	
        counter++;
        loc.set((int)random(width), random(300,height-300));
	if(counter <= maxBursts){
		 addParticleBurst(loc, (int)random(arrayMax));
	}

	pm.run();


//	image(container,0,0);

	//flip left/right
//	pushMatrix();
//		scale(-1,1);
//		translate(-width,0);
//		image(container,0,0);
//	popMatrix();


//	 saveFrame("../frames/#########.jpg"); if (frameCount == 450) exit();
  
  if (flipY){
  filter(flipHalfY); //flip half composition with glsl shader
  }
  if (flipX){
  filter(flipHalf); //flip half composition with glsl shader
  }
  
  frame.setTitle(int(frameRate) + " fps " + frameCount + " total frames"); //set framerate to window title
  
  
}

void addParticleBurst( PVector _loc, int arrayPos ) {
	ParticleSystem ps = new ParticleSystem(_loc, arrayPos);
	pm.createSystem(ps);
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


  if (key == 'r') {
    record = true;
    // saveFrame("tif/render_####.tif");
    saveFrame("jpg/render_####.jpg");
    saveFrame("png/render_####.png");
  }

  if (key == CODED) {
    if (keyCode == UP) {
      if(flipY==false){
      flipY=true;
      }
      else{flipY=false;}
    }
    
    if (keyCode == RIGHT) {
      if(flipX==false){
      flipX=true;
      }
      else{flipX=false;}
    }
  }

}
