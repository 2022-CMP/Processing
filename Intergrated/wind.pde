PImage balloon;
float windWeight = 3;

void beforeWind(Block block) { // if balloon function start balloon follow mouse curser
  pushMatrix();
  imageMode(CENTER);
  
  if (!tower.Tower.isEmpty())
    image(balloon, mouseX, mouseY, tower.Tower.peek().size*tower.Tower.peek().blockHeight, tower.Tower.peek().size*tower.Tower.peek().blockHeight);
  
  popMatrix();
}

void wind(Block block) { // balloon attached and fly away
  Block block_ = block;
  block_.x += windWeight;
  block_.y -= windWeight;
  block_.createBlock();
  soundManager.SoundPlay("Wind.wav");
  pushMatrix();// Image attached at top of the demolished block
  imageMode(CENTER);
  image(balloon, block_.x, block_.y -block.blockHeight*2-10, block.size*block.blockHeight, block.size*block.blockHeight);
  popMatrix();
  if (block_.y<0) { // if block is not in the monitor territory 
    balloonAttached = false; // finish the function
    BlockRemove();
  }
}
