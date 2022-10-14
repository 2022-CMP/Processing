import java.util.*;


// Stacking Tower of Babel
boolean isTextureMode = false;
Tower tower = new Tower();

Character slave;
Block block;


// Demolishing Powers

NewLightnings lightnings; // 01. Lightnings
FireParticleSystem fire; // 02. Fire
ExplosionParticleSystem explosion; // 03. Explosion

// 4. Punch
boolean punchAct = false;
// 5. Chopsticks
boolean chopstickAct = false;
// 6. Wind
boolean balloonAttached =false;
boolean balloonAct = false;


void setup() {
    size(1000, 1000, P3D);
    
    // Stacking Tower
    slave = new Character(2);


    // Demolising Powers 1
    lightnings = new NewLightnings();
    fire = new FireParticleSystem(0, new PVector(width/2, height/2));
    explosion = new ExplosionParticleSystem(new PVector(mouseX, mouseY));


    // Demolising Powers 2

    // Punch
    windowBreak = loadImage("pngwing.com.png");//thanks for pngwing
    punchM = loadImage("pngaaa.com-76920.png");//thanks for pngaaa

    // Chopsticks
    chopstick = loadImage("chopstick.png");//thanks fo dlf.pt.

    // Wind
    balloon = loadImage("balloon.png"); // image thanks for flaticon
}

void draw () {
    background(0xff, 0xff, 0xff);
    
    // Stacking Tower
    slave.drawBlock(tower);
    tower.drawTower();
    slave.drawChar();
    

    // Demolising Powers 1
    lightnings.Update();
    fire.run();
    explosion.run();


    // Demolising Powers 2

    // Punch
    if (punchAct == true) {//function start
        Punching(block);
        block.y -=10;
    }

    // Chopsticks
    if(chopstickAct == true){
        Chopstick(block);
    }

    // Wind
    if (balloonAttached == true) {//check to activate function
        wind(block);
    } else if(balloonAct == true) {//check  
        beforeWind(block);
    }

}


// Initial version of integration
void mousePressed () {
    
    // Checking highest stack block
    if (!tower.Tower.isEmpty()) {
        block = tower.Tower.pop();

        if (key == '1')
            lightnings.ResetLightnings();
        else if (key == '2') {
            fire.startOfFireParticle(new PVector(block.x, block.y));
            println(block.x);
        } else if (key == '3') {
            explosion = new ExplosionParticleSystem(new PVector(block.x, block.y));
            explosion.stratOfExplosion();
        } else if (key == '4') 
            punchAct = true;
        else if (key == '5')
            chopstickAct = true;
        else if (key == '6') {
            if (balloonAct && (mouseX > block.x - block.size*10&&mouseX < block.x + block.size*10 && mouseY < block.y && mouseY > block.y - block.size * block.blockHeight)) {
                balloonAttached = true;
                balloonAct = false;
            }
        }
    } 
}

void keyPressed() {
    if (key == '6')
        balloonAct =true;
}
