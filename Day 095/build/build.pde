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

HPixelColorist pcolors;

void setup() {
	size(800,800);
	H.init(this).background(#000000).autoClear(true);
	smooth();

	frameRate(24);

	HEllipse hitObj = new HEllipse(300);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);


 	pcolors= new HPixelColorist("gradient2.jpg")
	.fillOnly()
	// .strokeOnly()
	// .fillAndStroke()

	;

	// colors = new HColorPool()

	// 	.add(#026396,3) //blue
	// 	.add(#fe057d,5) //fuscia
	// 	.add(#e882c4,2) //pink
	// 	.add(#68005f) //rust
	// 	.add(#76d0d0,2) //teal
	// 	.add(#1f2942,2) //purplish
	// 	.add(#4b575c,3) // grey
	// 	.add(#c9d3d4,8) 
	// 	.fillOnly()
	// ;


	colors2 = new HColorPool()
		.add(#0b0c0c,4) 
		// .add(#3e564f,3)
		.add(#0f1525,8)
		.add(#222232,6)
		.add(#76d0d0) //teal
		.add(#fe057d) //fuscia
		.add(#1f2942,2) //purplish

		.fillOnly()
	;


	pool = new HDrawablePool(1800);
	pool.autoAddToStage()
		.add(
			new HRect(2)
			// .rounding(3)
			.anchorAt(H.CENTER)
			.noStroke()
		)

		.layout(
			new HGridLayout()
			.startLoc(0, height/2)
			.spacing(4, 0)
			.cols(600)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();

					HDrawable d = (HDrawable) obj;
					// d.fill( colors2.getColor(i*100) );

					new HOscillator()
						.target(d)
						.property(H.Y)
						.relativeVal(d.y())
						.range(-200, 200)
						.speed(2)
						.freq(0.5)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATION)
						.range(-180, 180)
						.speed(1)
						.freq(0.5)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.HEIGHT)
						.range(2, 400)
						.speed(2)
						.freq(1)
						.currentStep(i)
					;
				}
			}
		)

		.requestAll()
	;


}

void draw() {

  for(HDrawable d : pool) {

  		pcolors.applyColor(d);
   		}

   if(frameCount % 1 == 0 && frameCount < 360){
		saveFrame("../frames/image-#####.png");
	}


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

			for (HDrawable temp : pool) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

			for (HDrawable temp : pool2) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
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
