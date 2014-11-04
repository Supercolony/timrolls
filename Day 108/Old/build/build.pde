/*
	Press spacebar while running the sketch to randomize the pool and orbit
*/
HDrawablePool pool;
HColorPool colors;
HCanvas canvas;
boolean record;

void setup() {
	size(640, 640, P3D);
	H.init(this).background(#202020).use3D(true);
	smooth();
	frameRate(24);

	canvas = new HCanvas().autoClear(false).fade(2);
	H.add(canvas);

	// colors = new HColorPool(#FFFFFF, #FF8500, #E8450C, #FF0000, #E80CD1, #970DFF, #FF6600);
	colors = new HColorPool(#FFFFFF, #333333);

	pool = new HDrawablePool(22);
	pool.autoParent(canvas)

		// .add(
		// 	new HRect(3, 18)
		// 		// .rounding(10)
		// 		.anchor(30,0)
		// 		// .anchorAt(H.CENTER)
		// 		.noFill()
		// 		.stroke(#E8450C)
		// 		.rotation(45)
		// )

		.add(
			new HEllipse(2)
				.anchor(-10,5)
			.noFill()
				.stroke(#ffffff , 100)
		)

		.layout (
			new HGridLayout()
			.startX(300)
			.startY(0)
			.spacing(20,20)
			.cols(80)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					int i = pool.currentIndex();

					// d.fill(colors.getColor());

					float r = floor(random(10, 20)) * 10;



					HOrbiter orbit = new HOrbiter(height/2,width/2)
						.target(d)
						// .speed(random(1, 2))
						.speed(8)

						.radius(r)
						.rotateTarget(false)
						// .startAngle(random(360))
						.parent(
							new HOrbiter().speed(4).radius(75).rotateTarget(true).parent(
								new HOrbiter(width/2, height/2).speed(1).radius(200)
						)
		)
					;

					new HOscillator()
						.target(d)
						.property(H.WIDTH)
						.range(2, 20)
						.speed(1)
						.freq(2)
						// .waveform(H.SAW)
						// .currentStep( i )
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-600, 70)
						.speed(1)
						.freq(2)
						// .waveform(H.SAW)
						// .currentStep( i )
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