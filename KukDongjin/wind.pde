PImage balloon;
void beforeWind(Block block) { // if balloon function start balloon follow mouse
  pushMatrix();
  imageMode(CENTER);
  
  if (!tower.Tower.isEmpty())
    image(balloon, mouseX, mouseY, tower.Tower.peek().size*tower.Tower.peek().blockHeight*2, tower.Tower.peek().size*tower.Tower.peek().blockHeight*2);
  
  popMatrix();
}

void wind(Block block) { // balloon attached and fly away
  Block block_ = block;
  block_.x += 3;
  block_.y -=3;
  block_.createBlock();
  pushMatrix();
  imageMode(CENTER);
  image(balloon, block_.x, block_.y -block.size*block.blockHeight*2, block.size*block.blockHeight*2, block.size*block.blockHeight*2);
  popMatrix();
  if (block_.y<0) {
    balloonAttached = false; // finish the function
    BlockRemove();
  }
}
