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


void setup() {
	size(1200,1200);
	H.init(this).background(#ffffff).autoClear(true);
	smooth();

	HImage hitObj = new HImage("diamond.png");
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false).size(800);
	hsl = new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("sperm2.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("cloudy.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("cloudy2.png");
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

	colors = new HColorPool()
		.add(#cdfdff, 8) //light green
		.add(#01f4c4, 9) //teal
		.add(#444e4d,2) // dark grey
		.add(#fbee01) //yellow
		.add(#ffa902) //orange
		.add(#ffffff)
		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#01f4c4) //teal
		.add(#fbee01,4) //yellow
		.add(#ffa902,4) //orange
		.add(#ffffff)
		.fillOnly()
	;

	// grey: #bdbdbd

	drawThings();
	H.drawStage();

}


void draw() {

	
}


void drawThings() {

	// HRect clearBG = new HRect(width);
	// clearBG.fill(#ffffff).noStroke();
	// H.add(clearBG);

	H.clearStage();

	pool = new HDrawablePool(5); // BG colorful sperm
	pool.autoAddToStage()

		.add (new HShape("spermy1.svg").enableStyle(false).anchorAt(H.CENTER),4)
		.add (new HShape("spermy2.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("spermy3.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("spermy4.svg").enableStyle(false).anchorAt(H.CENTER),3)
		.add (new HShape("spermy5.svg").enableStyle(false).anchorAt(H.CENTER),3)
		.add (new HShape("spermy6.svg").enableStyle(false).anchorAt(H.CENTER))

		.layout(hsl)
		.colorist(colors)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					
					int i = pool.currentIndex();

					d
						// .strokeWeight(2)
						.noStroke()
						.size((int)random(40,150))
						.rotation(random(-90, 90))
					;

				}
			}
		)

	.requestAll()
	;

	pool5 = new HDrawablePool(3); // BG triangles
	pool5.autoAddToStage()


		.add (new HShape("triangles3.svg").enableStyle(false).anchorAt(H.CENTER),3)
		.add (new HShape("triangles4.svg").enableStyle(false).anchorAt(H.CENTER))

		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					
					int i = pool5.currentIndex();

					d
						.strokeWeight(0.1)
						.stroke(#bdbdbd)
						.fill(#ffffff)
						.size((int)random(100,500))
						
					;

				}
			}
		)

	.requestAll()
	;


	pool4 = new HDrawablePool(34); // Big colorful sperm
	pool4.autoAddToStage()

		.add (new HShape("spermy1.svg").enableStyle(false).anchorAt(H.CENTER),4)
		.add (new HShape("spermy2.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("spermy3.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("spermy4.svg").enableStyle(false).anchorAt(H.CENTER),3)
		.add (new HShape("spermy5.svg").enableStyle(false).anchorAt(H.CENTER),3)
		.add (new HShape("spermy6.svg").enableStyle(false).anchorAt(H.CENTER))

		.layout(hsl)
		.colorist(colors)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					
					int i = pool4.currentIndex();

					d
						// .strokeWeight(2)
						.noStroke()
						.size((int)random(20,180))
						.rotation(random(-45, 45))
					;

				}
			}
		)

	.requestAll()
	;


	pool2 = new HDrawablePool(10); // colorful music symbols
	pool2.autoAddToStage()

		.add (new HShape("music1.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("music2.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("music3.svg").enableStyle(false).anchorAt(H.CENTER), 3)
		.add (new HShape("music4.svg").enableStyle(false).anchorAt(H.CENTER), 3)


		.colorist(colors2)
		.layout(hsl)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						// .rotation((int)random(-20,20))						
						.size((int)random(20,50))
					;
					
				}
			}
		)

	.requestAll()
	;

	pool3 = new HDrawablePool(5); //top triangles
	pool3.autoAddToStage()

		.add (new HShape("triangles.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("triangles2.svg").enableStyle(false).anchorAt(H.CENTER))
		.add (new HShape("triangles3.svg").enableStyle(false).anchorAt(H.CENTER),3)
		.add (new HShape("triangles4.svg").enableStyle(false).anchorAt(H.CENTER))

		.colorist(colors2)
		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						// .fill(#ffffff)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(20,100))
						// .rotation(45)
					;
					// d.randomColors(colors);
				}
			}
		)

	.requestAll()
	;

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

	if (key == '+') {
		drawThings();
	}

	if (key == 'r') {
		record = true;
		saveVector();
	}

	if (key == 'c') {
		for (HDrawable temp : pool4) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

		redraw();
	}
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
