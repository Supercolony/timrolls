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

HPolarLayout layout;

HTimer timer;
HColorPool colors;
HColorPool colors2;

HPixelColorist pcolors;

HCanvas canvas;

void setup(){
	size(1000,1000, P3D);
	frameRate(24);
	H.init(this).background(#192033).use3D(true);
	smooth();

	// blendMode(DARKEST);

	canvas = (HCanvas) H.add(new HCanvas(P3D).autoClear(false).background(#192033).fade(4));
	H.add(canvas);

	HImage hitObj2 = new HImage("cloudy4.png");
	H.add(hitObj2).anchorAt(H.CENTER).loc(650,600).rotation(00).size(1000).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("hemisphere1.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).rotation(00).size(1000).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("waves.png");
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1000).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

	layout = new HPolarLayout(0.4, 2, width / 2, height / 2, false, 0.1);

	colors2 = new HColorPool()

		.add(#ffff29,2) //yellow
		.add(#ffc206,6) //light orange
		.add(#ff8708,4) // dark orange
 		.add(#333399,4) //purple
		.add(#8561ff,2) //light purp
		.add(#00cccc,6) //teal
		.add(#ff58e0,2) //pink
		.add(#9f368b) //d pink
		.add(#dee7ff,12)
		.add(#455787,4)
		.add(#2f3b5c,4)
		.fillOnly()
	;

	colors = new HColorPool()
		.add(#0b0c0c,2) 
		.add(#244256,3)
		.add(#0f1525,2)
		.add(#222232,2)
		.fillOnly()
	;


		// pool2 = new HDrawablePool(140); // bottom doodles
	// pool2.autoAddToStage()

	// 	.add (new HShape("doodle1.svg").anchorAt(H.CENTER),4)
	// 	.add (new HShape("doodle2.svg").anchorAt(H.CENTER),3)
	// 	.add (new HShape("doodle3.svg").anchorAt(H.CENTER),2)
	// 	.add (new HShape("doodle4.svg").anchorAt(H.CENTER),4)
	// 	.add (new HShape("doodle5.svg").anchorAt(H.CENTER),3)


	// 	// .add (new HShape("peeta8.svg").anchorAt(H.CENTER),4)
	// 	// .add (new HShape("peeta10.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("swirly1.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("swirly2.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("swirly3.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("swirly4.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("swirly5.svg").anchorAt(H.CENTER))



	// 	.layout(hsl4)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.enableStyle(false)
	// 					.strokeJoin(ROUND)
	// 					.strokeCap(ROUND)
	// 					.strokeWeight(.3)
	// 					.stroke(#000000)
	// 					.fill(#ffffff)
	// 					.rotation((int)random(8) * 45)		
	// 					// .rotation((int)random(360))			
	// 					.size((int)random(300) )
	// 					// .loc((int)random(width),height/2)
	// 				;
	// 				d.randomColors(colors.fillOnly());
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;


	


	// pool4 = new HDrawablePool(20); // top right doodles
	// pool4.autoAddToStage()
	// 	// .add(new HShape("camo.svg"))
	// 	// .add(new HShape("camo2.svg"))
	// 	// .add(new HShape("camo3.svg"))
	// 	// .add(new HShape("cloudbank3.svg"))
	// 	// .add(new HShape("cloudbank4.svg"))
	// 	// .add(new HShape("cloudbank5.svg"))
	// 	.add (new HShape("doodle4.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	.add (new HShape("doodle5.svg").enableStyle(false).anchorAt(H.CENTER))

	// 	// .add(new HShape("plus.svg").enableStyle(false).rotation(45))
	// 	// .add(new HShape("diamond.svg").enableStyle(false))
	// 	// .add(new HEllipse(30))
	// 	// .add ( new HPath().polygon(6) )
	// 	// .add(new HShape("triangles.svg"))
	// 	// .add(new HShape("triangles2.svg"))
	// 	// .add(new HShape("triangles3.svg"))
	// 	// .add(new HShape("triangles4.svg"))


	// .layout(hsl3)

	// 	.onCreate(
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					// .enableStyle(false)
	// 					.strokeJoin(ROUND)
	// 					.strokeCap(ROUND)
	// 					.strokeWeight(.5)
	// 					.stroke(#000000)
	// 					.fill(#ffffff)
	// 					.anchorAt(H.CENTER)
	// 					// .rotate( (int)random(2) * 180 )
	// 					.size(random(60,200))
	// 					// .size( ( (int)random(2,6) * 50 ) ) // 50, 100, 150, 200
	// 					// .loc(random(width), random(height))
	// 				;
	// 				d.randomColors(colors.fillOnly());
	// 			}
	// 		}
	// 	)
	// 	.requestAll()
	// ;

	

	// pool2 = new HDrawablePool(100); // Main Shapes
	// pool2.autoAddToStage()

	// 	// .add (new HShape("doodle1.svg").anchorAt(H.CENTER))
	// 	// .add (new HShape("doodle2.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("doodle3.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	.add (new HShape("doodle4.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	.add (new HShape("doodle5.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	// .add (new HShape("peeta1.svg").anchorAt(H.CENTER))
	// 	// .add (new HShape("peeta2.svg").anchorAt(H.CENTER),4)
	// 	// .add (new HShape("peeta5.svg").anchorAt(H.CENTER),3)
	// 	// .add (new HShape("peeta6.svg").anchorAt(H.CENTER),3)
	// 	// .add (new HShape("peeta7.svg").anchorAt(H.CENTER),5)
	// 	// .add (new HShape("peeta8.svg").anchorAt(H.CENTER),6)
	// 	// .add (new HShape("peeta10.svg").anchorAt(H.CENTER),3)
	// 	.add (new HShape("spermy1.svg").enableStyle(false).anchorAt(H.CENTER),4)
	// 	.add (new HShape("spermy2.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	.add (new HShape("spermy3.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	.add (new HShape("spermy4.svg").enableStyle(false).anchorAt(H.CENTER),5)
	// 	.add (new HShape("spermy5.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	.add (new HShape("swirly1.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	.add (new HShape("swirly2.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	.add (new HShape("swirly3.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	.add (new HShape("swirly4.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	.add (new HShape("swirly5.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	.add (new HEllipse(30),10)


	// 	.layout(hsl2)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HDrawable d = (HDrawable) obj;
	// 				d
	// 					// .enableStyle(false)
	// 					// .strokeJoin(ROUND)
	// 					.strokeCap(ROUND)
	// 					.strokeWeight(.3)
	// 					.stroke(#000000)
	// 					.fill(colors.getColor())
	// 					.rotation((int)random(8) * 45)		
	// 					// .rotation((int)random(360))			
	// 					.size((int)random(100,180) )
	// 					// .loc((int)random(width),height/2)
	// 				;
	// 				// d.randomColors(colors2.fillOnly());
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;




	// pool3 = new HDrawablePool(75); // Floaties
	// pool3.autoAddToStage()
		
	// 	// .add(new HShape("diamond.svg"))
	// 	// .add(new HShape("plus.svg").rotation(45))
	// 	// .add ( new HPath().polygon(6) )
	// 	.add(new HEllipse(30))
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
	// 					.fill(colors2.getColor())
	// 					// .rotation((int)random(4) * 45 )				
	// 					.size((int)random(1,3) * 25 )
	// 					// .loc((int)random(width),random(height))
	// 				;
	// 				// d.randomColors(colors2.fillOnly());
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;

	pool = new HDrawablePool(800); //Hex pattern
	// pool.autoAddToStage()
	pool.autoParent(canvas)
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
		.add ( new HPath().polygon(3) )

		// .layout(
		// 	new HGridLayout()
		// 	.cols(40)
		// 	.spacingX(10)
		// 	.spacingY(10)
		// 	.startX(width/2-200)
		// 	.startY(height/2-200)
		// )

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
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(2)
						.stroke(colors2.getColor())
						.noFill()
						// .fill(colors2.getColor())
						// .noStroke()
						.anchorAt(H.CENTER)
						// .rotate( (int)random(4) * 90 )
						.size((int)random(1,3)*20)
						// .size( ( (int)random(2,6) * 50 ) ) // 50, 100, 150, 200
					;
					// d.randomColors(colors.fillOnly());

					new HOscillator()
						.target(d)
						.property(H.SIZE)
						.range(10, 400)
						.speed(.2)
						.freq(8)
						// .waveform(H.SAW)
						// .currentStep(i+10)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-100, 100)
						.speed(.5)
						.freq(6)
						// .waveform(H.SAW)
						// .currentStep(i+120)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-180, 180)
						.speed(.2)
						.freq(2)
						// .waveform(H.SAW)
						// .currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-180, 180)
						.speed(0.3)
						.freq(2)
						// .waveform(H.SAW)
						.currentStep(i)
					;

					layout.applyLayout(d);
				}
			}
		)
		.requestAll()
	;



}

 
void draw() {

	H.drawStage();

	if(frameCount % 1 == 0 && frameCount < 360){
		saveFrame("../frames/image-#####.png");
	}

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

		H.drawStage();
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
