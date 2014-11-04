import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HColorPool colors;
HShape s1;

void setup(){
	size(700,700);
	H.init(this).background(#090716);
	smooth();

	HImage i1 = new HImage("diamond.png");
	H.add(i1).visibility(false);
	HShapeLayout s1 = new HShapeLayout().target(i1); // diamond layout

	HImage i2 = new HImage("flourishlayout.png");
	H.add(i2).visibility(false);
	HShapeLayout s2 = new HShapeLayout().target(i2); // flourish layout

	colors = new HColorPool( #0B0928,#48897B,#090716,#252F3A,#231038,#622D8E,#7648AE,#9863B7,#462B5F,#504D85,#4C7180,#C9E9B3);


	s1 = new HShape("celtic1.svg");
	H.add(s1)
		.scale(0.65f)
		.strokeWeight(3)
		.fill(#111111)
		.anchorAt(H.CENTER)
		.loc(width/2, height/2)
		.randomColors(colors.fillOnly())
	;
	

	// pool = new HDrawablePool(100); // Diamonds
	// pool.autoAddToStage()
	// 	.add(new HShape("diamond.svg"))

	// 	.layout(s1)

	// 	.onCreate(
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.enableStyle(false)
	// 					.strokeJoin(ROUND)
	// 					.strokeCap(ROUND)
	// 					// .strokeWeight(1)
	// 					.stroke(#000000)
	// 					// .noStroke()
	// 					.fill( colors.getColor())
	// 					// .anchorAt(H.CENTER)
	// 					// .rotate( (int)random(4) * 90 )
	// 					.size( ( (int)random(5) * 50 ) ) // 50, 100, 150, 200
	// 				;
	// 				// d.randomColors(colors.fillOnly());
	// 			}
	// 		}
	// 	)
	// 	.requestAll()
	// ;
	
	// pool = new HDrawablePool(200); // Flourishes
	// pool.autoAddToStage()
	// 	.add(new HShape("flourish1.svg"))
	// 	.add(new HShape("flourish2.svg"))
	// 	.add(new HShape("flourish3.svg"))
	// 	.add(new HShape("flourish4.svg"))

	// 	.layout(s2)

	// 	.onCreate(
	// 		new HCallback() {
	// 			public void run(Object obj) {
	// 				HShape d = (HShape) obj;
	// 				d
	// 					.enableStyle(false)
	// 					.strokeJoin(ROUND)
	// 					.strokeCap(ROUND)
	// 					.strokeWeight(0.2)
	// 					.stroke(#000000)
	// 					// .noStroke()
	// 					.fill( colors.getColor() )
	// 					// .anchorAt(H.CENTER)
	// 					.rotate( (int)random(360) )
	// 					.size( (int)random(50,250) ) // 50, 100, 150, 200
	// 				;
	// 				// d.randomColors(colors.fillOnly());
	// 			}
	// 		}
	// 	)
	// 	.requestAll()
	// ;

	pool = new HDrawablePool(150); // Diamonds
	pool.autoAddToStage()
		.add(new HShape("diamond.svg"))

		.layout(s1)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						// .strokeWeight(1)
						.stroke(#000000)
						.noStroke()
						.fill( colors.getColor(), 200)
						// .anchorAt(H.CENTER)
						// .rotate( (int)random(4) * 90 )
						.size( ( (int)random(5) * 50 ) ) // 50, 100, 150, 200
					;
					// d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool = new HDrawablePool(50); // Big Diamonds
	pool.autoAddToStage()
		.add(new HShape("diamond.svg"))

		.layout(s1)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						// .strokeWeight(1)
						.stroke(#000000)
						.noStroke()
						.fill( colors.getColor(), 200)
						// .anchorAt(H.CENTER)
						// .rotate( (int)random(4) * 90 )
						.size(1+ ( (int)random(5) * 100 ) ) // 50, 100, 150, 200
					;
					// d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;


	H.drawStage();
}
 
 void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-######.pdf");
	}

	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
