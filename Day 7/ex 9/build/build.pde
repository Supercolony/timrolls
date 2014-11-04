import processing.pdf.*;
boolean record = false;

HShape s1, s2, s3;
HColorPool colors;

void setup() {
	size(800,800);
	H.init(this).background(#d0e3f1).autoClear(false);
	smooth();

	colors=new HColorPool()
		.add(#4f4d72, 100) // purple
		.add(#b192be, 100) //light purple
		.add(#d09bb7) //pink
		.add(#d0e3f1) //blue
		.fillOnly()
	;

	s3 = new HShape("tetris1.svg");
	H.add(s3).enableStyle(false)
		.anchor(50,250)
		.loc(width/2,height/2)
		
		.stroke(#b192be,50)
		.noStroke()
		.fill(#ffffff,50)
	;



	s2 = new HShape("tetris3.svg");
	H.add(s2).enableStyle(false)
		.anchor(50,200)
		.loc(width/2,height/2)
		
		.stroke(#d0e3f1)
		// .noStroke()
		.fill(#b192be,100)
	;

	s1 = new HShape("tetris1.svg");
	H.add(s1).enableStyle(false)
		.anchor(50,150)
		.loc(width/2,height/2)
		.stroke(#4f4d72,100)
		// .noStroke()
		.fill(#b192be,100)
	;



	// s1.randomColors(colors);
	// s2.randomColors(colors);
	// s3.randomColors(colors);

	new HRotate(s1, 1);
	new HRotate(s2, 2);
	new HRotate(s3, -3);

	new HOscillator().target(s1).property(H.SCALE).range(0, 1).speed(0.5).freq(5);
	new HOscillator().target(s2).property(H.SCALE).range(-1, 1).speed(0.5).freq(5);
	new HOscillator().target(s3).property(H.SCALE).range(0, 2).speed(0.5).freq(5);
}

void draw() {
	H.drawStage();
	// s1.randomColors(colors);
	// s2.randomColors(colors);
	// s3.randomColors(colors);

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

	// if (key == 'c') {
	// 	for (HDrawable temp : pool) {
	// 		HShape d = (HShape) temp;
	// 		d.randomColors(colors.fillOnly());
	// 	}

	// 	redraw();
	// }
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

