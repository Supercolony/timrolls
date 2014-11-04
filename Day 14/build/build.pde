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

	HEllipse hitObj = new HEllipse(300);
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl=new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("heart.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(800).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("heart.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("heart-outline.png");
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

	colors = new HColorPool()
		.add(#d706cb, 2) //pink
		.add(#ff0b3f, 5) //orange
		.add(#c3ef64,2) // green
		.add(#23bbca,8) //blue
		.add(#e0e0e0,3) //grey
		.add(#ffffff,9)
		// .fillOnly()
	;

	colors2 = new HColorPool()
		// .add(#f1cd81) //yellow
		// .add(#fbee01,4) //yellow
		// .add(#ffa902,4) //orange
		.add(#909090) //grey
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

	pool3 = new HDrawablePool(80); //Circles
	pool3.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))

		.colorist(colors)
		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						.fill(#ffffff)
						.strokeWeight(0.3)
						.stroke(#333333)
						// .noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(10,80))
						// .rotation(45)
					;
					
				}
			}
		)

	.requestAll()
	;


	pool5 = new HDrawablePool(7); // back arabesques
	pool5.autoAddToStage()
		
		.add (new HShape("arabesque.svg").anchorAt(H.CENTER))
		.add (new HShape("arabesque3.svg").anchorAt(H.CENTER))
		.add (new HShape("arabesque4.svg").anchorAt(H.CENTER))

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					
					d
						.strokeWeight(0.1)
						.stroke(#333333)
						// .noStroke()
						.fill(#ffffff)
						.size((int)random(100,700))
						.rotation((int)random(2)*180)
						.loc(width/2,(int)random(200,700))
					;
					d.randomColors(colors2.fillOnly());

				}
			}
		)

	.requestAll()
	;



	pool = new HDrawablePool(60); //Circles
	pool.autoAddToStage()

		.add (new HEllipse(300).anchorAt(H.CENTER))

		.colorist(colors)
		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						// .fill(#ffffff)
						.strokeWeight(0.3)
						.stroke(#333333)
						// .noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(10,30))
						// .rotation(45)
					;
					
				}
			}
		)

	.requestAll()
	;


	pool2 = new HDrawablePool(13); // arabesques
	pool2.autoAddToStage()

		// .add (new HShape("arabesque2.svg"),4)
		.add (new HShape("arabesque.svg"))
		.add (new HShape("arabesque3.svg").anchorAt(H.CENTER))
		.add (new HShape("arabesque4.svg").anchorAt(H.CENTER))

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false).anchorAt(H.CENTER)
						.strokeWeight(0.3)
						.stroke(#333333)
						// .noStroke()
						.rotation((int)random(2)*180)						
						.size((int)random(50,400))
						.loc(width/2,(int)random(200,1000))
					;
					d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;




	// pool4 = new HDrawablePool(10); // hearts
	// pool4.autoAddToStage()

	// 	.add (new HShape("arabesque2.svg"))

	// 	.layout(hsl)
		
	// 	.onCreate (
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.enableStyle(false).anchorAt(H.CENTER)
	// 					.strokeWeight(0.5)
	// 					.stroke(#333333)
	// 					// .noStroke()
	// 					.size((int)random(10,150))
	// 					// .rotation(random(360))
	// 				;
					
	// 				d.randomColors(colors.fillOnly());

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
		saveVector();
		H.drawStage();
	}

	if (key == 'c') {
		for (HDrawable temp : pool2) {
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
