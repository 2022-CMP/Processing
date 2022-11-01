class Character {
  // PNGs for Character
  ArrayList<PImage> slave = new ArrayList<>();
  ArrayList<PImage> slaveInvert = new ArrayList<>();
  PImage currentSprite;

  // For Character Location
  Block blockLoc = new Block(width / 2, height / 2);
  float startX = blockLoc.x + blockLoc.size * 60;
  float startY = blockLoc.y + blockLoc.size * 70;
  float x, y;

  // For Animation
  float seconds = 0.1f;
  float timeAdder = seconds;
  
  boolean isLeft = true;
  int i = 0;
  int speed;
  
  // Block Image
  ArrayList<PImage> BlockImages;
  
  Character(int _speed) {
    // Initializing 
    
    slave.add(loadImage("char1.png"));
    slave.add(loadImage("char2.png"));
    slave.add(loadImage("char3.png"));
    slave.add(loadImage("char4.png"));
    slave.add(loadImage("char5.png"));

    slaveInvert.add(loadImage("char1-invert.png"));
    slaveInvert.add(loadImage("char2-invert.png"));
    slaveInvert.add(loadImage("char3-invert.png"));
    slaveInvert.add(loadImage("char4-invert.png"));
    slaveInvert.add(loadImage("char5-invert.png"));

    x = startX; y = startY;
    speed = _speed;
    
    BlockImages = new ArrayList<PImage>();
    for (int i = 1 ; i <= 5; i ++) {
        BlockImages.add(loadImage("Block" + i + ".png"));
    }
  }

  void drawChar() {
    pushMatrix();
    
    translate(x, y);
    imageMode(CENTER);
    
    changeChar();

    if (isLeft) {
      image(currentSprite, 0, 0);
    }
    else {
      image(currentSprite, 0, 0);
    }

    moveChar();
    
    popMatrix();
  }

  void moveChar() {
    if (isLeft) {
      x -= blockLoc.size * speed;
    }
    else {
      x += blockLoc.size * speed;
    }

    if (x <= 0) {
      isLeft = false;
    }
    else if (x >= startX) {
      isLeft = true;
    }
  }

  void changeChar() {
    // When the char turns
    if (isLeft) {
      currentSprite = slave.get(i);
    }
    else {
      currentSprite = slaveInvert.get(i);
    }

    if (millis() >= seconds * 1000) {
      seconds += timeAdder;
      if (++i >= 5) {
        i = 0;
      }

      if (isLeft) {
        currentSprite = slave.get(i);
      }
      else {
        currentSprite = slaveInvert.get(i);
      }
    }
  }

  void drawBlock(Tower tower) {
    if (x >= startX) {
      if (isTextureMode) {
        tower.pushBlock(new Block(width / 2, height / 2, BlockImages.get((int)random(1, BlockImages.size())))); 
      }
      else {
        tower.pushBlock(new Block(width / 2, height / 2, color(random(255), random(255), random(255))));
      }
    }
  }
}
