PImage balloon;
void beforeWind(Block block) { // if balloon function start balloon follow mouse
  pushMatrix();
  imageMode(CENTER);
  
  if (!tower.Tower.isEmpty())
    image(balloon, mouseX, mouseY, tower.Tower.peek().size*tower.Tower.peek().blockHeight, tower.Tower.peek().size*tower.Tower.peek().blockHeight);
  
  popMatrix();
}

void wind(Block block) { // balloon attached and fly away
  Block block_ = block;
  block_.x += 3;
  block_.y -=3;
  block_.createBlock();
  soundManager.SoundPlay("Wind.wav");
  pushMatrix();
  imageMode(CENTER);
  image(balloon, block_.x, block_.y -block.blockHeight*2-10, block.size*block.blockHeight, block.size*block.blockHeight);
  popMatrix();
  if (block_.y<0) {
    balloonAttached = false; // finish the function
    BlockRemove();
  }
}
