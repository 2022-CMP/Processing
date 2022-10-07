import java.util.*;

Tower tower = new Tower();
Timer timer = new Timer();

void setup() {
  size(displayWidth, displayHeight);
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
