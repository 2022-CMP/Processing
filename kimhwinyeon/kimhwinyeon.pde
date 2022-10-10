import java.util.*;

NewLightnings lightnings;
FireParticleSystem fire;
ExplosionParticleSystem explosion;

void setup() {
    size(1080, 720, P3D);

    lightnings = new NewLightnings();
    
    fire = new FireParticleSystem(0, new PVector(width/2, height/2));

    explosion = new ExplosionParticleSystem(new PVector(mouseX, mouseY));

    // fire = new ParticleSystem(new PVector(width/2, height/2));
}

void draw () {
    background(150);
    
    lightnings.Update();
    fire.run();
    explosion.run();

    // fire.addParticle();
    // fire.run();
    // explosion.drawExplosion();
}

void mousePressed () {
    lightnings.ResetLightnings();
    fire.startOfFireParticle();

    explosion = new ExplosionParticleSystem(new PVector(mouseX, mouseY));
    explosion.stratOfExplosion();
}
