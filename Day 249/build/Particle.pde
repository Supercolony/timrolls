class Particle{
	int finger_which;
	PVector pt;

	int lifespan = (int)random(50,300);

	PVector location;
	PVector velocity;
	PVector acceleration;

	PImage whichArt;
	int rotSpeed;

	Particle(int i, int _finger_which, PVector _pt ) {
		finger_which = _finger_which;
		pt = _pt;

		location = pt.get();
		velocity = new PVector( random(-5,5), random(-10,10)  );
		acceleration = new PVector(  (int)random(-1.5,1.5), (int)random(-1.5,1.5), 0 );

		whichArt = art[ (int)random(artnum) ];
		rotSpeed = (int)random(-3,3);
	}

	void run() {
		noStroke(); noFill();

		velocity.add(acceleration);
		location.add(velocity);

		pushMatrix();
			translate(location.x, location.y, map(location.z,0,100,300,-900) );
			rotate( radians( (map(location.z,0,100,0,360) - lifespan) / rotSpeed ) );

			image(whichArt,0,0);
		popMatrix();

		if (lifespan>0) lifespan--;
	}

	boolean isDead() {
		return (lifespan==0);
	}
}


