boolean punchAct = false;
Block newBlock;
void setup() {
  size(800, 600,P3D); //thanks for P2D by Teemu
  newBlock = new Block(400, 300, 10, color(123), 10);
  windowBreak = loadImage("pngwing.com.png");//thanks for pngwing
  punchM = loadImage("pngaaa.com-76920.png");//thanks for pngaaa
}

void draw() {
  background(200);
  if (punchAct == true) {//function start
    Punching(newBlock);
    newBlock.y -=10;
  }
  else newBlock.createBlock(); //it will be ignored
}

void mouseClicked(){
if(mouseButton == LEFT){ // 마우스 클릭 인 UI punch 버튼 일때만 작동 할 것
punchAct = true;
}
}
