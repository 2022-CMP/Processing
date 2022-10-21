class FireParticleSystem {

    ArrayList<FireParticle> fireParticles;    // An arraylist for all the fireParticles
    PVector origin;                   // An origin point for where fireParticles are birthed
    PImage img;

    int origianlDuringTime = 2;
    float elapsedTime = millis();
    float endTime = 0;

    boolean isRunning;

    FireParticleSystem(int num, PVector blockLocation) {
        // Initializing
        fireParticles = new ArrayList<FireParticle>();              
        origin = blockLocation.copy();                                   // Store the origin point
        img = loadImage("flame.png");
        
        // making Particles
        for (int i = 0; i < num; i++) {
        fireParticles.add(new FireParticle(origin));         
        }

        isRunning = false;
    }

    FireParticleSystem(int num, PVector blockLocation, PImage img_) {
        // Initializing
        fireParticles = new ArrayList<FireParticle>();
        origin = blockLocation.copy();                                   
        img = img_;

        for (int i = 0; i < num; i++) {
        fireParticles.add(new FireParticle(origin, img));         // Add "num" amount of fireParticles to the arraylist
        }

        isRunning = false;
    }

    // play all particles
    void run() {
        elapsedTime = millis();

        for (int i = fireParticles.size()-1; i >= 0; i--) {
            FireParticle p = fireParticles.get(i);
            p.run();

            if (p.isDead()) {
                fireParticles.remove(i);
            }
        }

        if (elapsedTime < endTime) {
            for (int i = 0 ; i < 2 ; i++)
                addParticle();
        } else if (isRunning) {
            isRunning = false;

            // signal
            BlockRemove();
        }
    }

    // Method to add a force vector to all fireParticles currently in the system
    void applyForce(PVector dir) {
        for (FireParticle p : fireParticles) {
            p.applyForce(dir);
        }
    }  

        void applyForce() {
        for (FireParticle p : fireParticles) {
            p.applyForce(new PVector(0.1, 0));
        }
    }  

    void addParticle() {
        fireParticles.add(new FireParticle(origin, img));
    }

    void startOfFireParticle () {
        if (endTime < millis()) {
            endTime = millis() + 2000;
            isRunning = true;
        }
    }

    void startOfFireParticle (PVector blockPosition) {
        if (endTime < millis()) 
        {
            origin = blockPosition;
            endTime = millis() + 2000;
            isRunning = true;
        }
    }
}
