class Block {
  float x, y, size;
  color blockColor;
  float width, height;
  PImage img;

  boolean isTextureMode;

  // Default Constructor
  Block() { }

  // Using COLOR
  Block(float _x, float _y, float _size, color _color) {
    x = _x; y = _y; size = _size;
    blockColor = _color;
    width = size * 40; height = size * 10;
  }

  // Using TEXTURE(PImage)
  Block(float _x, float _y, float _size, color _color, PImage _img) {
    x = _x; y = _y; size = _size;
    img = _img;
    width = size * 40; height = size * 10;
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

    beginShape();
    vertex(x + size * 80,         y + size * 60);
    vertex(x + size * 80 + width, y + size * 60);
    vertex(x + size * 80 + width, y + size * 60 + height);
    vertex(x + size * 80,         y + size * 60 + height);
    endShape(CLOSE);
    
    return;
  }
}