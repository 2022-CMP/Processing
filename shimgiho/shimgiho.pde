boolean punchAct = false;
int blockscale =1;
int rotate_p = 0;
void setup() {
  size(800, 600);
  windowBreak = loadImage("pngwing.com.png");//thanks for pngwing
  punchM = loadImage("pngaaa.com-76920.png");//thanks for pngaaa
}
Block newBlock = new Block(400, 300, 10, color(123), 10);
void draw() {
  background(200);
  if (punchAct == true) {
    Punching(newBlock);
    newBlock.y -=10;
  }
  else newBlock.createBlock();
}

void mouseClicked(){
if(mouseButton == LEFT){
punchAct = true;
}
}
