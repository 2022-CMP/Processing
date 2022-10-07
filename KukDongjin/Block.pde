class Block {
  float x, y, size;
  color blockColor;
  float blockWidth, blockHeight;
  PImage img;

  boolean isTextureMode;

  // Default Constructor
  Block() { }

  // Using COLOR
  Block(float _x, float _y, color _color) {
    x = _x; y = _y;
    size = width / 384;
    blockColor = _color;
    blockWidth = size * 40; blockHeight = size * 10;
  }

  // Using TEXTURE(PImage)
  Block(float _x, float _y, color _color, PImage _img) {
    x = _x; y = _y;
    size = width / 384;
    img = _img;
    blockWidth = size * 40; blockHeight = size * 10;
  }

  void createBlock() {
    if (isTextureMode) {
      
    }
    else {
      drawColorBlock();
    }
  }

  void drawTextureBlock() {

  }

  void drawColorBlock() {
    noStroke();
    fill(blockColor);

    // DEFAULT BLOCK LOCATION
    beginShape();
    vertex(x + size * 80,              y + size * 60);
    vertex(x + size * 80 + blockWidth, y + size * 60);
    vertex(x + size * 80 + blockWidth, y + size * 60 + blockHeight);
    vertex(x + size * 80,              y + size * 60 + blockHeight);
    endShape(CLOSE);
    
    return;
  }
}
