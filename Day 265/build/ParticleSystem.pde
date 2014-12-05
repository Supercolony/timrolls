import java.util.Iterator;

class ParticleSystem {
	int finger_which;
        int arrayPos;
	PVector pt;

	ArrayList<Particle> particles;
	int numParticles = 2;

	ParticleSystem(PVector _pt, int _arrayPos) {
                arrayPos = _arrayPos;
		pt = _pt;

		particles = new ArrayList<Particle>();

		for (int i = 0; i < numParticles; ++i) {
			Particle p = new Particle(pt, arrayPos);
			particles.add(p);
		}
	}

	void run() {
		Iterator<Particle> it = particles.iterator();

		while( it.hasNext() ) {
			Particle p = it.next();
			p.run();

			if( p.isDead() ) it.remove();
		}
	}

	boolean systemDead() {
		return ( particles.isEmpty() );
	}
}
