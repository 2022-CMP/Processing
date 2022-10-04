void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  Block block = new Block(displayWidth / 2, displayHeight / 2, 10f, color(0xff, 0xff, 0x00));

  block.drawColorBlock();
}