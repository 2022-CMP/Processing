import java.util.*;


boolean isTextureMode = false;
Tower tower = new Tower();
Timer timer = new Timer(2);
Character slave;

void setup() {
  size(displayWidth, displayHeight, P3D);
  
  slave = new Character();
}

void draw() {
  background(0xff, 0xff, 0xff);
  
  timer.createNewBlock(tower);
  tower.drawTower();
  slave.drawChar();
}

void keyPressed() {
  if (!tower.Tower.isEmpty()) {
    tower.popBlock();
  }
}

void mousePressed() {
  isTextureMode = !isTextureMode;
}
