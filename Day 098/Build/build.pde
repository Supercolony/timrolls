HColorPool colors;
HCanvas canvas;

void setup() {
	size(640,640);
	H.init(this).background(#000000);
	smooth();

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	canvas = new HCanvas().autoClear(false).fade(1);
	H.add(canvas);

	final HRandomTrigger tweenTrigger = new HRandomTrigger( 1f/6 );

	tweenTrigger.callback(
		new HCallback(){
			public void run(Object obj) {
				final HDrawable r = canvas.add(new HRect())
					// .triangle(H.EQUILATERAL , H.TOP)
					// .size(300)
					.width(random(100,300))
					.height(random(100,300))
					.strokeWeight(4)
					.stroke( colors.getColor() )
					.fill( #000000, 25 )
					.loc( (int)random(width), (int)random(height) )
					.anchorAt( H.CENTER )
					
				;

				final HTween tween1 = new HTween()
					.target(r).property(H.SCALE)
					.start(1).end(0).ease(0.03)
				;

				final HTween tween2 = new HTween()
					.target(r).property(H.LOCATION)
					.start( (int)random(width), 0 ).end( (int)random(width) , (int)random(height) ).ease(0.01).spring(0.7)
				;

				final HTween tween3 = new HTween()
					.target(r).property(H.ALPHA)
					.start(10).end(255).ease(0.1).spring(0)
				;

				r.scale(random(0,2)).rotation((int)random(2)*180).alpha(0);

				final HTimer timer = new HTimer().interval(400).unregister();

				// tween has appeared / start timer

				final HCallback onAppear = new HCallback() {
					public void run(Object obj) {
						timer.register();
					}
				};

				// on screen pause is finished lets remove

				final HCallback onDisappear = new HCallback() {
					public void run(Object obj) {
						canvas.remove(r);
					}
				};

				// timer starts / holds art on screen for 250 miliseconds / then calls onDisappear

				final HCallback onPause = new HCallback() {
					public void run(Object obj) {
						timer.unregister();
						tween1.start(1).end(1.5).ease(0.04).spring(0.99).register();
						tween2.start(width/2, height/2).end((int)random(height), height).ease(0.01).spring(0.7).register();
						tween3.start(255).end(10).ease(0.01).spring(0.95).register().callback(onDisappear);
					}
				};

				tween3.callback(onAppear);
				timer.callback(onPause);
			}
		}
	);
}

void draw() {
	H.drawStage();
}

