import java.util.*;

boolean isTextureMode = false;
Tower tower = new Tower();
DemolishUI demolishUI;

Character slave;

FireParticleSystem fire;

void setup() {
  size(displayWidth, displayHeight, P3D);
  
  slave = new Character(2);
  demolishUI = new DemolishUI(width / 2, height / 2);

  fire = new FireParticleSystem(0, new PVector(width/2, height/2));
}

void draw() {
  background(0xff, 0xff, 0xff);
  
  slave.drawBlock(tower);
  tower.drawTower();  
  slave.drawChar();
  
  demolishUI.drawPanel();

  fire.run();
}

void keyPressed() {
  if (!tower.Tower.isEmpty()) {
    tower.popBlock();
  }
}

void mousePressed() {
  demolishUI.buttonPanel.get(0).buttonClicked();
}

color randomColor() {
  return color(random(0xff), random(0xff), random(0xff));
}