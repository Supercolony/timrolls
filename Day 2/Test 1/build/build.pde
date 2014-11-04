HDrawablePool pool;

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	final HColorPool colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	PShape svg1 = loadShape("Shape 1.svg");
	PShape svg2 = loadShape("Shape 2.svg");
	PShape svg3 = loadShape("Shape 3.svg");
	PShape svg4 = loadShape("Shape 4.svg");
	PShape svg5 = loadShape("Shape 5.svg");
	PShape svg6 = loadShape("Shape 6.svg");

	pool = new HDrawablePool(121);
	pool.autoAddToStage()
		.add (new HShape(svg1).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape(svg2).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape(svg3).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape(svg4).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape(svg5).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.add (new HShape(svg6).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
		.layout (
			new HGridLayout()
			.startX(70)
			.startY(70)
			.spacing(50,50)
			.cols(11)
		)
		.setOnCreate (
		    new HCallback() {
		    	public void run(Object obj) {
		    		HShape d = (HShape) obj;
					d
						.stroke(#000000)
						.strokeWeight(2)
						.rotation( ((int)random(4)) * 90 )
					;
					d.randomColors(colors).fillOnly();
				}
			}
		)
		.requestAll();

	H.drawStage();
	noLoop();
}

void draw() {}