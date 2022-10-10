class Character {
  ArrayList<PImage> slave = new ArrayList<>();
  ArrayList<PImage> slaveInvert = new ArrayList<>();
  Block blockLoc = new Block(width / 2, height / 2);
  float startX = blockLoc.x + blockLoc.size * 60;
  float startY = blockLoc.y + blockLoc.size * 43;
  float x, y;
  
  boolean isLeft = true;
  
  Character() {
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
  }

  void drawChar() {
    if (isLeft) {
      image(slave.get(1), x, y);
    }
    else {
      image(slaveInvert.get(1), x, y);
    }

    moveChar();
  }

  void moveChar() {
    if (isLeft) {
      x -= blockLoc.size * 5;
    }
    else {
      x += blockLoc.size * 5;
    }

    if (x <= 0) {
      isLeft = false;
    }
    else if (x >= startX) {
      isLeft = true;
    }
  }
}
