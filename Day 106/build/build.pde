/*
	Press spacebar while running the sketch to randomize the pool and orbit
*/
HDrawablePool pool;
HColorPool colors;
HCanvas canvas;
boolean record;

void setup() {
	size(640, 640);
	H.init(this).background(#202020);
	smooth();
	frameRate(24);

	canvas = new HCanvas().autoClear(false).fade(5);
	H.add(canvas);

	// colors = new HColorPool(#FFFFFF, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600);
	colors = new HColorPool(#FFFFFF, #ECECEC, #333333);

	pool = new HDrawablePool(100);
	pool.autoParent(canvas)

		// .add(
		// 	new HRect(3, 150)
		// 		.rounding(10)
		// 		.anchor(0,-100)
		// 		.noStroke()
		// 		.fill(#ffffff , 100)
		// )

		.add(
			new HEllipse(90)
				.anchor(0,-100)
				.noFill()
				.stroke(#ffffff , 100)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					int i = pool.currentIndex();

					// d.stroke(colors.getColor());

					float r = floor(random(10, 31)) * 10;



					HOrbiter orbit = new HOrbiter(width/2, height/2)
						.target(d)
						.speed(random(1, 2))
						// .speed(.5)

						.radius(r-200)
						.rotateTarget(true)
						.startAngle(random(360))
					;

					new HOscillator()
						.target(d)
						.property(H.HEIGHT)
						.range(20, 150)
						.speed(1)
						.freq(2)
						// .waveform(H.SAW)
						.currentStep( i )
					;


					d.extras( new HBundle().obj("orbit", orbit) );
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	H.drawStage();

	//  if(frameCount % 1 == 0 && frameCount < 360){
	// 	saveFrame("../frames/image-#####.png");
	// }
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

			for (HDrawable temp : pool) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

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