import processing.pdf.*;
boolean record = false;

HDrawablePool pool;

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	HImage hitObj = new HImage("SC.png");
	H.add(hitObj).visibility(false);

	HShapeLayout hsl = new HShapeLayout().target(hitObj);
	
	pool = new HDrawablePool(2000);
	pool.autoAddToStage()
		.add (
			new HRect(4).rounding(2)
		)

		.colorist( new HColorPool(#2A77E8, #495DFF, #3BC4FF, #2AE8E8, #2EFFBD).fillOnly() )

		.layout(hsl)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.size( 4+((int)random(4)) )
						.anchorAt(H.CENTER)
						.rotation(45)
					;
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
	noLoop();
}

void draw() {}

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
		redraw();
	}

	// if (key == 'c') {
	// 	for (HDrawable temp : pool4) {
	// 		HShape d = (HShape) temp;
	// 		d.randomColors(colors.fillOnly());
	// 	}

		redraw();
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

