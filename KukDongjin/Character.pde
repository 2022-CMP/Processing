class Character {
  ArrayList<PImage> slave = new ArrayList<>();
  Block blockLoc = new Block(width / 2, height / 2);
  
  Character() {
    slave.add(loadImage("char1.png"));
    slave.add(loadImage("char2.png"));
    slave.add(loadImage("char3.png"));
    slave.add(loadImage("char4.png"));
    slave.add(loadImage("char5.png"));
  }

  void drawChar() {
    image(slave.get(1), blockLoc.x + blockLoc.size * 60, blockLoc.y + blockLoc.size * 43);
  }
}
