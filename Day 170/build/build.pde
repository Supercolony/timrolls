import processing.pdf.*;
import de.voidplus.leapmotion.*;

LeapMotion leap;

int captureX=0;
int captureY=0;
int captureZ=0;
HDrawable poly;

boolean record = false;
boolean flipX = true;
boolean flipY = true;
PImage bg;

HDrawablePool pool;
HDrawablePool pool2;
HDrawablePool pool3;
HDrawablePool pool4;

HTimer timer;
HColorPool colors;
HColorPool colors2;

HPixelColorist pcolors;
HColorField colorField;

HCanvas canvas;

PShader flipHalf;
PShader flipHalfY;

void setup(){
	size(displayWidth-200,displayHeight-200, OPENGL);
	frameRate(15);

	bg= loadImage("BG.jpg");
	bg.resize(width,height);
	H.init(this).use3D(true).backgroundImg(bg);

	// H.init(this).use3D(true);
	smooth(8);

	leap = new LeapMotion(this);

	blendMode(SCREEN);

	canvas = (HCanvas) H.add(new HCanvas(OPENGL).autoClear(false));
	H.add(canvas);

	flipHalf = loadShader("flipHalf.glsl");
	flipHalfY = loadShader("flipHalfY.glsl");


	// HImage hitObj2 = new HImage("cloudy4.png");
	// H.add(hitObj2).anchorAt(H.CENTER).loc(650,600).rotation(00).size(1000).visibility(false);
	// hsl2 = new HShapeLayout().target(hitObj2);

	pcolors= new HPixelColorist("colors.jpeg")
	.fillOnly()
	// .strokeOnly()
	// .fillAndStroke()
	;

	colorField = new HColorField(width, height)
		.addPoint(0, height/2, #008cff, 0.5f)
		// .addPoint(width/2, height-200, #3300FF, 0.3f)
		.addPoint(width/2, height, #00ffce, 0.2f)
		// .addPoint(width/2, height/2, #00f3ff, 0.2f)
		.fillOnly()
		// .strokeOnly()
		// .fillAndStroke()
	;


	colors2 = new HColorPool()

		.add(#ffffff,10) //white
		.add(#FF7214,5) //grey
		.add(#dee7ff)
		.add(#bce8ef)
		.fillOnly()
	;

	colors = new HColorPool()
		.add(#bbe8d4,2)  //green
		.add(#48225f,3) //purple
		.add(#eb7d96,2) //pink
		.add(#ffffff,10)
		// .fillOnly()
		.strokeOnly()
	;



	pool = new HDrawablePool(50); //Shapes
	// pool.autoAddToStage()
	pool.autoParent(canvas)


		.add (new HShape("peeta6.svg").enableStyle(false))
		.add (new HShape("peeta7.svg").enableStyle(false))
		.add (new HShape("peeta8.svg").enableStyle(false))
		.add (new HShape("peeta9.svg").enableStyle(false))
		.add (new HShape("peeta10.svg").enableStyle(false))					
		.add ( new HPath().polygon(3) )
		// .add ( new HPath().polygon(6) )

		.layout(
			new HGridLayout()
			.cols(35)
			.spacingX(20)
			.spacingY(10)
			.startX(160)
			.startY(160)
		)

		// .layout(
		// 	new HHexLayout()
		// 	.spacing(15)
		// 	.offsetX(0)
		// 	.offsetY(0)
		// )

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HDrawable d = (HDrawable) obj;
					d
						// .enableStyle(false)
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(1)
						// .stroke(#ffffff)
						// .noFill()
						.fill(colors.getColor())
						.noStroke()
						// .anchorAt(H.CENTER)
						.anchor(random(-100,100),random(-100,100))
						// .rotate( (int)random(4) * 90 )
						// .size((int)random(1,3)*100)
						.x(random(0,width/2))
						.y(height/2)
						.size( ( (int)random(1,4) * 50 ) ) // 50, 100, 150, 200
					;
					// d.randomColors(colors.fillOnly());
					// layout.applyLayout(d);
					pcolors.applyColor(d);
					// colorField.applyColor(d);

					new HOscillator()
						.target(d)
						.property(H.SIZE)
						.range(20, 150)
						.speed(random(0.1,2))
						.freq(random(8))
						// .waveform(H.SAW)
						.currentStep(i+10)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(0, 100)
						.speed(.5)
						.freq(2)
						.waveform(H.SAW)
						.currentStep(i)
					;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.WIDTH)
					// 	.range(5, 300)
					// 	.speed(.1)
					// 	.freq(random(4))
					// 	// .waveform(H.SAW)
					// 	// .currentStep(i+10)
					// ;

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(random(width/2), width-400)
						.speed(random(0.1,1.5))
						.freq(random(2))
						.waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.Y)
						.range(300, height-300)
						.speed(random(0.1,1))
						.freq(random(6))
						// .waveform(H.SAW)
						.currentStep(i+100)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-60, 60)
						.speed(.2)
						.freq(random(3))
						// .waveform(H.TRIANGLE)
						// .currentStep(i+100)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-30, 30)
						.speed(.2)
						.freq(3)
						// .waveform(H.SAW)
						// .currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 0)
						.speed(.2)
						.freq(random(2,5))
						// .waveform(H.SAW)
						.currentStep(i)
					;

					
				}
			}
		)
		.requestAll()
	;

	pool4 = new HDrawablePool(10); //Motion objects
	// pool4.autoAddToStage()
	pool4.autoParent(canvas)
		.add( new HPath().polygon(6) )
		// .add( new HEllipse(5) )
		// .add (new HShape("smudge1.svg").enableStyle(false))
		// .add (new HShape("smudge2.svg").enableStyle(false))
		// .add (new HShape("smudge3.svg").enableStyle(false))
		// .add (new HShape("smudge4.svg").enableStyle(false))		
		// .add (new HShape("smudge5.svg").enableStyle(false))
		// .add (new HShape("smudge6.svg").enableStyle(false))
		// .add (new HShape("smudge7.svg").enableStyle(false))		
		// .add (new HShape("smudge8.svg").enableStyle(false))		

		.layout(
			new HHexLayout()
			.spacing(60)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool4.currentIndex();
					HDrawable d = (HDrawable) obj;
					d
						// .rotate(random(2)*180)
						.size(40)
						.anchorAt(H.CENTER)
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(1)
						// .stroke(colors.getColor(),220)
						.fill((int)random(255)).alpha(120)
						.noStroke()
						// .noFill()
						// .z(captureZ*5)
					;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.SIZE)
					// 	// .relativeVal(d.y())
					// 	.range(20, 150)
					// 	.speed(1.5)
					// 	.freq(random(8))

					// 	.currentStep(i)
					// ;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.ROTATION)
					// 	.relativeVal(captureX)
					// 	.range(0, 180)
					// 	.speed(0.1)
					// 	.freq(random(8))

					// 	.currentStep(i)
					// ;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.Y)
					// 	.relativeVal(captureY)
					// 	.range(0, height)
					// 	.speed(1.5)
					// 	.freq(random(8))

					// 	// .currentStep(i)
					// ;


				}
			}
		)

		.requestAll()
	;




}

 
void draw() {

	// background(255);

	int fps = leap.getFrameRate();
    
    // ========= HANDS =========
    
  for(Hand hand : leap.getHands()){

    // ----- BASICS -----
        
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    boolean hand_is_left     = hand.isLeft();
    boolean hand_is_right    = hand.isRight();
    float   hand_grab        = hand.getGrabStrength();
    float   hand_pinch       = hand.getPinchStrength();
    float   hand_time        = hand.getTimeVisible();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();


        captureX = (int)hand_stabilized.x;
        captureY = (int)hand_stabilized.y;
        captureZ = (int)hand_stabilized.z;


   	for (HDrawable temp : pool4) {
		HDrawable d = (HDrawable) temp;
		int i = pool4.currentIndex();
		
			pcolors.applyColor(d);
			// colorField.applyColor(d);
			d.x(captureX+random(200));
			d.y(captureY+random(200));
			d.size(captureZ+random(5,50)*2);

		}
	
  	H.drawStage();
	
	//mirror based on input
	if (flipY){
	filter(flipHalfY); //flip half composition with glsl shader
	}
	if (flipX){
	filter(flipHalf); //flip half composition with glsl shader
	}

}



	// for (HDrawable temp : pool) {
	// 	HDrawable d = (HDrawable) temp;
	// 	pcolors.applyColor(d);
	// }

	// filter(flipHalfY); //flip half composition with glsl shader

	// if(frameCount % 1 == 0 && frameCount < 225){
	// 	saveFrame("../frames/image-#####.tif");
	// }

	frame.setTitle(int(frameRate) + " fps"); //set framerate to window title
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
		saveFrame("tif/render_####.tif");
		// saveFrame("png/render_####.png");
		// saveHiRes(4);
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

// void saveHiRes(int scaleFactor) {   PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, OPENGL);

//    beginRecord(hires);   
//    hires.scale(scaleFactor);

//    if (hires == null) {      
//    		H.drawStage();   } 
//    	else {      
//    		bg.resize(width*scaleFactor, height*scaleFactor);
//    		hires.background(bg);
//    		H.stage().paintAll(hires, true, 1); // PGraphics, uses3D, alpha   
//    	}

//    endRecord();   
//    hires.save("hires/render_#####.tif");
//  }


void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "pdf/render_#####.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, true, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}
