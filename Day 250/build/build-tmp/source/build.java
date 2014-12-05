import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import de.voidplus.leapmotion.*; 
import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {


AudioPlayer player;
Minim minim;


LeapMotion leap;

ParticleManager pm;

PShader flipHalf;
PShader flipHalfY;

boolean record = false;
boolean flipX = false;
boolean flipY = false;

int artnum   = 9;
PImage[] art = new PImage[artnum];

public void setup() {
	size(1920, 1080, P3D);
	background(0xffFFFFFF);
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

public void draw() {
	fill(0xffffffff,1);
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

	frame.setTitle(PApplet.parseInt(frameRate) + " fps"); //set framerate to window title


	// saveFrame("../frames/#########.tif"); if (frameCount == 900) exit();
}

public void addParticleBurst(int i, PVector finger_tip ) {
	ParticleSystem ps = new ParticleSystem(i, finger_tip);
	pm.createSystem(ps);
}


public void keyPressed() {


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







class Particle{
	int finger_which;
	PVector pt;

	int lifespan = (int)random(50,300);

	PVector location;
	PVector velocity;
	PVector acceleration;

	PImage whichArt;
	int rotSpeed;

	Particle(int i, int _finger_which, PVector _pt ) {
		finger_which = _finger_which;
		pt = _pt;

		location = pt.get();
		velocity = new PVector( random(-5,5), random(-10,10)  );
		acceleration = new PVector(  (int)random(-1.5f,1.5f), (int)random(-1.5f,1.5f), 0 );

		whichArt = art[ (int)random(artnum) ];
		rotSpeed = (int)random(-3,3);
	}

	public void run() {
		noStroke(); noFill();

		velocity.add(acceleration);
		location.add(velocity);

		pushMatrix();
			translate(location.x, location.y, map(location.z,0,100,300,-900) );
			rotate( radians( (map(location.z,0,100,0,360) - lifespan) / rotSpeed ) );

			image(whichArt,0,0);
		popMatrix();

		if (lifespan>0) lifespan--;
	}

	public boolean isDead() {
		return (lifespan==0);
	}
}


class ParticleManager {

	ArrayList<ParticleSystem> systems;

	ParticleManager() {
		systems = new ArrayList<ParticleSystem>();
	}

	public void createSystem(ParticleSystem ps) {
		systems.add(ps);
	}

	public void run() {
		Iterator<ParticleSystem> it = systems.iterator();

		while( it.hasNext() ) {
			ParticleSystem p = it.next();
			p.run();

			if( p.systemDead() ) it.remove();
		}

		int systemSize = systems.size();
		player.setGain( map(systemSize, 0, 300, -50, 14) );
	}
}




class ParticleSystem {
	int finger_which;
	PVector pt;

	ArrayList<Particle> particles;
	int numParticles = 3;

	ParticleSystem(int _finger_which, PVector _pt) {
		finger_which = _finger_which;
		pt = _pt;

		particles = new ArrayList<Particle>();

		for (int i = 0; i < numParticles; ++i) {
			Particle p = new Particle(i, finger_which, pt);
			particles.add(p);
		}
	}

	public void run() {
		Iterator<Particle> it = particles.iterator();

		while( it.hasNext() ) {
			Particle p = it.next();
			p.run();

			if( p.isDead() ) it.remove();
		}
	}

	public boolean systemDead() {
		return ( particles.isEmpty() );
	}
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
