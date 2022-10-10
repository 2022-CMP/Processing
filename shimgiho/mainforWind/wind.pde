PImage balloon;
void beforeWind(Block block) {
  pushMatrix();
  imageMode(CENTER);
  image(balloon, mouseX, mouseY, block.l*block.height*2, block.l*block.height*2);
  popMatrix();
}

void wind(Block block) {//need block_data(width, height)
  Block block_ = block;
  block_.x += 3;
  block_.y -=3;
  block_.createBlock();
  pushMatrix();
  imageMode(CENTER);
  image(balloon, block_.x, block_.y -block.l*block.height*2, block.l*block.height*2, block.l*block.height*2);
  popMatrix();
  if(block_.y<0) balloonAttached = false;
  // and it fly away
}
