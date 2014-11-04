//  requires HYPE.pde &  HHexLayout.pde
//  http://www.hypeframework.org

HDrawablePool pool;
HDrawablePool pool2;
HColorPool colors;
HHexLayout hex;
HRotate rotate;

void setup(){
	size(640,640,P3D);
	H.init(this).background(#ffffff).use3D(true).autoClear(true);
	smooth();

	hex= new HHexLayout()
			.spacing(18)
			.offsetX(0)
			.offsetY(0)
	;

	// rotate = new HRotate(hex,2);

	colors = new HColorPool(#013646, #7ca4ae, #d41920,#fae4a8, #e9de9e);

	pool = new HDrawablePool(600);  
	pool.autoAddToStage()
		.add( new HPath() )

		.layout(hex)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HPath d = (HPath) obj;
					d
						.polygon(6)
						.size(24,24)
						.anchorAt(H.CENTER)
						.noStroke()
						.fill(colors.getColor( i * 120 ))
					;		

					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(-2.0, 2.0)
						.waveform(H.SAW)
						.freq(1)
						.speed(1)
						.currentStep( i * 96 ) 
					;				

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(1100 , -300  )
						.waveform(H.SQUARE)
						.freq(1)
						.speed(1)
						.currentStep( i )
					;			
				}
			}
		)
		.requestAll()
	;

}
 
void draw(){
	H.drawStage();

	// if(frameCount % 1 == 0 && frameCount < 361){
	// 	saveFrame("../frames/image-#####.tiff");
	// }

 }