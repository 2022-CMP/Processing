import java.util.*;

NewLightnings lightnings;
FireParticleSystem fire;
ExplosionCollection explosion;

void setup() {
    size(1080, 720);
    lightnings = new NewLightnings();
    fire = new FireParticleSystem(0, new PVector(width/2, height/2));

    // fire = new ParticleSystem(new PVector(width/2, height/2));
}

void draw () {
    background(150);
    
    lightnings.Update();
    fire.run();

    // fire.addParticle();
    // fire.run();
    // explosion.drawExplosion();
}

void mousePressed () {
    lightnings.ResetLightnings();
    fire.startOfFireParticle();
}
