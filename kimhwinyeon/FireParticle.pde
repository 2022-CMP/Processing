class FireParticle {
    // For Move Particle
    PVector location;
    PVector velocity;
    PVector acceleration;

    float lifespan;

    // for scale
    float FireWidth = width/10;
    float FireHeight = height/10;

    PImage img;

    FireParticle(PVector loc) {
        acceleration = new PVector(0, 0);

        float vx = randomGaussian()*0.3;
        float vy = randomGaussian()*0.3 - 1.0;
        velocity = new PVector(vx, vy);
        
        location = loc.copy();
        
        lifespan = 100.0;
    }

    FireParticle(PVector loc, PImage img_) {
        acceleration = new PVector(0, 0);

        float vx = randomGaussian()*0.3;
        float vy = randomGaussian()*0.3 - 1.0;
        velocity = new PVector(vx, vy);
        
        location = loc.copy();
        
        lifespan = 100.0;
        
        img = img_;
    }

    void run() {
        
        update();
        
        render();
    }

    // scattering fireworks expression
    void applyForce(PVector f) {
        acceleration.add(f);
    }  

    // Method to update position
    void update() {
        velocity.add(acceleration);
        location.add(velocity);
        lifespan -= 2.5;
        
        acceleration.mult(0); // clear Acceleration
    }

    // Method to display
    void render() {
        /* Image Version
        imageMode(CENTER);
        tint(255, lifespan);
        image(img, location.x, location.y);
        */
        
        // Drawing a circle instead
        fill(255,0,0, lifespan);
        noStroke();
        ellipse(location.x,location.y, FireWidth, FireHeight);
    }

    // Is the particle still useful?
    boolean isDead() {
        if (lifespan <= 0.0) {
            return true;
        } else {
            return false;
        }
    }
}
