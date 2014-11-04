import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HDrawablePool pool2;
HDrawablePool pool3;
HDrawablePool pool4;
HDrawablePool pool5;

HColorPool colors;
HColorField colorField;
HPixelColorist pcolors;

void setup(){
	size(640,640, P3D);
	H.init(this).background(#202020).use3D(true);
	smooth();

	frameRate(24);



	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #CCCCCC, #999999, #666666, #4D4D4D, #333333);

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

	pool = new HDrawablePool(91);
	pool.autoAddToStage()
		.add( new HPath() )

		.layout(
			new HHexLayout()
			.spacing(30)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HPath d = (HPath) obj;
					d
						.polygon(6)
						.size(210)
						.anchorAt(H.CENTER)
						.stroke(#ffffff)
						.strokeWeight(4)
						.noFill()
					;

					new HOscillator()
						.target(d)
						.property(H.SIZE)
						// .relativeVal(d.y())
						.range(35, 140)
						.speed(2)
						.freq(1.5)
						.currentStep(i)
					;


				}
			}
		)

		.requestAll()
	;


	pool = new HDrawablePool(91);
	pool.autoAddToStage()
		.add( new HPath() )

		.layout(
			new HHexLayout()
			.spacing(45)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HPath d = (HPath) obj;
					d
						.polygon(6)
						.size(70)
						.anchorAt(H.CENTER)
						.stroke(#ffffff)
						.strokeWeight(2)
						.noFill()
					;

					new HOscillator()
						.target(d)
						.property(H.SIZE)
						// .relativeVal(d.y())
						.range(35, 105)
						.speed(1.5)
						.freq(2)

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

