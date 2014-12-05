class Particle{
	int finger_which;
	int _arrayPos;
	PVector pt;

//	int lifespan = (int)random(10,300);
	int lifespan = 100;
        int rotation = (int)random(-720,720);

	float minScale = 1;
	float maxScale = 100;
	float scaleNum = 1;

	PVector location;
	PVector velocity;
	PVector acceleration;

        PImage whichArt;

	float vx, vy, dx, dy;
	float spring = 0.1;
	float ease = 0.05;
        

	Particle(int i, int _finger_which, PVector _pt, int arrayPos ) {
		finger_which = _finger_which;
		_arrayPos = arrayPos;
		pt = _pt;

		vx = 0;
		vy = 0;
		dx = 0;
		dy = 0;
                
                whichArt = art[ (int)random(artnum) ];
		location = pt.get();
		velocity = new PVector( random(-3,3), random(-3,3), random(-3,3) );
		acceleration = new PVector(random(-0.9,0.9), random(-0.9,0.9));
	}

        Particle(int arrayPos) {
            _arrayPos = arrayPos;
        
          }

	void run() {
		velocity.add(acceleration);
		location.add(velocity);

		dx = pt.x - (width/2);
		vx += (pt.x - (width/2)) * ease;
		vx *= spring;
		if(abs(dx)>1) location.x += vx;

		dy = pt.y - (height/2);
		vy += (pt.y - (height/2)) * ease;
		vy *= spring;
		if(abs(dy)>1) location.y += vy;

		container.beginDraw();

		maxScale -= scaleNum;
		if (maxScale<=minScale) maxScale = minScale;

		container.stroke(#000000); container.fill(arrayColor[ arrayInt[_arrayPos] ]);

		container.pushMatrix();
			container.translate(location.x, location.y, map(location.z,0,100,200,-2000) );
			// container.rotate( radians( (map(location.z,0,100,-900,900)/2) - (lifespan*2) ) );

			container.rotate( radians( map(lifespan,0,100,0,rotation) + (lifespan*2) ) );

			container.tint( arrayColor[ arrayInt[_arrayPos] ] );

			container.image(whichArt,0,0);
		container.popMatrix();

		container.endDraw();

		if (lifespan>0) lifespan--;
	}

	boolean isDead() {
		return (lifespan==0);
	}
}
