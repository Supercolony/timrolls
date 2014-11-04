import processing.pdf.*;
boolean record = false;


HColorPool colors;
HDrawablePool pool;
int border=200;

void setup(){
	size(800,800);
	H.init(this).background(#FFFFFF);
	smooth();

	colors = new HColorPool(#582154,#8D3374,#409280,#3B227A,#1A1137,#2B133D,#5D1F71,#652077,#3C1744,#552C6F).fillOnly();
	colors.add(#cccccc, 4);
	colors.add(#999999, 4);
	colors.add(#ffffff, 4);

	pool = new HDrawablePool((int)random(20,60));
	pool.autoAddToStage()
		.add (new HShape("sharp1.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER), 4)
		.add (new HShape("sharp2.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER), 5)
		.add (new HShape("sharp3.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER), 3)
		.add (new HShape("sharp4.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape("sharp5.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape("sharp6.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER), 3)
		.add (new HShape("sharp7.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER), 2)
		.add (new HShape("sharp8.svg").strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER), 5)


		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.stroke(#333333)
						.strokeWeight(2)
						.rotation( (int)random(180) )
						.size( (int)random(50,800) )
						.loc(random(width), random(border, height-border))
					;
					d.randomColors(colors);
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
	noLoop();

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
