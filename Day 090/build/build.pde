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

void setup(){
	size(1000,1000);
	H.init(this).background(#9f5b19);
	smooth();

	HImage hitObj2 = new HImage("cloudy4.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).size(1000).visibility(false);
	hsl2 = new HShapeLayout().target(hitObj2);

	colors = new HColorPool()

		.add(#026396,3) //blue
		.add(#cb0607,5) //red
		.add(#e882c4,2) //pink
		.add(#b03201) //rust
		.add(#76d0d0,2) //teal
		.add(#1f2942,2) //purplish
		.add(#4b575c,3) // grey
		.add(#c9d3d4,8)

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

	pool2 = new HDrawablePool(60); // BG
	pool2.autoAddToStage()

		.add (new HShape("techno1.svg").anchorAt(H.CENTER),8)
		.add (new HShape("techno2.svg").anchorAt(H.CENTER),10)
		.add (new HShape("techno3.svg").anchorAt(H.CENTER),6)
		.add (new HShape("techno4.svg").anchorAt(H.CENTER),8)
		.add (new HShape("techno5.svg").anchorAt(H.CENTER),5)
		.add (new HShape("tech1.svg").anchorAt(H.CENTER))
		.add (new HShape("tech2.svg").anchorAt(H.CENTER))



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
						.rotation((int)random(4) * 45 )				
						.size((int)random(300,600))
						// .loc((int)random(width),height/2)
					;
					d.randomColors(colors2.fillOnly());
					
				}
			}
		)

	.requestAll()
	;


	pool = new HDrawablePool(140);
	pool.autoAddToStage()
		.add(new HShape("cloudbank1.svg"))
		.add(new HShape("cloudbank2.svg"))
		.add(new HShape("cloudbank3.svg"))
		.add(new HShape("cloudbank4.svg"),15)
		.add(new HShape("cloudbank5.svg"),18)
		.add (new HShape("techno1.svg").anchorAt(H.CENTER))
		.add (new HShape("techno2.svg").anchorAt(H.CENTER))
		.add (new HShape("techno3.svg").anchorAt(H.CENTER))
		.add (new HShape("techno4.svg").anchorAt(H.CENTER))
		.add (new HShape("techno5.svg").anchorAt(H.CENTER))
		// .add(new HShape("triangles.svg"))
		// .add(new HShape("triangles2.svg"))
		// .add(new HShape("triangles3.svg"))
		// .add(new HShape("triangles4.svg"))


	.layout(
			new HHexLayout()
			.spacing(25)
			.offsetX(0)
			.offsetY(100)
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
						.size( ( (int)random(6) * 50 ) ) // 50, 100, 150, 200
					;
					d.randomColors(colors2.fillOnly());
				}
			}
		)
		.requestAll()
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
