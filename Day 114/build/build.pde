import processing.pdf.*;
boolean record = false;
boolean mirror = false;

HDrawablePool pool;
HDrawablePool pool2;
HDrawablePool pool3;
HDrawablePool pool4;
HDrawablePool pool5;

HColorPool colors;
HColorPool colors2;
HColorField colorField;
HPixelColorist pcolors;

HCanvas canvas;

PShader flipHalf;

void setup(){
	size(640,640, P3D);
	H.init(this).background(#94ffe0).use3D(true);
	smooth();

	canvas = (HCanvas) H.add(new HCanvas(P3D).autoClear(false).fade(1));
	H.add(canvas);

	flipHalf = loadShader("flipHalf.glsl");
	
	// blendMode(ADD);

	frameRate(24);

		colors = new HColorPool()

		.add(#ffffff,20) //white
		.add(#cccccc,5) //grey
		.add(#ff8d37) //light orange
		.add(#e7e7e7,20) // grey
 		.add(#1c0d68) //purple
		.add(#5001be) //light purp
		// .add(#02fcfa) //teal
		.add(#fe39a2) //pink
		// .add(#7bfc88) //green
		.add(#dee7ff)
		.add(#c7f6fe)
		.add(#2f3b5c)
		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#ffffff) //white
		.add(#cccccc) //grey
		// .add(#ff8d37) //light orange
		.add(#e7e7e7) // grey
		.fillOnly()
	;

	// colorField = new HColorField(width, height)
	// 	.addPoint(0, height/2, #FF0066, 0.5f)
	// 	.addPoint(width, height/2, #3300FF, 0.5f)
	// 	// .fillOnly()
	// 	.strokeOnly()
	// 	// .fillAndStroke()
	// ;

	//  pcolors= new HPixelColorist("gradient2.jpg")
	// 	.fillOnly()
	// 	// .strokeOnly()
	// 	// .fillAndStroke()
	// ;

	pool = new HDrawablePool(400);   //lines
	// pool.autoParent(canvas)
	pool.autoAddToStage()
		.add (new HPath())

		// .add(
		// 	new HRect(5,175)
		// 		// .rounding(10)
		// 		// .anchor(30,0)
		// 		.anchorAt(H.CENTER)
		// 		// .noFill()
		// 		// .stroke(#ffffff)
		// 		// .fill(#ffffff)
		// 		.noStroke()
		// 		// .rotation(45)
		// 		.z(-200)
				
		// )

		.layout (
			new HGridLayout()
			.startX(32)
			.startY(32)
			.spacing(20,100)
			.cols(64)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					// HDrawable d = (HDrawable) obj;
					
					HPath d = (HPath) obj;
					
					d
						.polygon(4)
						.height(140)
						.width(5)
						.anchorAt(H.CENTER)
						// .fill(#555555)
						// .stroke(#ffffff)
						// .strokeWeight(.5)
						// .noFill()
						.noStroke()
						.rotation(135)
					;

					// d.fill(colors2.getColor()).noStroke();

					new HOscillator()
						.target(d)
						.property(H.WIDTH)
						// .relativeVal(d.y())
						.range(5, 30)
						.speed(2)
						.freq(1.5)
						.currentStep(i)
					;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.ROTATIONX)
					// 	.range(45, -45)
					// 	.speed(.2)
					// 	.freq(1.5)
					// 	.waveform(H.SQUARE)
					// 	.currentStep(i)
					// ;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.ROTATIONZ)
					// 	.range(0, 180)
					// 	.speed(.2)
					// 	.freq(2)
					// 	// .waveform(H.SAW)
					// 	.currentStep(i)
					// ;

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(10,width-150 )
						.speed(.7)
						.freq(1)
						.currentStep(i+100)
					;

					new HOscillator()
						.target(d)
						.property(H.Y)
						.range(-50, height+50)
						.speed(.25)
						.freq(7)
						.waveform(H.SAW)
						.currentStep(i+120)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(150, 0)
						.speed(.5)
						.freq(4)
						// .waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.HEIGHT)
						.range(100, 500)
						.speed(.2)
						.freq(2)
						// .waveform(H.SAW)
						.currentStep(i+100)
					;

				}
			}
		)

		.requestAll()
	;


	pool2 = new HDrawablePool(100); //small tris
	pool2.autoAddToStage()
	// pool2.autoParent(canvas)	
		.add ( new HPath() )

		// 		.add(
		// 	new HEllipse(20)
		// 		// .rounding(10)
		// 		// .anchor(30,0)
		// 		.anchorAt(H.CENTER)
		// 		.noStroke()
		// 		.noFill()
		// 		// .stroke(#ffffff)
		// 		// .fill(#ffffff)
		// 		// .rotation(45)
		// )

		// .layout (
		// 	new HGridLayout()
		// 	.startX(32)
		// 	.startY(32)
		// 	.spacing(10,50)
		// 	.cols(64)
		// )

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool2.currentIndex();
					HPath d = (HPath) obj;
					d
						.polygon(4)
						.height(140)
						.width(5)
						.anchorAt(H.CENTER)
						.loc( (int)random(width), (int)random(height-100) )
						// .fill(#555555)
						// .stroke(#ffffff)
						// .strokeWeight(.5)
						// .noFill()
						.rotation(135)
						.noStroke()
					;

					
					// new HOscillator()
					// 	.target(d)
					// 	.property(H.ROTATIONY)
					// 	.range(0, 360)
					// 	.speed(.7)
					// 	.freq(.7)
					// 	// .waveform(H.SAW)
					// 	.currentStep(i)
					// ;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.ROTATIONZ)
					// 	.range(0, 360)
					// 	.speed(.2)
					// 	.freq(1.5)
					// 	// .waveform(H.SAW)
					// 	.currentStep(i*2)
					// ;

					new HOscillator()
						.target(d)
						.property(H.WIDTH)
						// .relativeVal(d.y())
						.range(5, 10)
						.speed(1)
						.freq(7)
						.waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(175, 425)
						.speed(.1)
						.freq(6)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.HEIGHT)
						.range(40, 200)
						.speed(.5)
						.freq(2)
						// .waveform(H.SAW)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(300, 50)
						.speed(.6)
						.freq(2.2)
						// .waveform(H.SAW)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.Y)
						.range(-50, height+50)
						.speed(.1)
						.freq(7)
						.waveform(H.SAW)
						.currentStep(i+100)
					;

				}
			}
		)

		.requestAll()
	;



	// pool3 = new HDrawablePool(20); //big tris
	// pool3.autoAddToStage()
	// // pool3.autoParent(canvas)	
	// 	.add ( new HPath() )

	// 	// 		.add(
	// 	// 	new HEllipse(20)
	// 	// 		// .rounding(10)
	// 	// 		// .anchor(30,0)
	// 	// 		.anchorAt(H.CENTER)
	// 	// 		.noStroke()
	// 	// 		.noFill()
	// 	// 		// .stroke(#ffffff)
	// 	// 		// .fill(#ffffff)
	// 	// 		// .rotation(45)
	// 	// )

	// 	// .layout (
	// 	// 	new HGridLayout()
	// 	// 	.startX(32)
	// 	// 	.startY(32)
	// 	// 	.spacing(10,50)
	// 	// 	.cols(64)
	// 	// )

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				int i = pool3.currentIndex();
	// 				HPath d = (HPath) obj;
	// 				d
	// 					.polygon(3)
	// 					.size(30)
	// 					.anchorAt(H.CENTER)
	// 					.loc( width/2, (int)random(height-100) )
	// 					// .fill(#555555)
	// 					// .stroke(#ffffff)
	// 					// .strokeWeight(.5)
	// 					// .noFill()
	// 					.rotation(90)
	// 					.noStroke()
	// 				;

	// 				d
						
	// 					.size((int)random(50,200))
	// 					.fill(colors2.getColor())
	// 					// .noStroke()				
	// 				;

					
	// 				// new HOscillator()
	// 				// 	.target(d)
	// 				// 	.property(H.ROTATIONY)
	// 				// 	.range(0, 360)
	// 				// 	.speed(1)
	// 				// 	.freq(.5)
	// 				// 	// .waveform(H.SAW)
	// 				// 	.currentStep(i)
	// 				// ;

	// 				// new HOscillator()
	// 				// 	.target(d)
	// 				// 	.property(H.ROTATIONZ)
	// 				// 	.range(0, 180)
	// 				// 	.speed(.4)
	// 				// 	.freq(1.5)
	// 				// 	// .waveform(H.SAW)
	// 				// 	.currentStep(i*2)
	// 				// ;

	// 				// new HOscillator()
	// 				// 	.target(d)
	// 				// 	.property(H.X)
	// 				// 	.range(50, 590)
	// 				// 	.speed(.5)
	// 				// 	.freq(1)
	// 				// 	.currentStep(i*2)
	// 				// ;

	// 				// new HOscillator()
	// 				// 	.target(d)
	// 				// 	.property(H.HEIGHT)
	// 				// 	.range(20, 200)
	// 				// 	.speed(1)
	// 				// 	.freq(2)
	// 				// 	// .waveform(H.SAW)
	// 				// 	.currentStep(i*2)
	// 				// ;

	// 				new HOscillator()
	// 					.target(d)
	// 					.property(H.Z)
	// 					.range(200, 0)
	// 					.speed(1)
	// 					.freq(2)
	// 					// .waveform(H.SAW)
	// 					.currentStep(i*2)
	// 				;

	// 				new HOscillator()
	// 					.target(d)
	// 					.property(H.Y)
	// 					.range(-50, height+50)
	// 					.speed(.2)
	// 					.freq(7)
	// 					.waveform(H.SAW)
	// 					.currentStep(i+100)
	// 				;

	// 			}
	// 		}
	// 	)

	// 	.requestAll()
	// ;

	
	
}
 
void draw(){ 
	

  	// for(HDrawable d : pool) {

  	// 	d.fill(pcolors.getColor(d.x(), d.y()),200);
   // 	}

	pointLight(20, 190, 190,  0, 200, 100);        // blue
	pointLight(224, 0, 134,  width, height/2, 300);   // pink
	pointLight(72, 0, 151,  width/2, height/2, 100); // purple


	H.drawStage();
	
	filter(flipHalf); //flip half composition with glsl shader


	// if(frameCount % 1 == 0 && frameCount < 360){
	// 	saveFrame("../frames/image-#####.png");
	// }


}


// +        = redraw() advances 1 iteration 
// r        = render to PDF
// c        = recolor 


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

		// 	for (HDrawable temp : pool) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }

		// 	for (HDrawable temp : pool2) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		
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

