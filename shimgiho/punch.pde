float punchTimeChecker = 0;
PImage windowBreak;
PImage punchM;
void Punching(Block block) {
  Block block_ = block;
  punchTimeChecker +=0.1;
  // 1st view, punching motion
  if (punchTimeChecker <1) {
    pushMatrix();
    imageMode(CENTER);
    image(windowBreak, width/2, height/2, width, height);
    image(punchM, width/2, height*3/4, width/3, height/2);
    popMatrix();
  } else if (punchTimeChecker >1) background(200);
  // block is begin small and small => and it is destroyed
  rotate_p+=20;
  if (block_.l >0)
    block_.l -=0.3;
  block_.createBlock();
  if(block_.l <=0) punchAct = false;
}
