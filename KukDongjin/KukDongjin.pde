import java.util.*;


boolean isTextureMode = false;
Tower tower = new Tower();
Timer timer = new Timer();

void setup() {
  size(displayWidth, displayHeight, P3D);
}

void draw() {
  background(0xff, 0xff, 0xff);
  
  timer.createNewBlock(tower);
  tower.drawTower();
}

void keyPressed() {
  if (!tower.Tower.isEmpty()) {
    tower.popBlock();
  }
}

void mousePressed() {
  isTextureMode = !isTextureMode;
}
