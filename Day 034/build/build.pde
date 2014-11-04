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
	size(1000,1000);
	H.init(this).background(#111111).autoClear(true);
	smooth();

	HEllipse hitObj = new HEllipse(450);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("cloudy.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(1800).visibility(false).rotate(90);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("cloudy4.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("cloudy3.png"); 
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1000).visibility(false).rotate(180);
	hsl4 = new HShapeLayout().target(hitObj4);

 	pcolors= new HPixelColorist("indajungle.jpg")
	.fillOnly()
	// .strokeOnly()
	// .fillAndStroke()
	;

	colors = new HColorPool()

		.add(#4B084A,2) //dark purple
		.add(#631073,3) //purple
		.add(#851893,8) // light purple
 		.add(#FE0E00,4) //orange
		.add(#FE4720,2) //light orange
		.add(#116BC5,4) //blue
		.add(#357BB8,8) //light blue
		.add(#5A959C,4) //lighter blue
		.add(#e7e7e7,12)
		.add(#888888,4)
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

	pool3 = new HDrawablePool(70); //background
	pool3.autoAddToStage()
		.add (new HShape("flower.svg").anchorAt(H.CENTER))
		.add (new HShape("flower7.svg").anchorAt(H.CENTER))
		.add (new HShape("flower8.svg").anchorAt(H.CENTER))
		.add (new HShape("flower9.svg").anchorAt(H.CENTER))
		.add (new HShape("flower10.svg").anchorAt(H.CENTER))
		.add (new HShape("flourish1.svg").anchorAt(H.CENTER))
		.add (new HShape("flourish2.svg").anchorAt(H.CENTER))
		.add (new HShape("flourish3.svg").anchorAt(H.CENTER))		
		.add (new HShape("flourish4.svg").anchorAt(H.CENTER))

		// .colorist(colors2)
		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						// .fill( colors2.getColor(), 50)
						.noFill()
						.strokeWeight(0.3)
						.stroke(#444444)
						// .noStroke()
						// .loc( (int)random(300,900), (int)random(height) )
						.size((int)random(25,200))
						.rotation((int)random(360))
					;
					// pcolors.applyColor(d);
					
				}
			}
		)

	.requestAll()
	;


	pool5 = new HDrawablePool(90); //sperm
	pool5.autoAddToStage()
		
		.add (new HShape("spermy1.svg").anchorAt(H.CENTER))
		.add (new HShape("spermy4.svg").anchorAt(H.CENTER))
		.add (new HShape("spermy5.svg").anchorAt(H.CENTER))
		// .add (new HShape("spermy6.svg").anchorAt(H.CENTER))

		.colorist(colors)
		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						.fill( colors.getColor())
						// .fill(#f4e2cc)
						.strokeWeight(0.3)
						.stroke(#444444)
						// .noStroke()
						// .loc( width/2, (int)random(height) )
						.size((int)random(20,200))
						.rotation((int)random(360))
					;
					// d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;

	pool = new HDrawablePool(110); //flowers
	pool.autoAddToStage()

		.add (new HShape("flower.svg").anchorAt(H.CENTER))
		.add (new HShape("flower2.svg").anchorAt(H.CENTER))
		.add (new HShape("flower3.svg").anchorAt(H.CENTER))
		.add (new HShape("flower4.svg").anchorAt(H.CENTER))
		.add (new HShape("flower6.svg").anchorAt(H.CENTER))

		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						
						.anchorAt(H.CENTER)
						// .fill( colors2.getColor())
						// .fill(#05191e)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(0.3)
						.stroke(#444444)
						// .noStroke()
						// .loc( width/2, (int)random(200,1000) )
						.size((int)random(20,200))
						.rotation((int)random(360))
					;
					 d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;



	pool3 = new HDrawablePool(110); //circles
	pool3.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))
		// .add (new HShape("diamond.svg").enableStyle(false).anchorAt(H.CENTER))
		// .add (new HShape("camo2.svg").enableStyle(false).anchorAt(H.CENTER))
		// .add (new HShape("camo3.svg").enableStyle(false).anchorAt(H.CENTER))

		// .colorist(colors2)
		.layout(hsl4)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						.fill( colors2.getColor())
						// .fill(#031b1f)
						.strokeWeight(0.3)
						.stroke(#444444)
						// .noStroke()
						// .loc( width/2, (int)random(height) )
						.size((int)random(2,20))
						// .rotation(45)
					;
					// pcolors.applyColor(d);
					
				}
			}
		)

	.requestAll()
	;





	// pool2 = new HDrawablePool(30); // top camo
	// pool2.autoAddToStage()

	// 	.add (new HShape("camo.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo2.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo3.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo4.svg").anchorAt(H.CENTER))
	// 	.add (new HShape("camo5.svg").anchorAt(H.CENTER))


	// 	.layout(hsl3)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.anchorAt(H.CENTER)
	// 					// .strokeWeight(0.3)
	// 					// .stroke(#000000)
	// 					.noStroke()
	// 					// .rotation((int)random(360))						
	// 					.size((int)random(100,400))
	// 					// .loc((int)random(width),height/2)
	// 				;
	// 				d.randomColors(colors.fillOnly());
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;



	// pool4 = new HDrawablePool(50); //top Circles
	// pool4.autoAddToStage()

	// 	.add (new HEllipse(300).anchorAt(H.CENTER))
	// 	// .add (new HShape("cloud1.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	// .add (new HShape("cloud2.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	// .add (new HShape("cloud3.svg").enableStyle(false).anchorAt(H.CENTER),2)

	// 	// .colorist(colors)
	// 	.layout(hsl2)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HDrawable d = (HDrawable) obj;
	// 				d
						
	// 					// .fill( colors2.getColor(), 50)
	// 					.fill(#beeefb)
	// 					// .strokeWeight(0.3)
	// 					// .stroke(#000000)
	// 					.noStroke()
	// 					// .loc( (int)random(300,width-300), (int)random(300,height-300) )
	// 					.size((int)random(4,40))
	// 					// .rotation(45)
	// 				;
					
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;


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

			for (HDrawable temp : pool) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

		// 	for (HDrawable temp : pool2) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		
		// 	for (HDrawable temp : pool3) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		
			for (HDrawable temp : pool5) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

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
