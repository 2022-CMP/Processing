class ExplosionParticle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  PImage img;
  float Bigsize = 3;

  ExplosionParticle(PVector l, PImage img_) {
    acceleration = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = l.copy();
    lifespan = 255.0;

    img = img_;
  }

  void run() {
    pushMatrix();
    
    translate(position.x, position.y);
    scale(Bigsize / 10);  
    update();
    display();
    Bigsize -= Bigsize/50;

    popMatrix();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
   
    tint(255, lifespan);
    image(img, 0, 0);
    
    /* draw 
    stroke(255, random(0,100), 0, lifespan);
    fill(255, random(0,100), 0, lifespan);
    ellipse(position.x, position.y, 8, 8);
    */
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
