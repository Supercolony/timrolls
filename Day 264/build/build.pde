import de.voidplus.leapmotion.*;
LeapMotion leap;

ParticleManager pm;

PShader flipHalf;
PShader flipHalfY;

boolean record = false;
boolean flipX = false;
boolean flipY = false;

int artnum   = 1;
PImage[] art = new PImage[artnum];
PImage img;
PGraphics container;

int arrayMax = 200;
color[] arrayColor;
int[]   arrayInt;


void setup() {
	size(displayWidth, displayHeight, OPENGL);
	
        H.init(this).background(#f44526).autoClear(false);
        H.add(new HRect(width,height).fill(#f44526).z(-50));
	
        smooth(2); noFill(); noStroke();
        hint(DISABLE_DEPTH_TEST);


	container = createGraphics(width,height, P3D);
	leap = new LeapMotion(this);

	pm = new ParticleManager();

	img = loadImage("color.jpg");

        flipHalf = loadShader("flipHalf.glsl");
        flipHalfY = loadShader("flipHalfY.glsl");

//load art assets
for (int i = 0; i < artnum; ++i) { 
		String temp = (String)"0"+(i+1)+".png";
		art[i] = loadImage(temp);
                int rand = (int)random(100,400); //art min and max size
                art[i].resize(rand,rand);
                
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
	H.drawStage();
//	
//        counter++;
//	if(counter >= arrayMax){
//		counter=0;
//	}

//	color temp = img.get(counter,0);
	
//	println ("counter: "+counter+" legth: "+arrayColor.length);


	for(Hand hand : leap.getHands() ) {
		for(Finger finger : hand.getFingers() ) {
			PVector finger_tip = finger.getPositionOfJointTip();

			int fingerType = finger.getType();


			switch (fingerType) {
				// thumb
				case 0:
				addParticleBurst(fingerType, finger_tip, (int)random(arrayMax));
				break;

				// // index
				case 1:
				addParticleBurst(fingerType, finger_tip, (int)random(arrayMax));
				break;

				// // middle
				case 2:
				addParticleBurst(fingerType, finger_tip, (int)random(arrayMax));
				break;

				// ring
				case 3:
				addParticleBurst(fingerType, finger_tip, (int)random(arrayMax));
				break;

				// pinky
				case 4:
				addParticleBurst(fingerType, finger_tip, (int)random(arrayMax));
				break;
			}


		}


	}

		

	pm.run();

//	container.tint( (int)random(255) );
//        container.beginDraw();
//        container.background(100);
//        container.endDraw();
	image(container,0,0);

	//flip left/right
//	pushMatrix();
//		scale(-1,1);
//		translate(-width,0);
//		image(container,0,0);
//	popMatrix();

	// pushMatrix();
	// 	scale(-1,-1);
	// 	translate(-width,-height);
	// 	image(container,0,0);
	// popMatrix();

	// pushMatrix();
	// 	scale(1,-1);
	// 	translate(0,-height);
	// 	image(container,0,0);
	// popMatrix();

//	 saveFrame("../frames/#########.jpg"); if (frameCount == 450) exit();
  
  if (flipY){
  filter(flipHalfY); //flip half composition with glsl shader
  }
  if (flipX){
  filter(flipHalf); //flip half composition with glsl shader
  }
  
  frame.setTitle(int(frameRate) + " fps " + frameCount + " total frames"); //set framerate to window title
  
  
}

void addParticleBurst(int i, PVector finger_tip, int arrayPos ) {
	ParticleSystem ps = new ParticleSystem(i, finger_tip, arrayPos);
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
