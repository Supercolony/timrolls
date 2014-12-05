class Particle {
	int _arrayPos;
       PVector pt;
      
        PVector location;
        PVector velocity;
        PVector acceleration;
      
        PImage whichArt;
        int rotSpeed;

	Particle(int i, PVector _pt, int arrayPos) {
		_arrayPos = arrayPos;

		pt = _pt;

                location = pt.get();
                velocity = new PVector( random(-5,5), random(-10,10)  );
                acceleration = new PVector(  (int)random(-1.5,1.5), (int)random(-1.5,1.5), 0 );
                
                whichArt = art[ (int)random(artnum) ];
                
                rotSpeed = (int)random(-3,3);
	}

	void display() {
		noStroke();
		color c = arrayColor[ arrayInt[_arrayPos] ]; // choose color based on array position
		fill(c);

		velocity.add(acceleration);
                location.add(velocity);
            
                pushMatrix();
                    translate(location.x, location.y, map(location.z,0,100,300,-900) );
                    rotate( radians( (map(location.z,0,100,0,360) ) / rotSpeed ) );
                    
                    
                    image(whichArt,0,0);
                popMatrix();

               
	}
}
