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
    isTextureMode = false;
  }

  // Using TEXTURE(PImage)
  Block(float _x, float _y, PImage _img) {
    x = _x; y = _y;
    size = width / 384;
    img = _img;
    blockWidth = size * 40; blockHeight = size * 10;
    isTextureMode = true;
  }

  void createBlock() {
    if (isTextureMode) {
      drawTextureBlock();
    }
    else {
      drawColorBlock();
    }
  }

  void drawTextureBlock() {
    noStroke();
    
    textureMode(NORMAL);
    beginShape();
    texture(img);
    vertex(x + size * 80,              y + size * 60,                0, 0);
    vertex(x + size * 80 + blockWidth, y + size * 60,                1, 0);
    vertex(x + size * 80 + blockWidth, y + size * 60 + blockHeight,  1, 1);
    vertex(x + size * 80,              y + size * 60 + blockHeight,  0, 1);
    endShape();
    
    return;
  }

  void drawColorBlock() {
    noStroke();
    fill(blockColor);

    // DEFAULT BLOCK LOCATION
    beginShape();
    vertex(x + size * 80,              y + size * 60,                0, 0);
    vertex(x + size * 80 + blockWidth, y + size * 60,                0, 0);
    vertex(x + size * 80 + blockWidth, y + size * 60 + blockHeight,  0, 0);
    vertex(x + size * 80,              y + size * 60 + blockHeight,  0, 0);
    endShape(CLOSE);
    
    return;
  }
}
