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
	H.init(this).background(#031322).autoClear(true);
	smooth();

	HEllipse hitObj = new HEllipse(300);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("topcircle.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(800).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("jellies.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(1000).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("jellies2.png");
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

	colors = new HColorPool()

		.add(#15789f) //blue
		.add(#98f2e6,2) // mid blue
 		.add(#30c7ce,4) //light green
		.add(#DBCAB0,2) //tan
		.add(#DBDAD5,6) //lightest
		.add(#7AADD7,4) //blue
		.add(#8EB8D9,8) //light blue
		.add(#B5C6D7,4) //v.light blue
		// .add(#ffffff)
		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#DBCAB0,2) //tan
		.add(#DBDAD5,6) //lightest
		.add(#8EB8D9,8) //light blue
		.add(#B5C6D7,4) //v.light blue
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

	pool3 = new HDrawablePool(200); //Circles
	pool3.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))
		// .add (new HShape("cloud1.svg").enableStyle(false).anchorAt(H.CENTER))
		// .add (new HShape("cloud2.svg").enableStyle(false).anchorAt(H.CENTER),2)
		// .add (new HShape("cloud3.svg").enableStyle(false).anchorAt(H.CENTER),2)

		.colorist(colors)
		.layout(hsl4)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						.fill( colors2.getColor(), 50)
						// .fill(#ffffff)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(4,20))
						// .rotation(45)
					;
					
				}
			}
		)

	.requestAll()
	;


	pool5 = new HDrawablePool(5); // back arabesques
	pool5.autoAddToStage()
		
		.add (new HShape("wisp.svg").anchorAt(H.CENTER),2)
		.add (new HShape("wisp2.svg").anchorAt(H.CENTER), 2)
		.add (new HShape("wisp3.svg").anchorAt(H.CENTER))
		.add (new HShape("wisp4.svg").anchorAt(H.CENTER))
		.add (new HShape("wisp5.svg").anchorAt(H.CENTER))
		.add (new HShape("wisp6.svg").anchorAt(H.CENTER))


		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					
					d
						
						.enableStyle(false)
						.fill( colors2.getColor(), 75)
						// .strokeWeight(0.1)
						// .stroke(#000000, 200)
						.noStroke()
						// .fill(#ffffff)
						.size((int)random(300,1200))
						.rotation((int)random(360))
						.loc((int)random(width),height/2)
						
					;
					

				}
			}
		)

	.requestAll()
	;


	// pool2 = new HDrawablePool(8); // arabesques
	// pool2.autoAddToStage()

	// 	.add (new HShape("arabesque.svg"))


	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.anchorAt(H.CENTER)
	// 					.strokeWeight(0.3)
	// 					.stroke(#000000)
	// 					// .noStroke()
	// 					.rotation(90)						
	// 					.size((int)random(50,400))
	// 					.loc((int)random(width),height/2)
	// 				;
	// 				d.randomColors(colors.fillOnly());
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;

	pool4 = new HDrawablePool(230); // arabesques
	pool4.autoAddToStage()


		.add (new HShape("wisp.svg").anchorAt(H.CENTER),2)
		.add (new HShape("wisp2.svg").anchorAt(H.CENTER), 2)
		.add (new HShape("wisp3.svg").anchorAt(H.CENTER))
		.add (new HShape("wisp4.svg").anchorAt(H.CENTER))
		.add (new HShape("wisp5.svg").anchorAt(H.CENTER))
		.add (new HShape("wisp6.svg").anchorAt(H.CENTER))

		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						.fill( colors.getColor())
						.anchorAt(H.CENTER)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(0.7)
						.stroke(#15789f, 100)
						// .noStroke()
						.rotation((int)random(360))						
						.size((int)random(40,340))
						
					;
					
					
				}
			}
		)

	.requestAll()
	;

	pool = new HDrawablePool(120); //bubbles
	pool.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))

		.colorist(colors2)
		// .layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						.fill( colors2.getColor(), 200)
						// .fill(#ffffff)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						.loc( (int)random(320,width-250), (int)random(100,height-250) )
						.size((int)random(2,20))
						// .rotation(45)
					;

					
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
		H.drawStage();
	}

	if (key == 'c') {

		// 	for (HDrawable temp : pool) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }

			for (HDrawable temp : pool5) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}
		
		// 	for (HDrawable temp : pool3) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		
		// 	for (HDrawable temp : pool4) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }

		H.drawStage();
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
