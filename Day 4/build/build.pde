import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HColorPool colors;

void setup(){
	size(600,600);
	H.init(this).background(#202020);
	smooth();

	colors = new HColorPool( #F7F7F7, #000000, #ececec, #404040, #cccccc,  #14CBCC, #3D9999, #FF406B, #CC1499);

	pool = new HDrawablePool(121);
	pool.autoAddToStage()
		.add(new HShape("svg1.svg"))
		.add(new HShape("svg2.svg"))
		.add(new HShape("svg3.svg"), 2)
		.add(new HShape("svg4.svg"), 2)
		.add(new HShape("svg5.svg"))
		.add(new HShape("svg6.svg"))

		.layout(
			new HGridLayout()
			.startX(50)
			.startY(50)
			.spacing(50,50)
			.cols(11)
		)

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
						// .anchorAt(H.CENTER)
						.rotate( (int)random(4) * 90 )
						.size( ( (int)random(4) * 50 ) ) // 50, 100, 150, 200
					;
					d.randomColors(colors.fillOnly());
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
