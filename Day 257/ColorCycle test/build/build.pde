import de.voidplus.leapmotion.*;
LeapMotion leap;

ParticleManager pm;

//mirroring shaders
PShader flipHalf; PShader flipHalfY; 
//mirroring variables
boolean flipX = false;
boolean flipY = false;

boolean record = false;

PGraphics container;
PImage img;

int artnum   = 7;
PImage[] art = new PImage[artnum]; //create array of assets

int arrayMax = 200; //array size
color[] arrayColor;
int[]   arrayInt;

int assetCounter = 0;
int assetMax = 100; //max particles
ArrayList<Particle> stuff; //array list of particles

void setup() {
	size(displayWidth, displayHeight, P3D);
	H.init(this).background(#ECECEC).use3D(true).autoClear(false);
	smooth();

	container = createGraphics(width,height,P3D);
	leap = new LeapMotion(this);
	pm = new ParticleManager();

	img = loadImage("color.jpg");

//load art assets
for (int i = 0; i < artnum; ++i) { 
		String temp = (String)"0"+(i+1)+".png";
		art[i] = loadImage(temp);
	}

	for (int i = 0; i < arrayMax; i++) {
    float tempPos = (img.width / arrayMax) * i;
    arrayColor[i] = img.get(Math.round(tempPos), 0); //get color based on tempPos
    arrayInt[i] = i; //fill int array with sequential values
  }

  stuff = new ArrayList<Particle>(); //initialize arraylist

 //setup arraylist with colored particles
  for (int j = 0; j < assetMax; j++) {
    stuff.add(new Particle(assetCounter));
    assetCounter++;
    if(assetCounter == arrayMax) assetCounter = 0;
  }

	hint(DISABLE_DEPTH_TEST);
}

void draw() {
	H.drawStage();

      for (int i = 0; i < arrayMax; ++i) {
        int tempNum = arrayInt[i];
        tempNum++;
        if(tempNum == arrayMax) tempNum = 0;
        arrayInt[i] = tempNum;
      }


	for(Hand hand : leap.getHands() ) {
		for(Finger finger : hand.getFingers() ) {
			PVector finger_tip = finger.getPositionOfJointTip();

			int fingerType = finger.getType();


			switch (fingerType) {
				// thumb
				case 0:
				// addParticleBurst(fingerType, finger_tip, imgColors.get((int)random(imgColors.width),0));
				break;

				// // index
				// case 1:
				// addParticleBurst(fingerType, finger_tip, temp);
				// break;

				// // middle
				// case 2:
				// addParticleBurst(fingerType, finger_tip, temp);
				// break;

				// ring
				case 3:
				addParticleBurst(fingerType, finger_tip, 0);
				break;

				// pinky
				case 4:
				addParticleBurst(fingerType, finger_tip, 0);
				break;
			}


		}


	}

		

	pm.run();

	// container.tint( (int)random(255) );

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

	// saveFrame("../frames/#########.tif"); if (frameCount == 450) exit();
  frame.setTitle(int(frameRate) + " fps " + frameCount + " total frames"); //set framerate to window title
}

void addParticleBurst(int i, PVector finger_tip, color clr ) {
	ParticleSystem ps = new ParticleSystem(i, finger_tip, clr);
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
    saveFrame("png/render_####.png");
    // saveHiRes(2);
    // saveVector();
    // H.drawStage();
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














