import java.util.*;

boolean isTextureMode = false;
Tower tower = new Tower();
DemolishUI demolishUI;

Character slave;

FireParticleSystem fire;
ExplosionParticleSystem explosion;
NewLightnings lightnings;
boolean punchAct = false;
boolean balloonAttached = false;
boolean balloonAct = false;

void setup() {
  size(displayWidth, displayHeight, P3D);
  
  slave = new Character(2);
  demolishUI = new DemolishUI(width / 2, height / 2);

  // This is for DEMOLISHING variables
  fire = new FireParticleSystem(0, new PVector(width/2, height/2));
  explosion = new ExplosionParticleSystem(new PVector(mouseX, mouseY));
  lightnings = new NewLightnings();
  punchM = loadImage("pngaaa.com-76920.png");//thanks for pngaaa
  windowBreak = loadImage("pngwing.com.png");//thanks for pngwing
  balloon = loadImage("balloon.png");
}

void draw() {
  background(0xff, 0xff, 0xff);
  
  slave.drawBlock(tower);
  tower.drawTower();  
  slave.drawChar();
  
  // Draw UI for DEMOLISHING
  demolishUI.drawPanel();

  // DEMOLISHING CLASS run
  fire.run();
  explosion.run();
  lightnings.Update();

  // if (punchAct) {
  //   Punching(tempBlock);

  //   if (tempBlock != null) {
  //     tempBlock.y -= 10;
  //   }
  // }

  // if (balloonAttached) {
  //   wind(tempBlock);
  // } else if (balloonAct) {
  //   beforeWind(tempBlock);
  // }
}

void keyPressed() {
  if (!tower.Tower.isEmpty()) {
    tower.popBlock();
  }
}

void mousePressed() {
  for (int i = 0; i < demolishUI.buttonPanel.size(); i++) {
    demolishUI.buttonPanel.get(i).buttonClicked();
  }
}

color randomColor() {
  return color(random(0xff), random(0xff), random(0xff));
}

/**
  * FUNCTION for REMOVING TOP of the BLOCK
  * 
  * MODIFY REQUIRED
  * (Has ERROR when the BUTTON CLICKED TWICE
  * before the BLOCK become NULL)
**/
void BlockRemove() {
  tower.popBlock();
}