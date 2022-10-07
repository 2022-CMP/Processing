Block block;
boolean balloonAttached =false;
void setup() {
  size(800, 600);
  block = new Block(400, 300, 5, color(123), 10);
  balloon = loadImage("balloon.png"); // image thanks for flaticon
}

void draw() {
  background(255);
  block.createBlock();
  if (balloonAttached == true) {
    wind(block);
    //if it worked then blockstack can be --;
  } else {
    beforeWind(block);
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    if (mouseX > block.x - block.l*10&&mouseX < block.x + block.l*10
      &&mouseY < block.y && mouseY > block.y - block.l * block.height) {
      balloonAttached = true;
    }
  }
}
