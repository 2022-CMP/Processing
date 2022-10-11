class Character {
  ArrayList<PImage> slave = new ArrayList<>();
  ArrayList<PImage> slaveInvert = new ArrayList<>();
  PImage currentSprite;

  Block blockLoc = new Block(width / 2, height / 2);
  float startX = blockLoc.x + blockLoc.size * 60;
  float startY = blockLoc.y + blockLoc.size * 43;
  float x, y;

  float seconds = 0.1f;
  float timeAdder = seconds;
  
  boolean isLeft = true;
  int i = 0;
  
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
    changeChar();

    if (isLeft) {
      image(currentSprite, x, y);
    }
    else {
      image(currentSprite, x, y);
    }

    moveChar();
  }

  void moveChar() {
    if (isLeft) {
      x -= startX / (timer.timeAdder) / (frameRate);
    }
    else {
      x += startX / (timer.timeAdder) / (frameRate);
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
      println(millis() / 1000);
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
}
