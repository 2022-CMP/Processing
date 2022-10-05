import java.util.*;

Tower tower = new Tower();

void setup() {
  size(displayWidth, displayHeight);
  Block block = new Block(width / 2, height / 2, color(0xff, 0xff, 0x00));
  Block block2 = new Block(width / 2, height / 2, color(0x00, 0xff, 0x00));
  tower.pushBlock(block);
  tower.pushBlock(block2);
}

void draw() {
  tower.drawTower();
}