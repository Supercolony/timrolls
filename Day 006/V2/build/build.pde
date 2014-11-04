import processing.pdf.*;
boolean record = false;

HSwarm swarm;
HSwarm swarm2;
HDrawablePool pool;
HDrawablePool pool2;
HDrawablePool pool3;
HDrawablePool pool4;
HTimer timer;
HColorPool colors;
HShape plus;


void setup() {
	size(800,800);
	H.init(this).background(#bac5cb).autoClear(false);
	smooth();

	HImage hitObj = new HImage("cloudy2.png");
	H.add(hitObj).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);

	HShapeLayout hsl = new HShapeLayout().target(hitObj);

	HImage hitObj2 = new HImage("cloudy.png");
	H.add(hitObj2).anchorAt(H.CENTER).locAt(H.CENTER).visibility(false);

	HShapeLayout hsl2 = new HShapeLayout().target(hitObj2);

	plus=new HShape("plus.svg");

	colors = new HColorPool()
		.add(#d24150, 4) //red
		.add(#4c192a, 9) //brown
		.add(#c09f1e,2) // ligt brown	
		.add(#c09f1e) //gold
		.add(#9eb4bf,3) //blue grey
		.fillOnly()
	;

	swarm = new HSwarm()
		.addGoal(H.mouse())
		.speed(6)
		.turnEase(0.05f)
		.twitch(10)
	;


	pool4 = new HDrawablePool(60); // big middle circles
	pool4.autoAddToStage()
		.add (
			new HEllipse()
		)

		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					
					int i = pool4.currentIndex();

					d
						
						.fill(#9eb4bf)
						// .strokeWeight(2)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(30,100))
					;
					// d.randomColors(colors.fillOnly());

					// new HOscillator()
					// 	.target(d)
					// 	.property(H.SCALE)
					// 	.range(1, 1.3)
					// 	.speed((int)random(1,6))
					// 	.freq((int)random(2,4))
					// 	.currentStep(i)
					// 	;
				}
			}
		)

	.requestAll()
	;

	pool = new HDrawablePool(25);  //swarm
	pool.autoAddToStage()
		.add (
			new HEllipse(10)
		)
		
		.colorist(colors)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					
					int i = pool.currentIndex();	

					d
						// .size((int)random(10,20))
						.strokeWeight(2)
						.stroke(#bac5cb)
						.loc( width/2, height/2 )
						.anchorAt( H.CENTER )
					;

						new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(0, 6)
						.speed((int)random(1,6))
						.freq((int)random(2,4))
						.currentStep(i)
						;

					swarm.addTarget(d);
				}
			}
		)
	;



	pool2 = new HDrawablePool(60); //small red circles
	pool2.autoAddToStage()
		.add (
			new HEllipse()
		)

		.add (new HShape("plus.svg").enableStyle(false))
		.colorist(colors)
		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.fill(#d24150)
						.strokeWeight(2)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(4,15))
					;
					// d.randomColors(colors);
				}
			}
		)

	.requestAll()
	;

	pool3 = new HDrawablePool(80); //small light circles
	pool3.autoAddToStage()
		.add (
			new HEllipse()
		)
		.add (new HShape("plus.svg").enableStyle(false))

		.layout(hsl)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						
						.fill(#bac5cb)
						.strokeWeight(2)
						.noStroke()
						// .loc( (int)random(300,width-300), (int)random(300,height-300) )
						.size((int)random(6,20))
					;
					// d.randomColors(colors);
				}
			}
		)

	.requestAll()
	;





	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(400)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
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
		for (HDrawable temp : pool) {
			HShape d = (HShape) temp;
			d.randomColors(colors.fillOnly());
		}

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
