HDrawablePool pool;
int boxSixe = 75;
HCanvas canvas;
boolean record;

void setup() {
	size(640,640,P3D);
	H.init(this).background(#ffffff).use3D(true);
	smooth();

	// canvas = new HCanvas().autoClear(true).fade(1);
	// H.add(canvas);

	pool = new HDrawablePool(500);
	// pool.autoParent(canvas);
	pool.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(75)
			.startY(75)
			.spacing(40,40)
			.cols(50)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(boxSixe)
						.width(5)
						.height(5)
						.stroke(#333333)
						.fill(#ffffff)
						.z(0)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-180, 180)
						.speed(0.6)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-180, 180)
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.9)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-200, 600)
						.speed(.1)
						.freq(2)
						.waveform(H.TRIANGLE)
						.currentStep(i*2)
					;

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.SIZE)
					// 	.range(5, 100)
					// 	.speed(1)
					// 	.freq(1)
					// 	.currentStep(i)
					// ;

					new HOscillator()
						.target(d)
						.property(H.Y)
						.range(200, 440)
						.speed(1)
						.freq(1)
						.currentStep(i-400)
					;

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(440, 200)
						.speed(1)
						.freq(1)
						.currentStep(i+100)
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	// pointLight(255, 255, 255,  0, height/2, -300);        // orange
	// pointLight(0, 149, 168,  width, height/2, -300);   // teal
	// pointLight(255, 204, 0,  width/2, height/2, -400); // yellow

	H.drawStage();

	if(frameCount % 1 == 0 && frameCount < 360){
		saveFrame("../frames/image-#####.png");
	}
}

// +        = redraw() advances 1 iteration 
// r        = render to PDF
// c        = recolor 


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

	// if (key == '+') {
	// 	drawThings();
	// }

	if (key == 'r') {
		record = true;
		saveFrame("png/render_####.png");
		saveVector();
		H.drawStage();
	}

	if (key == 'c') {

		// 	for (HDrawable temp : pool) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }

		// 	for (HDrawable temp : pool2) {
		// 	HShape d = (HShape) temp;
		// 	d.randomColors(colors.fillOnly());
		// }
		
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

