import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HColorPool colors;
HShape s1;

HShapeLayout hsl;

void setup(){
	size(700,700);
	H.init(this).background(#ffffff);
	smooth();

	HEllipse hitObj =new HEllipse(150);
	H.add(hitObj)
		.anchorAt(H.CENTER)
		.locAt(H.CENTER)
		.visibility(false)
	;

	HShapeLayout hsl = new HShapeLayout().target(hitObj);

	colors = new HColorPool( #0B0928,#48897B,#090716,#252F3A,#231038,#622D8E,#7648AE,#9863B7,#462B5F,#504D85,#4C7180,#C9E9B3);


	HEllipse circle =  new HEllipse(100);
	
	pool = new HDrawablePool(150); // Flourishes
	pool.autoAddToStage()
		.add(new HShape("celtic2.svg"))
		.add(new HShape(circle), 10)

		.layout(hsl)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						// .enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(0.2)
						.stroke(#000000)
						// .noStroke()
						// .anchorAt(H.CENTER)
						.rotate( 1+(int)random(4)*90 )
						.size( (int)random(30,150) ) // 50, 100, 150, 200
					;
					// d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;


	s1 = new HShape("celtic1.svg"); // centerpiece
	H.add(s1)
		
		.scale(1.5)
		.strokeWeight(.8)
		.fill(#111111)
		.anchorAt(H.CENTER)
		.loc(width/2, height/2)
	;

	// s1.randomColors(colors.fillOnly());


}
 


void draw() {
	
	H.drawStage();

}

// pause, restart, advance 1 / with key presses

// spacebar = pause and restart animation
// +        = redraw() advances 1 iteration in the animation
// r        = render to PDF
// c        = recolor and redraw() advances 1 iteration in the animation


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
		redraw();
	}

	if (key == 'r') {
		record = true;
		saveVector();
	}

	if (key == 'c') {
		// for (HDrawable temp : pool) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		s1.randomColors(colors.fillOnly());
		redraw();
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
