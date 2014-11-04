import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HDrawablePool pool2;
HDrawablePool pool3;
HDrawablePool pool4;
HDrawablePool pool5;

HShapeLayout hsl;
HShapeLayout hsl2;
HShapeLayout hsl3;
HShapeLayout hsl4;

HTimer timer;
HColorPool colors;
HColorPool colors2;
HCanvas canvas;

HPixelColorist pcolors;

PShader flipHalf;
PShader flipHalfY;

PImage tex;

void setup(){
	size(1000,1000, P3D);
	H.init(this).background(#e7e7e7).autoClear(true).use3D(true);
	smooth();

	// canvas = (HCanvas) H.add(new HCanvas(P3D).autoClear(false).fade(6).background(#e7e7e7));
	// H.add(canvas);

	flipHalf = loadShader("flipHalf.glsl");
	flipHalfY = loadShader("flipHalfY.glsl");

	tex = loadImage("lines.jpg");
	textureMode(NORMAL);

	// blendMode(EXCLUSION);

	frameRate(24);

	HImage hitObj2 = new HImage("cloudy4.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(1000).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("hemisphere3.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(800).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("waves.png");
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(900).visibility(false).rotation(90);
	hsl4 = new HShapeLayout().target(hitObj4);

	colors2 = new HColorPool()

		.add(#026396,3) //blue
		.add(#acfafe,5) //fuscia
		.add(#8cfee6,2) //pink
		.add(#68005f) //rust
		.add(#76d0d0,2) //teal
		// .add(#1f2942,2) //purplish
		.add(#4b575c,3) // grey
		.add(#deebeb,8)
		.add(#effdfd,2)  
		.fillOnly()
	;

	colors = new HColorPool()
		.add(#0b0c0c,2) 
		.add(#244256,3)
		.add(#0f1525,2)
		.add(#222232,2)
		.fillOnly()
	;

	pool = new HDrawablePool(450); //tetris pattern
	pool.autoAddToStage()
		// .add(new HShape("tetris1.svg"))
		// .add(new HShape("tetris2.svg"))
		// .add(new HShape("tetris3.svg"))
		// .add(new HShape("cloudbank3.svg"))
		// .add(new HShape("cloudbank4.svg"))
		// .add(new HShape("cloudbank5.svg"))
		// .add (new HShape("doodle4.svg").anchorAt(H.CENTER))
		// .add (new HShape("doodle5.svg").anchorAt(H.CENTER))

		// .add(new HShape("plus.svg").enableStyle(false).rotation(45))
		// .add(new HShape("diamond.svg").enableStyle(false))
		// .add(new HEllipse(30))
		.add ( new HPath().polygon(6) )

	.layout(
			new HHexLayout()
			// .cols(20)
			.spacing(25)
			// .spacingY(20)
			.offsetX(0)
			.offsetY(100)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HDrawable d = (HDrawable) obj;
					d
						// .enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(.5)
						// .stroke(#000000)
						.noStroke()
						.fill(#ffffff)
						.anchorAt(H.CENTER)
						// .rotate( (int)random(4) * 90 )
						.size((int)random(3)*25)
						// .size( ( (int)random(2,6) * 50 ) ) // 50, 100, 150, 200
					;
					// d.randomColors(colors.fillOnly());

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(100,width-100 )
						.speed(.1)
						.freq(8)
						.currentStep(i+100)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-200, 100)
						.speed(1)
						.freq(4)
						// .waveform(H.SAW)
						.currentStep(i+120)
					;

				}
			}
		)
		.requestAll()
	;



	pool2 = new HDrawablePool(100); // extra doodles
	// pool2.autoParent(canvas)
	pool2.autoAddToStage()

		// .add (new HShape("doodle1.svg").anchorAt(H.CENTER),4)
		// .add (new HShape("doodle2.svg").anchorAt(H.CENTER),3)
		// .add (new HShape("doodle3.svg").anchorAt(H.CENTER),2)
		// .add (new HShape("doodle4.svg").anchorAt(H.CENTER),4)
		// .add (new HShape("doodle5.svg").anchorAt(H.CENTER),3)


		// .add (new HShape("peeta8.svg").anchorAt(H.CENTER),4)
		// .add (new HShape("peeta10.svg").anchorAt(H.CENTER))
    // .add (new HShape("spike1.svg").enableStyle(false).anchorAt(H.BOTTOM),2)
    // .add (new HShape("spike2.svg").enableStyle(false).anchorAt(H.BOTTOM),4)
    // .add (new HShape("spike3.svg").enableStyle(false).anchorAt(H.BOTTOM),3)
    // .add (new HShape("spike4.svg").enableStyle(false).anchorAt(H.BOTTOM),2)

    .add ( new HPath().polygon(6) )

		// .layout(hsl4)

		.layout (
			new HGridLayout()
			.startX(32)
			.startY(32)
			.spacing(10,100)
			.cols(64)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					texture(tex);
					int i = pool2.currentIndex();
					HDrawable d = (HDrawable) obj;
					d
						
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(.3)
						// .stroke(#000000)
            			.noStroke()
						.fill(#ffffff)
						.rotation((int)random(8) * 45)		
						// .rotation((int)random(360))			
						.size((int)random(25,75) )
						// .loc((int)random(width),height/2)
					;
					// d.randomColors(colors2.fillOnly());

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(90, -90)
						.speed(1)
						.freq(1.5)
						// .waveform(H.SQUARE)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(100,width-100 )
						.speed(.2)
						.freq(10)
						.currentStep(i+100)
					;

					new HOscillator()
						.target(d)
						.property(H.Y)
						.range(200, height-300)
						.speed(.2)
						.freq(6)
						// .waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-200, 100)
						.speed(2)
						.freq(2)
						// .waveform(H.SAW)
						.currentStep(i+120)
					;

					
				}
			}
		)

	.requestAll()
	;


	// pool2 = new HDrawablePool(80); // Main Shapes
	// pool2.autoAddToStage()
	// // pool2.autoParent(canvas)

	// 	.add (new HShape("spike1.svg").anchorAt(H.BOTTOM),2)
	// 	.add (new HShape("spike2.svg").anchorAt(H.BOTTOM),4)
	// 	.add (new HShape("spike3.svg").anchorAt(H.BOTTOM),3)
	// 	.add (new HShape("spike4.svg").anchorAt(H.BOTTOM),2)


	// 	.layout (
	// 		new HGridLayout()
	// 		.startX(32)
	// 		.startY(32)
	// 		.spacing(20,100)
	// 		.cols(64)
	// 	)


	// 	// .layout(hsl2)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				int i = pool2.currentIndex();
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.enableStyle(false)
	// 					// .strokeJoin(ROUND)
	// 					// .strokeCap(ROUND)
	// 					// .strokeWeight(.3)
	// 					// .stroke(#000000)
 //            			.noStroke()
	// 					.fill(#ffffff)
	// 					// .rotation((int)random(90))		
	// 					.rotation((int)random(2) * 45)    		
	// 					.size((int)random(50,350) )
	// 					// .loc((int)random(width),(int)random(height))
	// 				;
	// 				// d.randomColors(colors2.fillOnly());

	// 				new HOscillator()
	// 					.target(d)
	// 					.property(H.ROTATIONZ)
	// 					.range(90, -90)
	// 					.speed(.2)
	// 					.freq(3)
	// 					// .waveform(H.SQUARE)
	// 					.currentStep(i)
	// 				;

	// 				new HOscillator()
	// 					.target(d)
	// 					.property(H.SIZE)
	// 					.range(50, 300)
	// 					.speed(1)
	// 					.freq(2)
	// 					// .waveform(H.SAW)
	// 					.currentStep(i+100)
	// 				;

	// 				// new HOscillator()
	// 				// 	.target(d)
	// 				// 	.property(H.ALPHA)
	// 				// 	.range(0, 255)
	// 				// 	.speed(1)
	// 				// 	.freq(3)
	// 				// 	// .waveform(H.SAW)
	// 				// 	.currentStep(i+100)
	// 				// ;

	// 				new HOscillator()
	// 					.target(d)
	// 					.property(H.X)
	// 					.range(0,width/2 )
	// 					.speed(1)
	// 					.freq(1)
	// 					.currentStep(i+100)
	// 				;
					
	// 				new HOscillator()
	// 					.target(d)
	// 					.property(H.Y)
	// 					.range(20, height-300)
	// 					.speed(2)
	// 					.freq(2)
	// 					// .waveform(H.SAW)
	// 					.currentStep(i+120)
	// 				;					
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;

// pool3 = new HDrawablePool(100); // extra doodles
// 	// pool3.autoParent(canvas)
// 	pool3.autoAddToStage()

// 		// .add (new HShape("doodle1.svg").anchorAt(H.CENTER),4)
// 		// .add (new HShape("doodle2.svg").anchorAt(H.CENTER),3)
// 		// .add (new HShape("doodle3.svg").anchorAt(H.CENTER),2)
// 		// .add (new HShape("doodle4.svg").anchorAt(H.CENTER),4)
// 		// .add (new HShape("doodle5.svg").anchorAt(H.CENTER),3)


// 		// .add (new HShape("peeta8.svg").anchorAt(H.CENTER),4)
// 		// .add (new HShape("peeta10.svg").anchorAt(H.CENTER))
//     .add (new HShape("spike1.svg").anchorAt(H.BOTTOM),2)
//     .add (new HShape("spike2.svg").anchorAt(H.BOTTOM),4)
//     .add (new HShape("spike3.svg").anchorAt(H.BOTTOM),3)
//     .add (new HShape("spike4.svg").anchorAt(H.BOTTOM),2)



// 		// .layout(hsl4)

// 		.layout (
// 			new HGridLayout()
// 			.startX(0)
// 			.startY(0)
// 			.spacing(10,10)
// 			.cols(20)
// 		)

// 		.onCreate (
// 			new HCallback() {
// 				public void run(Object obj) {
// 					texture(tex);
// 					int i = pool3.currentIndex();
// 					HShape d = (HShape) obj;
// 					d
// 						.enableStyle(false)
// 						// .strokeJoin(ROUND)
// 						// .strokeCap(ROUND)
// 						// .strokeWeight(.3)
// 						// .stroke(#000000)
//             			.noStroke()
// 						.fill(#ffffff)
// 						// .rotation((int)random(8) * 45)		
// 						// .rotation((int)random(360))			
// 						.size((int)random(40,200) )
// 						// .loc((int)random(width),height/2)
// 					;
// 					// d.randomColors(colors2.fillOnly());

// 					// new HOscillator()
// 					// 	.target(d)
// 					// 	.property(H.ROTATIONZ)
// 					// 	.range(90, -90)
// 					// 	.speed(1)
// 					// 	.freq(1.5)
// 					// 	// .waveform(H.SQUARE)
// 					// 	.currentStep(i)
// 					// ;

// 					// new HOscillator()
// 					// 	.target(d)
// 					// 	.property(H.X)
// 					// 	.range(200,width-200 )
// 					// 	.speed(.5)
// 					// 	.freq(8)
// 					// 	.currentStep(i+100)
// 					// ;

// 					new HOscillator()
// 						.target(d)
// 						.property(H.Y)
// 						.range(300, height-300)
// 						.speed(1)
// 						.freq(2)
// 						// .waveform(H.SAW)
// 						.currentStep(i+120)
// 					;

// 					new HOscillator()
// 						.target(d)
// 						.property(H.Z)
// 						.range(0, -200)
// 						.speed(2)
// 						.freq(2)
// 						.waveform(H.SAW)
// 						.currentStep(i+120)
// 					;

					
// 				}
// 			}
// 		)

// 	.requestAll()
// 	;



	// pool3 = new HDrawablePool(75); // Floaties
	// pool3.autoAddToStage()
		
	// 	// .add(new HShape("diamond.svg"))
	// 	// .add(new HShape("plus.svg").rotation(45))
	// 		.add ( new HPath().polygon(6) )
	// 	// .add(new HShape("tetris1.svg"))
	// 	// .add(new HShape("tetris2.svg"))
	// 	// .add(new HShape("tetris3.svg"))

	// 	// .add (new HShape("tech1.svg").anchorAt(H.CENTER))
	// 	// .add (new HShape("tech2.svg").anchorAt(H.CENTER))

	// 	.layout(hsl4)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HDrawable d = (HDrawable) obj;
	// 				d
	// 					// .enableStyle(false)
	// 					.strokeJoin(ROUND)
	// 					.strokeCap(ROUND)
	// 					.strokeWeight(.5)
	// 					.stroke(#000000)
	// 					.fill(#ffffff)
	// 					// .rotation((int)random(4) * 45 )				
	// 					.size((int)random(3,8) * 10 )
	// 					// .loc((int)random(width),random(height))
	// 				;
	// 				// d.randomColors(colors2.fillOnly());
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;

	

}

 
void draw() {

	pointLight(90,255,0,  0, 200, 0);        
	pointLight(93, 219, 255,  width, height/2, 300);   
	pointLight(254, 162, 64,  0, 0, 200); 



	H.drawStage();
	filter(flipHalfY); //flip half composition with glsl shader
	filter(flipHalf); //flip half composition with glsl shader

	// if(frameCount % 1 == 0 && frameCount < 360){
	// 	saveFrame("../frames/image-#####.png");
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
	// 	drawThings();
	// }

	if (key == 'r') {
		record = true;
		saveFrame("png/render_####.png");
		saveVector();
		H.drawStage();
	}

	if (key == 'c') {

			for (HDrawable temp : pool) {
			HShape d = (HShape) temp;
			d.randomColors(colors2.fillOnly());
		}

			for (HDrawable temp : pool2) {
			HShape d = (HShape) temp;
			d.randomColors(colors2.fillOnly());
		}
		
		// 	for (HDrawable temp : pool3) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		
		// 	for (HDrawable temp : pool5) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }

		
	}
}


void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "pdf/render_#####.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}
