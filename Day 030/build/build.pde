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
	size(1200,1200);
	H.init(this).background(#fffddf).autoClear(true);
	smooth();

	HEllipse hitObj = new HEllipse(250);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("wavy.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(1000).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("wavy2.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(1200).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	// HImage hitObj4 = new HImage("jellies2.png"); 
	// H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	// hsl4 = new HShapeLayout().target(hitObj4);

 	pcolors= new HPixelColorist("indajungle.jpg")
	.fillOnly()
	// .strokeOnly()
	// .fillAndStroke()
	;

	colors = new HColorPool()

		.add(#cb9d01,2) //dark yellow
		.add(#fdcf03,3) //yellowish
		.add(#031b1f,8) // blue
 		.add(#0e7488,4) //light teal
		.add(#094e5d,2) //dark teal
		.add(#fe0458,4) //fuscia
		.add(#beeefb,8) //light blue
		.add(#bb0235,4) //d. fuscia
		// .add(#ffffff)
		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#ffffff) 
		.add(#e7e7e7) //lightest
		// .add(#0A5282) // blue
		.add(#B5C6D7) //v.light blue
		.add(#333333,2)
		.add(#666666)
		.add(#111111,3)
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

	pool3 = new HDrawablePool(250); //Circles
	pool3.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER),8)
		// .add (new HShape("camo.svg").enableStyle(false).anchorAt(H.CENTER))
		// .add (new HShape("camo2.svg").enableStyle(false).anchorAt(H.CENTER))
		// .add (new HShape("camo3.svg").enableStyle(false).anchorAt(H.CENTER))

		// .colorist(colors2)
		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						// .fill( colors2.getColor(), 50)
						.fill(#05191e)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(6,40))
						// .rotation(45)
					;
					// pcolors.applyColor(d);
					
				}
			}
		)

	.requestAll()
	;


	// pool5 = new HDrawablePool(7); // back camo
	// pool5.autoAddToStage()
		
	// 	.add (new HShape("camo.svg").anchorAt(H.CENTER),2)
	// 	.add (new HShape("camo2.svg").anchorAt(H.CENTER), 2)
	// 	.add (new HShape("camo3.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo4.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo5.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo6.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo7.svg").anchorAt(H.CENTER))



	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
					
	// 				d
						
	// 					.enableStyle(false)
	// 					.fill( colors2.getColor())
	// 					// .strokeWeight(0.1)
	// 					// .stroke(#000000, 200)
	// 					.noStroke()
	// 					// .fill(#ffffff)
	// 					.size((int)random(300,1200))
	// 					// .rotation((int)random(360))
	// 					.loc((int)random(width),height/2)
						
	// 				;
					

	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;


	pool = new HDrawablePool(60); //bottom camo
	pool.autoAddToStage()

		.add (new HShape("camo.svg").anchorAt(H.CENTER))
		.add (new HShape("camo2.svg").anchorAt(H.CENTER))
		.add (new HShape("camo3.svg").anchorAt(H.CENTER))
		.add (new HShape("camo4.svg").anchorAt(H.CENTER))
		.add (new HShape("camo5.svg").anchorAt(H.CENTER))
		.add (new HShape("stroke2.svg").anchorAt(H.CENTER),2)
		.add (new HShape("stroke3.svg").anchorAt(H.CENTER))
		.add (new HShape("stroke4.svg").anchorAt(H.CENTER))

		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.anchorAt(H.CENTER)
						// .fill( colors2.getColor())
						.fill(#05191e)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						// .loc( (int)random(320,width-250), (int)random(100,height-250) )
						.size((int)random(90,400))
						// .rotation(45)
					;
					// d.randomColors(colors2.fillOnly());
					
				}
			}
		)

	.requestAll()
	;

	pool3 = new HDrawablePool(24); // strokes
	pool3.autoAddToStage()


		// .add (new HShape("stroke1.svg").anchorAt(H.CENTER),2)
		.add (new HShape("stroke2.svg").anchorAt(H.CENTER),2)
		.add (new HShape("stroke3.svg").anchorAt(H.CENTER))
		.add (new HShape("stroke4.svg").anchorAt(H.CENTER))
		// .add (new HShape("stroke5.svg").anchorAt(H.CENTER))
		.add (new HShape("stroke6.svg").anchorAt(H.CENTER),2)
		.add (new HShape("stroke7.svg").anchorAt(H.CENTER),2)


		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						.fill( colors.getColor())
						.anchorAt(H.CENTER)
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(0.3)
						// .stroke(#05191e)
						.noStroke()
						.rotation(30)						
						.size((int)random(40,600))
						// .loc(random(width), (height/2)+random(0,500))
												
					;
					// pcolors.applyColor(d);
					
				}
			}
		)

	.requestAll()
	;



	pool2 = new HDrawablePool(30); // top camo
	pool2.autoAddToStage()

		.add (new HShape("camo.svg").anchorAt(H.CENTER))
		.add (new HShape("camo2.svg").anchorAt(H.CENTER))
		.add (new HShape("camo3.svg").anchorAt(H.CENTER))
		.add (new HShape("camo4.svg").anchorAt(H.CENTER))
		.add (new HShape("camo5.svg").anchorAt(H.CENTER))


		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.anchorAt(H.CENTER)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						// .rotation((int)random(360))						
						.size((int)random(100,400))
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;



	pool4 = new HDrawablePool(50); //top Circles
	pool4.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))
		// .add (new HShape("cloud1.svg").enableStyle(false).anchorAt(H.CENTER))
		// .add (new HShape("cloud2.svg").enableStyle(false).anchorAt(H.CENTER),2)
		// .add (new HShape("cloud3.svg").enableStyle(false).anchorAt(H.CENTER),2)

		// .colorist(colors)
		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						// .fill( colors2.getColor(), 50)
						.fill(#beeefb)
						// .strokeWeight(0.3)
						// .stroke(#000000)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(4,40))
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
		saveFrame("png/render_####.png");
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
		
		// 	for (HDrawable temp : pool4) {
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
