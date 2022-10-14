import java.util.*;

boolean isTextureMode = false;
Tower tower = new Tower();
DemolishUI demolishUI;

Character slave;

void setup() {
  size(displayWidth, displayHeight, P3D);
  
  slave = new Character(2);
  demolishUI = new DemolishUI(width / 2, height / 2);
}

void draw() {
  background(0xff, 0xff, 0xff);
  
  slave.drawBlock(tower);
  tower.drawTower();
  slave.drawChar();
  demolishUI.drawPanel();
}

void keyPressed() {
  if (!tower.Tower.isEmpty()) {
    tower.popBlock();
  }
}

void mousePressed() {
  isTextureMode = !isTextureMode;
}

color randomColor() {
  return color(random(0xff), random(0xff), random(0xff));
}
