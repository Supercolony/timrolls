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
	H.init(this).background(#132023).autoClear(true);
	smooth();

	HEllipse hitObj = new HEllipse(250);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("topcircle.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(900).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("cloudy3.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(800).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	// HImage hitObj4 = new HImage("jellies2.png");
	// H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	// hsl4 = new HShapeLayout().target(hitObj4);

	colors = new HColorPool()

		.add(#98C32F) //yellowish
		.add(#0A5282,2) // blue
 		.add(#2EECCB,4) //light teal
		.add(#1DFDAC,2) //teal
		.add(#53B517,6) //green
		.add(#0AAE2A,4) //b green
		.add(#00C1BA,8) //light blue
		.add(#004D37,4) //d. green
		// .add(#ffffff)
		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#ffffff,2) 
		.add(#e7e7e7,3) //lightest
		.add(#0A5282) // blue
		.add(#B5C6D7,2) //v.light blue
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

	// pool3 = new HDrawablePool(200); //Circles
	// pool3.autoAddToStage()

	// 	.add (new HEllipse(300).anchorAt(H.CENTER))
	// 	// .add (new HShape("cloud1.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	// .add (new HShape("cloud2.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	// .add (new HShape("cloud3.svg").enableStyle(false).anchorAt(H.CENTER),2)

	// 	.colorist(colors)
	// 	.layout(hsl4)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HDrawable d = (HDrawable) obj;
	// 				d
						
	// 					.fill( colors2.getColor(), 50)
	// 					// .fill(#ffffff)
	// 					// .strokeWeight(0.3)
	// 					// .stroke(#000000)
	// 					.noStroke()
	// 					// .loc( (int)random(300,width-300), (int)random(300,height-300) )
	// 					.size((int)random(4,20))
	// 					// .rotation(45)
	// 				;
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;


	pool5 = new HDrawablePool(7); // back camo
	pool5.autoAddToStage()
		
		.add (new HShape("camo.svg").anchorAt(H.CENTER),2)
		.add (new HShape("camo2.svg").anchorAt(H.CENTER), 2)
		.add (new HShape("camo3.svg").anchorAt(H.CENTER))
		.add (new HShape("camo4.svg").anchorAt(H.CENTER))
		.add (new HShape("camo5.svg").anchorAt(H.CENTER))
		.add (new HShape("camo6.svg").anchorAt(H.CENTER))
		.add (new HShape("camo7.svg").anchorAt(H.CENTER))



		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					
					d
						
						.enableStyle(false)
						.fill( colors2.getColor())
						// .strokeWeight(0.1)
						// .stroke(#000000, 200)
						.noStroke()
						// .fill(#ffffff)
						.size((int)random(300,1200))
						// .rotation((int)random(360))
						.loc((int)random(width),height/2)
						
					;
					

				}
			}
		)

	.requestAll()
	;


	pool = new HDrawablePool(9); //drips
	pool.autoAddToStage()

		.add (new HShape("graf4.svg"))
		.add (new HShape("graf5.svg"))
		.add (new HShape("graf6.svg"))

		.layout(hsl)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.anchorAt(H.CENTER)
						.fill( colors2.getColor(), 200)
						// .fill(#ffffff)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						// .loc( (int)random(320,width-250), (int)random(100,height-250) )
						.size((int)random(90,400))
						// .rotation(45)
					;
					d.randomColors(colors2.fillOnly());
					
				}
			}
		)

	.requestAll()
	;





	pool4 = new HDrawablePool(40); // camo
	pool4.autoAddToStage()


		.add (new HShape("camo.svg").anchorAt(H.CENTER),2)
		.add (new HShape("camo2.svg").anchorAt(H.CENTER), 2)
		.add (new HShape("camo3.svg").anchorAt(H.CENTER))
		.add (new HShape("camo4.svg").anchorAt(H.CENTER))
		.add (new HShape("camo5.svg").anchorAt(H.CENTER))
		.add (new HShape("camo6.svg").anchorAt(H.CENTER))
		.add (new HShape("camo7.svg").anchorAt(H.CENTER))

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
						.strokeWeight(0.3)
						.stroke(#000000)
						// .noStroke()
						// .rotation((int)random(360))						
						.size((int)random(100,250))
						
					;
					
					
				}
			}
		)

	.requestAll()
	;

	pool2 = new HDrawablePool(20); // graf
	pool2.autoAddToStage()

		.add (new HShape("graf.svg"))
		.add (new HShape("graf2.svg"))
		.add (new HShape("graf3.svg"))


		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.anchorAt(H.CENTER)
						.strokeWeight(0.3)
						.stroke(#000000)
						// .noStroke()
						.rotation((int)random(360))						
						.size((int)random(70,300))
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;

	pool3 = new HDrawablePool(20); // camo
	pool3.autoAddToStage()


		.add (new HShape("camo.svg").anchorAt(H.CENTER),2)
		.add (new HShape("camo2.svg").anchorAt(H.CENTER), 2)
		.add (new HShape("camo3.svg").anchorAt(H.CENTER))
		.add (new HShape("camo4.svg").anchorAt(H.CENTER))
		.add (new HShape("camo5.svg").anchorAt(H.CENTER))
		.add (new HShape("camo6.svg").anchorAt(H.CENTER))
		.add (new HShape("camo7.svg").anchorAt(H.CENTER))

		.layout(hsl2)

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
						.strokeWeight(0.3)
						.stroke(#000000)
						// .noStroke()
						// .rotation((int)random(360))						
						.size((int)random(100,250))
						
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

			for (HDrawable temp : pool2) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}
		
			for (HDrawable temp : pool3) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}
		
			for (HDrawable temp : pool4) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

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
