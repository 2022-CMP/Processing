boolean chopstickAct = false;
Block block;
void setup() {
  size(800, 600);
  block = new Block(400,300,5,color(100),10);
  chopstick = loadImage("chopsticks.png");//thanks fo flaticons.
}

void draw() {
  background(200);
  if(chopstickAct == true){
  Chopstick(block);
  }
  else block.createBlock();
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    chopstickAct  = true;
  }
}
