boolean chopstickAct = false;
Block block;
void setup() {
  size(800, 600);
  block = new Block(400,300,5,color(100),10);
  chopstick = loadImage("chopstick.png");//thanks fo dlf.pt.
}//젓가락 이미지 실사풍으로 바꾸고 _> 이미지 크기 변경에 따라서 위치 조정해 줄 것

void draw() {
  background(200);
  if(chopstickAct == true){
  Chopstick(block);
  }
  else block.createBlock();
}

void mouseClicked() {
  if (mouseButton == LEFT) {//유아이 버튼에 따른 조건으로 변경 될 것(아마도)
    chopstickAct  = true;
  }
}
