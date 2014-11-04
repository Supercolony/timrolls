import processing.pdf.*;
boolean record = false;

/* @pjs preload="sintra.jpg"; */

HDrawablePool pool;
HDrawablePool pool2;

int cellSize = 40;

void setup() {
	size(1215,1215);
	H.init(this).background(#202020);
	smooth();

	final HPixelColorist colors = new HPixelColorist("wave.jpg")
		.fillOnly()
		// .strokeOnly()
		// .fillAndStroke()
	;

	pool = new HDrawablePool(729); // big ones
	pool.autoAddToStage()
		// .add (
		// 	new HRect()
		// 	.rounding(2)
		// 	.rotate(45)
		// )
			.add(new HShape ("japan.svg"))
			.add(new HShape ("japan2.svg"))
			.add(new HShape ("japan3.svg"))
			.add(new HShape ("japan4.svg"))
			.add(new HShape ("japan5.svg"))

		.layout (
			new HGridLayout()
			.startX(35)
			.startY(35)
			.spacing(cellSize+4,cellSize+4)
			.cols(27)
		)

		.onCreate (
			new HCallback(){
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(cellSize)
					;

					colors.applyColor(d);
				}
			}
		)

		.requestAll()
	;


	pool2 = new HDrawablePool(675); // little ones
	pool2.autoAddToStage()
		.add (
			new HEllipse()
			// .rounding(1)
			.rotate(45)
		)

		.layout (
			new HGridLayout()
			.startX(58)
			.startY(58)
			.spacing(cellSize+4,cellSize+4)
			.cols(26)
		)

		.onCreate (
			new HCallback(){
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.anchorAt(H.CENTER)
						.size(8)
					;

					colors.applyColor(d);
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
	noLoop();
}

void draw() {}



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
		saveVector();
		H.drawStage();
	}

	// if (key == 'c') {
	// 	for (HDrawable temp : pool4) {
	// 		HShape d = (HShape) temp;
	// 		d.randomColors(colors.fillOnly());
	// 	}

	// 	redraw();
	// }
}


void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "render_#####.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}
