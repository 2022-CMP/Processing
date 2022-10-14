class Block {
  float x, y, size;
  color blockColor;
  float blockWidth, blockHeight;
  PImage img;

  boolean isTextureMode;

  // Default Constructor
  Block() { }

  // Constructor to get Block Location
  Block(float _x, float _y) {
    x = _x; y = _y;
    size = width / 384;
  }

  // Using COLOR
  Block(float _x, float _y, color _color) {
    x = _x; y = _y;
    size = width / 384;
    blockColor = _color;
    blockWidth = size * 40; blockHeight = size * 10;
    isTextureMode = false;

    x = x + size * 80;
    y = y + size * 60;
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
    pushMatrix();
    
    translate(x, y);
    
    if (isTextureMode) {
      drawTextureBlock();
    }
    else {
      drawColorBlock();
    }

    popMatrix();
  }

  void drawTextureBlock() {
    noStroke();
    
    textureMode(NORMAL);
    beginShape();
    texture(img);
    vertex(x - blockWidth/2,              y - blockHeight/2,  0, 0);
    vertex(x + blockWidth/2,              y - blockHeight/2,  1, 0);
    vertex(x + blockWidth/2,              y + blockHeight/2,  1, 1);
    vertex(x - blockWidth/2,              y + blockHeight/2,  0, 1);
    endShape();
    
    return;
  }

  void drawColorBlock() {
    noStroke();
    fill(blockColor);

    // DEFAULT BLOCK LOCATION
    beginShape();
    vertex(x - blockWidth/2,              y - blockHeight/2,  0, 0);
    vertex(x + blockWidth/2,              y - blockHeight/2,  0, 0);
    vertex(x + blockWidth/2,              y + blockHeight/2,  0, 0);
    vertex(x - blockWidth/2,              y + blockHeight/2,  0, 0);
    endShape(CLOSE);
    
    return;
  }
}
