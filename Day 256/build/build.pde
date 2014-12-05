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
PImage imgColors;
PGraphics container;

HColorPool colors;

color colorX[];
int counter=0;

void setup() {
	size(displayWidth, displayHeight, P3D);
	H.init(this).background(#ECECEC).use3D(true).autoClear(false);
	smooth();

	blendMode(OVERLAY);

	container = createGraphics(width/2,height,P3D);
	leap = new LeapMotion(this);

	pm = new ParticleManager();

	imgColors = loadImage("color.jpg");

//load art assets
for (int i = 0; i < artnum; ++i) { 
		String temp = (String)"0"+(i+1)+".png";
		art[i] = loadImage(temp);
	}

	color colorX[] = new color[imgColors.width];

// fill array with colors
	for (int i =0; i <= imgColors.width-1; i++){
			colorX[i]= imgColors.get(i,0);
	}  

	hint(DISABLE_DEPTH_TEST);


colors = new HColorPool()
		.add(#bbe8d4,2)  //green
		.add(#48225f,3) //purple
		.add(#eb7d96,2) //pink
		.add(#ffffff,10)
		.add(#222222,5)
		.fillOnly()
	;

}

void draw() {
	H.drawStage();

	counter++;
	if(counter >= imgColors.width-1){
		counter=0;
	}
	color temp = imgColors.get(counter,0);
	
	println ("counter: "+counter+" length: ");

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
				addParticleBurst(fingerType, finger_tip, temp);
				break;

				// pinky
				case 4:
				addParticleBurst(fingerType, finger_tip, temp);
				break;
			}


		}


	}

		

	pm.run();

	// container.tint( (int)random(255) );

	image(container,0,0);

	//flip left/right
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














