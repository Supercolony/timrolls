class Particle{
	int finger_which;
	PVector pt;

	int lifespan = (int)random(250,1000);
        int rotation = (int)random(-45,45);

	int minScale = 10;
	int maxScale = 500;
	int scaleNum = 1;

        int _arrayPos;

	PVector location;
	PVector velocity;
	PVector acceleration;
       
 
        PImage whichArt;

	float vx, vy, dx, dy;
	float spring = 0.01;
	float ease =0.01;

        float shrink = 2;
        

	Particle( PVector _pt, int arrayPos ) {
//		finger_which = _finger_which;
		_arrayPos = arrayPos;
		pt = _pt;

		vx = 0;
		vy = 0;
		dx = 0;
		dy = 0;
                
                whichArt = art[ (int)random(artnum) ];
                          
		location = pt.get();
		velocity = new PVector( random(-0.002,0.002), random(-0.002,0.002), random(0.01) );
		acceleration = new PVector(random(-0.001,0.001), random(-0.001,0.001), random(0.01));
              
                
	}

	void run() {
                if(lifespan<200){
                  if ( lifespan!=0 ) shrink();
               }
          
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

                //iterate over colors, based on particles start point
                _arrayPos++;
                 if(_arrayPos >= arrayMax){
                    _arrayPos=0;
                  }
                
                textureMode(NORMAL);

		pushMatrix();
                        translate(location.x, location.y, map(location.z,0,100,50,-50) );
//			rotate( radians( (map(location.z,0,100,-900,900)/2)  ) );
			rotate( radians( map(lifespan,-900,900,0,rotation) + ((int)random(lifespan)) ) );
                     
                        color c = arrayColor[ arrayInt[_arrayPos] ];
                        tint( c );
                        noStroke();
                        noFill();
                        
                        beginShape();
			texture(whichArt);
                        vertex(0,0,0,0,0);
                        vertex(maxScale,0,0,1,0);
                        vertex(maxScale,maxScale,0,1,1);
                        vertex(0,maxScale,00,1);
//                        image(whichArt,0,0);
                        endShape();
		 popMatrix();  
//
		

		if (lifespan>0) lifespan--;
              
//                println("lifespan "+lifespan+"   whichArt size "+whichArt.width);
	}

	boolean isDead() {
		return (lifespan==0);
	
     }

     void shrink(){
          maxScale -= scaleNum;
          if (maxScale<=minScale){
            maxScale=minScale;
          }

     }

}
