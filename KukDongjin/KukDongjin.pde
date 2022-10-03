void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  Block block = new Block(displayWidth / 2, displayHeight / 2, 5f, color(0xff, 0xff, 0x00), 10f);

  block.drawColorBlock();
}