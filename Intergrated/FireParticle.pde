class FireParticle {
    // For Move Particle
    PVector location;
    PVector velocity;
    PVector acceleration;

    float lifespan;

    // for scale
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

        float vx = randomGaussian() * width / 1080;
        float vy = (randomGaussian() - 5.0) * width / 1080;
        velocity = new PVector(vx, vy);
        
        location = loc.copy();
        
        lifespan = 150.0;
        
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
        // Image Version
        pushMatrix();
        
        translate(location.x, location.y);
        scale(0.3);
        imageMode(CENTER);
        
        // Make Black and tranparent
        float toBlack = map(lifespan, 0, 150, 0, 255);
        tint(toBlack, lifespan);
        image(img, 0, 0);
        
        popMatrix();
        
        /*// Drawing a circle instead
        fill(255,0,0, lifespan);
        noStroke();
        ellipse(location.x,location.y, FireHeight, FireHeight);*/
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
