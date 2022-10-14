// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ExplosionParticleSystem {
  ArrayList<ExplosionParticle> particles;
  PVector origin;

  PImage img;

  int origianlDuringTime = 2;
  int elapsedTime = second();
  int endTime = 0;

  ExplosionParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<ExplosionParticle>();

    img = loadImage("explosion.png");
  }

  void addParticle() {
    particles.add(new ExplosionParticle(origin, img));
  }

  void run() {
    elapsedTime = second();

    if (elapsedTime < endTime) {
      for (int i = 0 ; i < 3 ; i++)
        addParticle();
    }

    for (int i = particles.size()-1; i >= 0; i--) {
      ExplosionParticle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void stratOfExplosion () {
      endTime = second() + origianlDuringTime;
  }

}