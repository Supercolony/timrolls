import de.voidplus.leapmotion.*;
LeapMotion leap;

ParticleManager pm;

PShader flipHalf;
PShader flipHalfY;

boolean record = false;
boolean flipX = false;
boolean flipY = false;

PImage[] imgs = new PImage[7];
PGraphics container;

void setup() {
	size(displayWidth, displayHeight, P3D);
	H.init(this).background(#ECECEC).use3D(true).autoClear(false);
	smooth();

	container = createGraphics(width/2,height,P3D);

	leap = new LeapMotion(this);

	pm = new ParticleManager();

	imgs[0] = loadImage("01.png");
	imgs[1] = loadImage("02.png");
	imgs[2] = loadImage("03.png");
	imgs[3] = loadImage("04.png");
	imgs[4] = loadImage("05.png");
  imgs[5] = loadImage("06.png");
  imgs[6] = loadImage("07.png");    

	hint(DISABLE_DEPTH_TEST);
}

void draw() {
	H.drawStage();

	for(Hand hand : leap.getHands() ) {
		for(Finger finger : hand.getFingers() ) {
			PVector finger_tip = finger.getPositionOfJointTip();

			int fingerType = finger.getType();

			switch (fingerType) {
				// thumb
				case 0:
				// addParticleBurst(fingerType, finger_tip, #000000);
				break;

				// index
				case 1:
				addParticleBurst(fingerType, finger_tip, #ffffff);
				break;

				// middle
				case 2:
				addParticleBurst(fingerType, finger_tip, #FF3300);
				break;

				// ring
				case 3:
				addParticleBurst(fingerType, finger_tip, #000000);
				break;

				// pinky
				case 4:
				addParticleBurst(fingerType, finger_tip, #ec8300);
				break;
			}
		}
	}

	pm.run();

	container.tint( (int)random(255) );

	image(container,0,0);

	pushMatrix();
		scale(-1,1);
		translate(-width,0);
		image(container,0,0);
	popMatrix();

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

	saveFrame("../frames/#########.tif"); if (frameCount == 450) exit();
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














