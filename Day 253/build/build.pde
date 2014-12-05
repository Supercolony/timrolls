import de.voidplus.leapmotion.*;
LeapMotion leap;

ParticleManager pm;

PShader flipHalf;
PShader flipHalfY;

boolean record = false;
boolean flipX = false;
boolean flipY = false;

int artnum   = 7;
PImage[] art = new PImage[artnum];
PGraphics container;

void setup() {
	size(displayWidth, displayHeight, P3D);
	H.init(this).background(#ECECEC).use3D(true).autoClear(false);
	smooth();

	blendMode(OVERLAY);

	container = createGraphics(width,height,P3D);

	leap = new LeapMotion(this);

	pm = new ParticleManager();

for (int i = 0; i < artnum; ++i) {
		String temp = (String)"0"+(i+1)+".png";
		art[i] = loadImage(temp);
	}  

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
				addParticleBurst(fingerType, finger_tip, #ec1c91);
				break;

				// ring
				case 3:
				addParticleBurst(fingerType, finger_tip, #000000);
				break;

				// pinky
				case 4:
				addParticleBurst(fingerType, finger_tip, #662d94);
				break;
			}
		}
	}

	pm.run();

	// container.tint( (int)random(255) );

	image(container,0,0);

	//flip left/right
	// pushMatrix();
	// 	scale(-1,1);
	// 	translate(-width,0);
	// 	image(container,0,0);
	// popMatrix();

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














