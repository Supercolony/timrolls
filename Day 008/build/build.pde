import processing.pdf.*;
boolean record = false;

Walker w;
Walker w2;

HFollow mf;
HRect d;
HEllipse e;
HColorField colorField;

void setup() {
	size(800,800);
	H.init(this).background(#000000).autoClear(false);
	smooth();

	w = new Walker();
	w2 = new Walker();

	// colorField = new HColorField(width, height)
	// 	.addPoint(0, height/2, #e21d2f, 0.5f)
	// 	.addPoint(width, height/2, #12c0b4, 0.5f)
	// 	// .fillOnly()
	// 	.strokeOnly()
	// 	// .fillAndStroke()
	// ;

	d = new HRect(100);
	d
		.rounding(40)
		.fill(#000000,100)
		.strokeWeight(2)
		.stroke(#12c0b4, 150)
		.loc(width/2,height/2)
		.anchorAt(H.CENTER)
		.rotation(45)
	;
	H.add(d);


	new HOscillator()
		.target(d)
		.property(H.SIZE)
		.range(10, 100)
		.speed(1)
		.freq(2)
	;

		e = new HEllipse(150);
	e		
		.fill(#ffffff,100)
		.strokeWeight(2)
		.stroke(#e21d2f, 150)
		.loc(width/2,height/2)
		.anchorAt(H.CENTER)
		.rotation(45)
	;
	H.add(e);


	new HOscillator()
		.target(e)
		.property(H.SIZE)
		.range(10, 100)
		.speed(1)
		.freq(3)
	;
}

void draw() {
	d.anchorAt(H.CENTER);
	d.fill(#000000);
	// colorField.applyColor(d);
	// colorField.applyColor(e);

	H.drawStage();

	w.walk();
  	d.loc(w.x(),w.y());

  	w2.walk();
  	e.loc(w2.x(),w2.y());

  	fill(#000000, 10);
  	rect(0, 0, width, height);
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

