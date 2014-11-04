import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;
int border=200;

void setup(){
	size(800,800);
	H.init(this).background(#061A29);
	smooth();

	colors = new HColorPool(#dddddd, #FF336B, #0F4065, #26A3A8, #FF336B, #D44A4A);

	for (int i = 0; i<4; i++){
		d = new HShape("Shape 1.svg");
		d
			// .enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(100,700) )
			.loc( (int)random(border,width-border), (int)random(border,height-border) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}

	for (int i = 0; i<5; i++){
		d = new HShape("Shape 2.svg");
		d
			// .enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(200,300) )
			.loc( (int)random(border,width-border), (int)random(border,height-border) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}	
	
	for (int i = 0; i<6; i++){
		d = new HShape("Shape 3.svg");
		d
			// .enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(100,500) )
			.loc( (int)random(border,width-border), (int)random(border,height-border) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}	


	for (int i = 0; i<3; i++){
		d = new HShape("Shape 4.svg");
		d
			// .enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(50,200) )
			.loc( (int)random(border,width-border), (int)random(border,height-border) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}	


	for (int i = 0; i<3; i++){
		d = new HShape("Shape 5.svg");
		d
			// .enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(100,200) )
			.loc( (int)random(border,width-border), (int)random(border,height-border) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}	


	for (int i = 0; i<7; i++){
		d = new HShape("Shape 6.svg");
		d
			// .enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(100,300) )
			.loc( (int)random(border,width-border), (int)random(border,height-border) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}	
}

void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-######.pdf");
	}

	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
