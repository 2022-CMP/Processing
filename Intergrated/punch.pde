float punchTimeChecker = 0;
PImage windowBreak;
PImage punchM;

void Punching(Block block) {
  Block block_ = block;

  punchTimeChecker +=0.1;
  if (punchTimeChecker < 1) {
    if (block != null) {
      pushMatrix();
      imageMode(CENTER);
      image(windowBreak, width/2, height/2, width, height);
      image(punchM, block_.x, height*3/4, width/3, height/2);
      popMatrix();
    }
  } 
  
  if (!(block_.size <= 0)) {
    block.size -= block.size/30;
  }
  
  if (block.y <= 0) {
      punchAct = false; //block go to outside of window finish the function
      BlockRemove();

      punchTimeChecker = 0;
  }
}
