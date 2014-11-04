import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HColorPool colors;

void setup(){
	size(1000,1000);
	H.init(this).background(#202020);
	smooth();

	colors = new HColorPool()

		.add(#000000) 
		.add(#F7F7F7)  //v light grey
 		.add(#ececec,12) //grey
		.add(#404040,8) //dark grey
		.add(#cccccc,12) //mid grey
		.add(#14CBCC,8) //teal
		.add(#3D9999,8) //dark teal
		.add(#FF406B,8) //red pink
		.add(#CC1499,4) //pink

	;

	pool = new HDrawablePool(459);
	pool.autoAddToStage()
		.add(new HShape("iso.svg"))
		.add(new HShape("iso2.svg"))
		.add(new HShape("iso3.svg"), 2)
		.add(new HShape("iso4.svg"), 2)
		.add(new HShape("iso5.svg"))


	.layout(
			new HHexLayout()
			.spacing(20)
			.offsetX(0)
			.offsetY(0)
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
						.anchorAt(H.CENTER)
						.rotate( (int)random(2) * 180 )
						.size( ( (int)random(3) * 50 ) ) // 50, 100, 150, 200
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

}


void keyPressed() {
	if (key == 'r') {
		record = true;
		saveVector();
		H.drawStage();
	}

	if (key == 'c') {

			for (HDrawable temp : pool) {
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
