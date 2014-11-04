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

HShape s1;
HShape s2;

HPixelColorist pcolors;

void setup(){
	size(1000,1000);
	H.init(this).background(#e9e9e9);
	smooth();

	HImage hitObj2 = new HImage("redface2.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	HImage hitObj3 = new HImage("redneck.png");
	H.add(hitObj3).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	hsl3 = new HShapeLayout().target(hitObj3);

	HImage hitObj4 = new HImage("redface2-outline.png"); 
	H.add(hitObj4).anchorAt(H.CENTER).locAt(H.CENTER).size(1100).visibility(false);
	hsl4 = new HShapeLayout().target(hitObj4);

	colors = new HColorPool()

		.add(#cccccc,10) //30%
		.add(#999999,10) //50%
		.add(#666666,10) //70%
		.add(#e7e7e7,6) 
		.add(#ffffff,2)
		.add(#aa100e) //red
		// .add(#610a02) // dark red
		.add(#3ddfc8) //teal  


		.fillOnly()
	;

	colors2 = new HColorPool()
		.add(#ffd964,8) //yellow
		// .add(#3e564f,3)
		.add(#0f1525,4) 
		.add(#222232,3)
		.add(#3ddfc8,2) //teal
		.add(#aa100e,2) //red
		.add(#610a02) // dark red  
		.add(#599ba4,2) //purplish
		.add(#63451a) //brown
		.add(#e7e7e7) //grey

		.fillOnly()
	;


	drawThings();

}

 
void draw() {

}

void drawThings() {

	s2 = new HShape("redhair-bottom.svg");
	H.add(s2)
		.scale(1.1f)
		// .strokeWeight(3)
		// .fill(#111111)
		.anchorAt(H.CENTER)
		.loc(500,500)
	;



	
	pool3 = new HDrawablePool(80); // neck
	pool3.autoAddToStage()

		.add (new HShape("process1.svg").anchorAt(H.CENTER))
		.add (new HShape("process2.svg").anchorAt(H.CENTER))
		.add (new HShape("process3.svg").anchorAt(H.CENTER))
		.add (new HShape("process4.svg").anchorAt(H.CENTER))
		.add (new HShape("process5.svg").anchorAt(H.CENTER))
		.add (new HShape("process6.svg").anchorAt(H.CENTER))

		.layout(hsl3)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.anchorAt(H.CENTER)
						// .strokeWeight(0.7)
						// .stroke(#000000)
						.noStroke()
						// .rotation((int)random(4) * 45 )				
						.size( ( (int)random(4) * 20 ) )
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;


	pool2 = new HDrawablePool(300); // face
	pool2.autoAddToStage()

		.add (new HShape("process1.svg").anchorAt(H.CENTER))
		.add (new HShape("process2.svg").anchorAt(H.CENTER))
		.add (new HShape("process3.svg").anchorAt(H.CENTER))
		.add (new HShape("process4.svg").anchorAt(H.CENTER))
		.add (new HShape("process5.svg").anchorAt(H.CENTER))
		.add (new HShape("process6.svg").anchorAt(H.CENTER))

		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.anchorAt(H.CENTER)
						// .strokeWeight(0.7)
						// .stroke(#000000)
						.noStroke()
						// .rotation((int)random(4) * 45 )				
						.size( ( (int)random(4) * 20 ) )
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;

	pool4 = new HDrawablePool(150); // outline
	pool4.autoAddToStage()

		.add (new HShape("process1.svg").anchorAt(H.CENTER))
		.add (new HShape("process2.svg").anchorAt(H.CENTER))
		.add (new HShape("process3.svg").anchorAt(H.CENTER))
		.add (new HShape("process4.svg").anchorAt(H.CENTER))
		.add (new HShape("process5.svg").anchorAt(H.CENTER))
		.add (new HShape("process6.svg").anchorAt(H.CENTER))

		.layout(hsl4)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.anchorAt(H.CENTER)
						// .strokeWeight(0.7)
						// .stroke(#000000)
						.noStroke()
						// .rotation((int)random(4) * 45 )				
						.size( ( (int)random(4) * 10 ) )
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors.fillOnly());
					
				}
			}
		)

	.requestAll()
	;



	pool = new HDrawablePool(40); //eyes
	pool.autoAddToStage()
		.add(new HShape("cloudbank1.svg"))
		.add(new HShape("cloudbank2.svg"))
		.add(new HShape("cloudbank3.svg"))
		.add(new HShape("cloudbank4.svg"),15)
		.add(new HShape("cloudbank5.svg"),18)
		// .add (new HShape("techno1.svg").anchorAt(H.CENTER))
		// .add (new HShape("techno2.svg").anchorAt(H.CENTER))
		// .add (new HShape("techno3.svg").anchorAt(H.CENTER))
		// .add (new HShape("techno4.svg").anchorAt(H.CENTER))
		// .add (new HShape("techno5.svg").anchorAt(H.CENTER))
		.add(new HShape("triangles.svg"))
		.add(new HShape("triangles2.svg"))
		.add(new HShape("triangles3.svg"))
		.add(new HShape("triangles4.svg"))


	.layout(
			new HHexLayout()
			.spacing(30)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(1)
						// .stroke(#000000)
						.noStroke()
						.anchorAt(H.CENTER)
						.rotate( (int)random(2) * 180 )
						.size( ( (int)random(3) * 40 ) ) // 50, 100, 150, 200
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	s1 = new HShape("redhair-top.svg"); //top hair
	H.add(s1)
		 .scale(1.1f)
		// .strokeWeight(3)
		// .fill(#111111)
		.anchorAt(H.CENTER)
		.loc(500,500)
	;



	H.drawStage();

	}


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
			d.randomColors(colors2.fillOnly());
		}

			for (HDrawable temp : pool2) {
			HShape d = (HShape) temp;
			d.randomColors(colors2.fillOnly());
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
