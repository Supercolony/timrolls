import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HDrawablePool pool2;
HDrawablePool pool3;
HDrawablePool pool4;
HDrawablePool pool5;

HColorPool colors;
HColorPool colors2;
HColorField colorField;
HPixelColorist pcolors;

void setup(){
	size(640,640, P3D);
	H.init(this).background(#e7e7e7).use3D(true);
	smooth();

	frameRate(24);

		colors = new HColorPool()

		.add(#ffffff,20) //white
		.add(#cccccc,5) //grey
		// .add(#ff8d37) //light orange
		.add(#e7e7e7,20) // grey
 		// .add(#1c0d68) //purple
		// .add(#5001be) //light purp
		.add(#02fcfa) //teal
		// .add(#fe39a2) //pink
		.add(#7bfc88) //green
		// .add(#dee7ff)
		// .add(#c7f6fe)
		// .add(#2f3b5c)
		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#ffffff,5) //white
		.add(#000000,5) //black
		.add(#dee7ff,12)
		.add(#c7f6fe,2)
		.add(#2f3b5c,2)
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

	pool = new HDrawablePool(1200);
	pool.autoAddToStage()
		.add( new HPath() )

		.layout (
			new HGridLayout()
			.startX(32)
			.startY(32)
			.spacing(5,70)
			.cols(128)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HPath d = (HPath) obj;
					d
						.polygon(3)
						.size(140)
						.anchorAt(H.CENTER)
						// .stroke(#ffffff)
						// .strokeWeight(.5)
						// .noFill()
						// .noStroke()
					;

					d.fill(colors.getColor());

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.X)
					// 	// .relativeVal(d.y())
					// 	.range(width, 0)
					// 	.speed(2)
					// 	.freq(1.5)
					// 	// .currentStep(i)
					// ;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(0, 360)
						.speed(2)
						.freq(1.5)
						// .waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(0, 360)
						.speed(1)
						.freq(1.5)
						// .waveform(H.SAW)
						.currentStep(i)
					;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.X)
					// 	.range(width-100, 100)
					// 	.speed(2)
					// 	.freq(1)
					// 	.currentStep(i)
					// ;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(50, 0)
						.speed(1)
						.freq(1)
						// .waveform(H.SAW)
						.currentStep(i)
					;

				}
			}
		)

		.requestAll()
	;


	pool2 = new HDrawablePool(2400);
	pool2.autoAddToStage()
		.add( new HPath() )

		.layout (
			new HGridLayout()
			.startX(32)
			.startY(32)
			.spacing(5,35)
			.cols(128)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool2.currentIndex();
					HPath d = (HPath) obj;
					d
						.polygon(3)
						.size(210)
						.anchorAt(H.CENTER)
						// .stroke(#ffffff)
						// .strokeWeight(.5)
						// .noFill()
						// .noStroke()
						.z(-300)
					;

					d.fill(colors.getColor());

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.X)
					// 	// .relativeVal(d.y())
					// 	.range(width, 0)
					// 	.speed(2)
					// 	.freq(1.5)
					// 	// .currentStep(i)
					// ;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(0, 360)
						.speed(1)
						.freq(.5)
						// .waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(0, 360)
						.speed(1)
						.freq(.5)
						// .waveform(H.SAW)
						// .currentStep(i)
					;
					// new HOscillator()
					// 	.target(d)
					// 	.property(H.ROTATIONY)
					// 	.range(0, 360)
					// 	.speed(2)
					// 	.freq(.5)
					// 	// .waveform(H.SAW)
					// 	// .currentStep(i)
					// ;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(50, -300)
						.speed(1)
						.freq(1)
						// .waveform(H.SAW)
						.currentStep(i)
					;

				}
			}
		)

		.requestAll()
	;

	
	
}
 
void draw(){ 

  	// for(HDrawable d : pool) {

  	// 	d.fill(pcolors.getColor(d.x(), d.y()),200);
   // 	}

	pointLight(255, 255, 255,  0, height/2, 100);        // orange
	pointLight(0, 149, 168,  width, height/2, 300);   // teal
	pointLight(255, 204, 0,  width/2, height/2, 100); // yellow

 //   	   if(frameCount % 1 == 0 && frameCount < 360){
	// 	saveFrame("../frames/image-#####.png");
	// }

	H.drawStage();
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

