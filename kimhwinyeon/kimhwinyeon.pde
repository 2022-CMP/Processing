import java.util.*;

NewLightnings lightnings;
ParticleSystem fire;

void setup() {
    size(1080, 720);
    lightnings = new NewLightnings();
    fire = new ParticleSystem(new PVector(width/2, height/2));
}

void draw () {
    background(150);
    
    lightnings.Update();
    fire.addParticle();
    fire.run();
}

void mousePressed () {
    lightnings.ResetLightnings();
}
