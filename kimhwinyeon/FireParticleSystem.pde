class FireParticleSystem {

    ArrayList<FireParticle> fireParticles;    // An arraylist for all the fireParticles
    PVector origin;                   // An origin point for where fireParticles are birthed
    PImage img;

    int origianlDuringTime = 4;
    int elapsedTime = second();
    int endTime = 0;

    FireParticleSystem(int num, PVector blockLocation) {
        // Initializing
        fireParticles = new ArrayList<FireParticle>();              
        origin = blockLocation.copy();                                   // Store the origin point
        
        // making Particles
        for (int i = 0; i < num; i++) {
        fireParticles.add(new FireParticle(origin));         
        }
    }

    FireParticleSystem(int num, PVector blockLocation, PImage img_) {
        // Initializing
        fireParticles = new ArrayList<FireParticle>();
        origin = blockLocation.copy();                                   
        img = img_;

        for (int i = 0; i < num; i++) {
        fireParticles.add(new FireParticle(origin, img));         // Add "num" amount of fireParticles to the arraylist
        }
    }

    // play all particles
    void run() {
        elapsedTime = second();

        if (elapsedTime < endTime) {
            for (int i = fireParticles.size()-1; i >= 0; i--) {
                FireParticle p = fireParticles.get(i);
                p.run();

                if (p.isDead()) {
                    fireParticles.remove(i);
                }
            }

            for (int i = 0 ; i < 2 ; i++)
                addParticle();
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
        endTime = second() + origianlDuringTime;
    }
}
