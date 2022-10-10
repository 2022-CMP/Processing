Block block;
boolean balloonAttached =false;
boolean balloonAct = false;
void setup() {
  size(800, 600);
  block = new Block(400, 300, 5, color(123), 10);
  balloon = loadImage("balloon.png"); // image thanks for flaticon
}

void draw() {
  background(255);
  block.createBlock();
  if (balloonAttached == true) {//check to activate function
    wind(block);
  } else if(balloonAct == true) {//check  
    beforeWind(block);
  }
  else{
  block.createBlock();
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) { // at function is started( make boolean balloonAct(example) to activate balloon function
    if(balloonAct ==false) balloonAct =true; // 버튼 눌렀을 때 작동할 것으로 불리안 안쓰고 UI에서 할 듯
    if (mouseX > block.x - block.l*10&&mouseX < block.x + block.l*10
      &&mouseY < block.y && mouseY > block.y - block.l * block.height && balloonAct == true) {
      balloonAttached = true;
      balloonAct = false;
    }
  }
}
