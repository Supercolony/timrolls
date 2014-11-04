import processing.pdf.*;
boolean record = false;
HDrawablePool pool;
HPolarLayout layout;
HColorPool colors;

int bg;

void setup(){
	bg = #00ffff;

	size(640,640,P3D);
	H.init(this).background(bg).use3D(true).autoClear(true);
	smooth();
	frameRate(15);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600);

	layout = new HPolarLayout(10, 1, width / 2, height / 2, false, 8);

	pool = new HDrawablePool( 1600 );
	pool.autoAddToStage()
		// .add ( new HPath() )

		// .add(
		// 	new HRect(8)
		// 	.rounding(2)
		// 	.anchor(-100,-30)
		// 	// .noStroke()
		// 	.stroke(#ffffff)
		// 	.noFill()

		// )

		// .add(
		// 	new HEllipse(3)
		// 	.anchor(10,30)
		// 	// .noStroke()
		// 	.stroke(#ffffff)
		// 	// .fill(#76d0d0)
		// 	.noFill()

		// )

		.add(
			new HEllipse(3)
			.anchor(-40,30)
			// .noStroke()
			.stroke(#333333)
			.fill(bg)
			// .noFill()

		)

		.add(
			new HEllipse(3)
			.anchor(-30,10)
			// .noStroke()
			.stroke(#333333)
			.fill(bg)
			// .noFill()

		)

		.add(
			new HEllipse(1)
			.anchor(10,-10)
			// .noStroke()
			.stroke(#333333)
			.fill(bg)
			// .noFill()

		)

		.add(
			new HEllipse(1)
			.anchor(-10,-10)
			// .noStroke()
			.stroke(#333333)
			.fill(bg)
			// .noFill()

		)

		// .layout (
		// 	new HGridLayout()
		// 	.startX(0)
		// 	.startY(0)
		// 	.spacing(0,0)
		// 	.cols(240)
		// )

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();

					// HPath d = (HPath) obj;
					// d
					// 	.polygon( 4 )
					// 	.size(5,50)
					// 	.strokeWeight(1)
					// 	.stroke( colors.getColor(i*100) )
					// 	.fill( #181818 )
					// 	.anchor(25,-100)
					// ;

					HDrawable d = (HDrawable) obj;

					// d.stroke( colors.getColor(i) );

					layout.applyLayout(d);

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(300, 360)
						.speed(1)
						.freq(2)
						// .waveform(H.TRIANGLE)
						.currentStep( i )
					;

					new HOscillator()
						.target(d)
						.property(H.Y)
						.range(300, 620)
						.speed(1)
						.freq(2)
						// .waveform(H.TRIANGLE)
						.currentStep( i )
					;

					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(0.25, 4)
						.speed(1)
						.freq(3)
						.waveform(H.TRIANGLE)
						.currentStep( i )
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATION)
						.range(0, 360)
						.speed(.5)
						.freq(3)
						// .waveform(H.SAW)
						.currentStep( i+100 )
					;


					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-400, 250)
						.speed(1)
						.freq(2)
						// .waveform(H.SAW)
						.currentStep( i+100 )
					;


				}
			}
		)
		.requestAll()
	;
}
 
void draw(){
	H.drawStage();
   	   if(frameCount % 1 == 0 && frameCount < 240){
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
