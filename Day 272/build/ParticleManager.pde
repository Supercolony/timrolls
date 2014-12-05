class ParticleManager {

	ArrayList<ParticleSystem> systems;

	ParticleManager() {
		systems = new ArrayList<ParticleSystem>();
	}

	void createSystem(ParticleSystem ps) {
		systems.add(ps);
	}

	void run() {
		Iterator<ParticleSystem> it = systems.iterator();

		while( it.hasNext() ) {
			ParticleSystem p = it.next();
			p.run();

			if( p.systemDead() ) it.remove();
		}
	}

}