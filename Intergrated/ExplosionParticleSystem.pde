// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ExplosionParticleSystem {
  ArrayList<ExplosionParticle> particles;
  PVector origin;

  PImage img;

  int origianlDuringTime = 2000;
  float elapsedTime = millis();
  float endTime = 0;

  // Check Running
  boolean isRunning = false; 

  ExplosionParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<ExplosionParticle>();

    img = loadImage("explosion.png");
  }

  void addParticle() {
    particles.add(new ExplosionParticle(origin, img));
  }

  void run() {
    elapsedTime = millis();

    if (elapsedTime < endTime) {
      for (int i = 0 ; i < 3 ; i++)
        addParticle();
    } else if (isRunning) {
      isRunning = false;

      // signal
      BlockRemove(); // if some times after, finish the effect
    }

    for (int i = particles.size()-1; i >= 0; i--) {
      ExplosionParticle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void startOfExplosion () {
      if (endTime < millis()) {
        endTime = millis() + origianlDuringTime;

        isRunning = true;
      }
  }

}
