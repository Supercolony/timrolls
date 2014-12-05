import ddf.minim.*;
AudioPlayer player;
Minim minim;

import de.voidplus.leapmotion.*;
LeapMotion leap;

ParticleManager pm;

PShader flipHalf;
PShader flipHalfY;

boolean record = false;
boolean flipX = false;
boolean flipY = false;

int artnum   = 9;
PImage[] art = new PImage[artnum];

void setup() {
	size(1920, 1080, P3D);
	background(#FFFFFF);
	smooth();
	hint(DISABLE_DEPTH_TEST);
	imageMode(CENTER);

	flipHalf = loadShader("flipHalf.glsl");
	flipHalfY = loadShader("flipHalfY.glsl");

	minim = new Minim(this);
	player = minim.loadFile("Fear.mp3", 2048);
	player.loop();

	leap = new LeapMotion(this);

	pm = new ParticleManager();

	for (int i = 0; i < artnum; ++i) {
		String temp = (String)"tex"+(i+1)+".png";
		art[i] = loadImage(temp);
	}
}

void draw() {
	fill(#ffffff,1);
	rect(0,0,width,height);

	for(Hand hand : leap.getHands() ) {
		for(Finger finger : hand.getFingers() ) {
			PVector finger_tip = finger.getPositionOfJointTip();

			int fingerType = finger.getType();

			switch (fingerType) {
				// thumb
				case 0:
				addParticleBurst(fingerType, finger_tip);
				break;

				// index
				case 1:
				addParticleBurst(fingerType, finger_tip);
				break;

				// middle
				case 2:
				addParticleBurst(fingerType, finger_tip);
				break;

				// ring
				case 3:
				addParticleBurst(fingerType, finger_tip);
				break;

				// pinky
				case 4:
				addParticleBurst(fingerType, finger_tip);
				break;
			}
		}
	}
	pm.run();

	if (flipY){
	filter(flipHalfY); //flip half composition with glsl shader
	}
	if (flipX){
	filter(flipHalf); //flip half composition with glsl shader
	}

	frame.setTitle(int(frameRate) + " fps"); //set framerate to window title


	// saveFrame("../frames/#########.tif"); if (frameCount == 900) exit();
}

void addParticleBurst(int i, PVector finger_tip ) {
	ParticleSystem ps = new ParticleSystem(i, finger_tip);
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

// void saveHiRes(int scaleFactor) {   PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, P3D);

//    beginRecord(hires);   
//    hires.scale(scaleFactor);

//    if (hires == null) {      
//    		H.drawStage();   } 
//    	else {      
//    		// bg.resize(width*scaleFactor, height*scaleFactor);
//    		// hires.background(bg);
//    		H.stage().paintAll(hires, true, 1); // PGraphics, uses3D, alpha   
//    	}

//    endRecord();   
//    hires.save("hires/render_#####.tif");
//  }


// void saveVector() {
// 	PGraphics tmp = null;
// 	tmp = beginRecord(PDF, "pdf/render_#####.pdf");

// 	if (tmp == null) {
// 		H.drawStage();
// 	} else {
// 		H.stage().paintAll(tmp, true, 1); // PGraphics, uses3D, alpha
// 	}

// 	endRecord();
// }







