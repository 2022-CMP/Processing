PImage chopstick;
float t = 0;
void Chopstick(Block block) {
  Block block_ = block;
  t+=0.02;
  float tx;
  float ty;
  if (t<1) {
    tx = lerp(width, block_.x*14/11, t);
    ty = lerp(0, block_.y - block_.l*block.height*5/2, t);
    pushMatrix();
    imageMode(CENTER);
    block_.createBlock();
    image(chopstick, tx, ty, block_.l*block_.height*5, block_.l*block_.height*5);
    popMatrix();
  } else if (block_.y >0) {
    block_.y -=5;
    pushMatrix();
    imageMode(CENTER);
    block_.createBlock();
    image(chopstick,block_.x*14/11,block_.y - block_.l*block.height*5/2,block_.l*block_.height*5, block_.l*block_.height*5);
    popMatrix();
  } else {
    chopstickAct = false;
    t = 0;
  }
}
