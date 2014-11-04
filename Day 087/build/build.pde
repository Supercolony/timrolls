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
	H.init(this).background(#000000).autoClear(true);
	smooth();

	HEllipse hitObj = new HEllipse(450);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);

	// HEllipse hitObj2 = new HEllipse(200);
	// H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	// hsl2=new HShapeLayout().target(hitObj2);

	HImage hitObj2 = new HImage("hemisphere1.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(800).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("hemisphere2.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(800).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("hemisphere3.png"); 
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(700).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

 // 	pcolors= new HPixelColorist("facecolors.jpg")
	// .fillOnly()
	// .strokeOnly()
	// .fillAndStroke()

	// ;

	colors = new HColorPool()

		.add(#026396,3) //blue
		.add(#fe057d,5) //fuscia
		.add(#e882c4,2) //pink
		.add(#68005f) //rust
		.add(#76d0d0,2) //teal
		.add(#1f2942,2) //purplish
		.add(#4b575c,3) // grey
		.add(#c9d3d4,8) 
		.fillOnly()
	;

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

	pool2 = new HDrawablePool(20); // Big Shapes
	pool2.autoAddToStage()

		.add (new HShape("sharp1.svg").anchorAt(H.CENTER),8)
		.add (new HShape("sharp2.svg").anchorAt(H.CENTER),10)
		.add (new HShape("sharp3.svg").anchorAt(H.CENTER),6)
		.add (new HShape("sharp4.svg").anchorAt(H.CENTER),8)
		.add (new HShape("sharp5.svg").anchorAt(H.CENTER),5)


		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.anchorAt(H.CENTER)
						.strokeWeight(0.7)
						.stroke(#000000)
						// .noStroke()
						.rotation((int)random(360))				
						.size((int)random(400,500))
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors2.fillOnly());
					
				}
			}
		)

	.requestAll()
	;


	pool3 = new HDrawablePool(30); //background
	pool3.autoAddToStage()
		.add (new HShape("doodle1.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle2.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle3.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle4.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle5.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle6.svg").anchorAt(H.CENTER))


		.colorist(colors2)
		.layout(hsl4)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						// .fill( colors2.getColor(), 50)
						// .noFill()
						.strokeWeight(0.7)
						.stroke(#000000)
						// .noStroke()
						// .loc( (int)random(300,900), (int)random(height) )
						.size((int)random(160,600))
						.rotation((int)random(360))
					;
					// pcolors.applyColor(d);
					
				}
			}
		)

	.requestAll()
	;


	pool = new HDrawablePool(60); //top shapes
	pool.autoAddToStage()

		.add (new HShape("sharp1.svg").anchorAt(H.CENTER),10)
		.add (new HShape("sharp2.svg").anchorAt(H.CENTER),10)
		.add (new HShape("sharp3.svg").anchorAt(H.CENTER),6)
		.add (new HShape("sharp4.svg").anchorAt(H.CENTER),10)
		.add (new HShape("sharp5.svg").anchorAt(H.CENTER),5)


		.layout(hsl4)

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
						.strokeWeight(0.5)
						.stroke(#000000)
						// .noStroke()
						// .loc((int)random(width), (int)random(height) )
						.size((int)random(300,400))
						// .rotation((int)random(4)*45)
					;
					 d.randomColors(colors2.fillOnly());
					
				}
			}
		)

	.requestAll()
	;


	pool5 = new HDrawablePool(90); //sperm
	pool5.autoAddToStage()
		
		.add (new HShape("doodle8.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle9.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle10.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle11.svg").anchorAt(H.CENTER))
		.add (new HShape("doodle12.svg").anchorAt(H.CENTER))

		.add (new HShape("sharp1.svg").anchorAt(H.CENTER))
		.add (new HShape("sharp2.svg").anchorAt(H.CENTER))
		.add (new HShape("sharp3.svg").anchorAt(H.CENTER))
		.add (new HShape("sharp4.svg").anchorAt(H.CENTER))
		.add (new HShape("sharp5.svg").anchorAt(H.CENTER))


		// .colorist(colors)
		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						// .fill( colors.getColor())
						// .fill(#f4e2cc)
						.strokeWeight(0.7)
						.stroke(#000000)
						// .noStroke()
						// .loc( width/2, (int)random(height) )
						.size((int)random(100,300))
						.rotation((int)random(360))
					;
					d.randomColors(colors2.fillOnly());
					
				}
			}
		)

	.requestAll()
	;





	// pool3 = new HDrawablePool(100); //BG
	// pool3.autoAddToStage()

	// 	.add (new HRect(300).anchorAt(H.CENTER).rotate(45))
	// 	// .add (new HShape("cloud1.svg").enableStyle(false).anchorAt(H.CENTER))
	// 	// .add (new HShape("cloud2.svg").enableStyle(false).anchorAt(H.CENTER),2)
	// 	// .add (new HShape("cloud3.svg").enableStyle(false).anchorAt(H.CENTER),2)

	// 	// .colorist(colors)
	// 	.layout(hsl3)

	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HDrawable d = (HDrawable) obj;
	// 				d
						
	// 					.fill( colors2.getColor())
	// 					// .fill(#beeefb)
	// 					// .strokeWeight(0.3)
	// 					// .stroke(#000000)
	// 					.noStroke()
	// 					.loc( (int)random(100,width-100), (int)random(100,height-100) )
	// 					.size((int)random(50,400))
	// 					// .rotation(45)
	// 				;
					
	// 				// pcolors.applyColor(d);
					
	// 			}
	// 		}
	// 	)

	// .requestAll()
	// ;


// 	pool4 = new HDrawablePool(10000); //top Circles
// 	pool4.autoAddToStage()

// 		.add (new HRect(300).anchorAt(H.CENTER).rotate(45))
// 		// .add (new HShape("cloud1.svg").enableStyle(false).anchorAt(H.CENTER))
// 		// .add (new HShape("cloud2.svg").enableStyle(false).anchorAt(H.CENTER),2)
// 		// .add (new HShape("cloud3.svg").enableStyle(false).anchorAt(H.CENTER),2)

// 		// .colorist(colors)
// 		.layout(hsl3)

// 		.onCreate (
// 			new HCallback() {
// 				public void run(Object obj) {
// 					HDrawable d = (HDrawable) obj;
// 					d
						
// 						.fill( colors.getColor())
// 						// .fill(#beeefb)
// 						// .strokeWeight(0.3)
// 						// .stroke(#000000)
// 						.noStroke()
// 						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
// 						.size((int)random(3,9))
// 						// .rotation(45)
// 					;
					
// 					// pcolors.applyColor(d);
					
// 				}
// 			}
// 		)

// 	.requestAll()
// 	;


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
