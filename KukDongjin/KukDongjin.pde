import java.util.*;

Tower tower = new Tower();

void setup() {
  size(displayWidth, displayHeight);
  Block block = new Block(width / 2, height / 2, color(0xff, 0xff, 0x00));
  Block block2 = new Block(width / 2, height / 2, color(0x00, 0xff, 0x00));
  Block block3 = new Block(width / 2, height / 2, color(0xff, 0xff, 0x00));
  Block block4 = new Block(width / 2, height / 2, color(0x00, 0xff, 0x00));

  tower.pushBlock(block);
  tower.pushBlock(block2);
  tower.pushBlock(block3);
  tower.pushBlock(block4);
}

void draw() {
  background(0xff, 0xff, 0xff);
  tower.drawTower();
}

void keyPressed() {
  if (!tower.Tower.isEmpty()) {
    tower.popBlock();
  }
}