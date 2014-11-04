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
	H.init(this).background(#fffee9).autoClear(true);
	smooth();

	HEllipse hitObj = new HEllipse(300);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);


	// HImage hitObj2 = new HImage("sperm2.png");
	// H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	// hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("wispy.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("cloudy2.png");
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

	colors = new HColorPool()
		.add(#ae2569, 8) //dark pink
		.add(#f7bfdc, 9) //Blossom
		.add(#fce8f3,2) // light pink
		.add(#f1cd81) //yellow
		// .add(#452e1c) //brown
		.add(#91c5fb) //blue
		.add(#e0e0e0,3) //grey
		// .fillOnly()
	;

	colors2 = new HColorPool()
		.add(#f1cd81) //yellow
		// .add(#fbee01,4) //yellow
		// .add(#ffa902,4) //orange
		.add(#e0e0e0) //grey
		.fillOnly()
	;

	// grey: #bdbdbd

	drawThings();

}


void draw() {

	
}


void drawThings() {

	// HRect clearBG = new HRect(width);
	// clearBG.fill(#ffffff).noStroke();
	// H.add(clearBG);

	H.clearStage();


	pool3 = new HDrawablePool(5); //Circles
	pool3.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))

		.colorist(colors2)
		.layout(hsl)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						// .fill(#ffffff)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(250,500))
						// .rotation(45)
					;
					
				}
			}
		)

	.requestAll()
	;

	pool5 = new HDrawablePool(5); // Trees
	pool5.autoAddToStage()

		.add (new HShape("flower5.svg").enableStyle(false).anchorAt(H.CENTER))

		.layout(hsl4)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					
					d
						.strokeWeight(0.1)
						.stroke(#303030)
						.fill(#452e1c)
						.size((int)random(200,300))
						.rotation((int)random(-45,45))
					;

				}
			}
		)

	.requestAll()
	;

	pool = new HDrawablePool(200); // Colorful flowers
	pool.autoAddToStage()

		.add (new HShape("flower.svg"),2)
		.add (new HShape("flower2.svg"))
		.add (new HShape("flower3.svg"))
		.add (new HShape("flower6.svg"),2)


		.layout(hsl)
		.colorist(colors)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false).anchorAt(H.CENTER)
						.strokeWeight(0.5)
						.stroke(#202020)
						// .noStroke()
						.size((int)random(40,150))
						.rotation(random(-90, 90))
					;
					d.randomColors(colors.fillOnly());

				}
			}
		)

	.requestAll()
	;


	pool4 = new HDrawablePool(100); // petals
	pool4.autoAddToStage()

		.add (new HShape("Shape 6.svg").anchorAt(H.CENTER))
		.add (new HShape("Shape 7.svg").anchorAt(H.CENTER))
		.add (new HShape("flower4.svg").anchorAt(H.CENTER),3)

		.layout(hsl3)
		
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeWeight(0.5)
						.stroke(#202020)
						// .noStroke()
						.size((int)random(60,120))
						.rotation(random(360))
					;
					
					d.randomColors(colors.fillOnly());

				}
				
			}
		)

	.requestAll()
	;


	pool2 = new HDrawablePool(100); // single petals
	pool2.autoAddToStage()

		.add (new HShape("flower4.svg").anchorAt(H.CENTER),3)
		.add (new HShape("Shape 6.svg").anchorAt(H.CENTER))

		.colorist(colors2)
		.layout(hsl4)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.strokeWeight(0.5)
						.stroke(#202020)
						// .noStroke()
						.rotation((int)random(360))						
						.size((int)random(40,120))
					;
					d.randomColors(colors.fillOnly());
					
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
		redraw();
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
