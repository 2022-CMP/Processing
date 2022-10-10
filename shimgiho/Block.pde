class Block {
  float x, y, l;
  color blockColor;
  float height;
  PImage img;

  boolean textureMode;

  // Default Constructor
  Block() { }

  // Using COLOR
  Block(float _x, float _y, float _l, color _color, float _height) {
    x = _x; y = _y; l = _l;
    blockColor = _color;
    height = _height;
  }

  // Using TEXTURE(PImage)
  Block(float _x, float _y, float _l, color _color, float _height, PImage _img) {
    x = _x; y = _y; l = _l;
    img = _img;
    height = _height;
  }

  void createBlock() {
    if (isTextureMode()) {
      
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
    vertex(x - l * 10, y);
    vertex(x + l * 10, y);
    vertex(x + l * 10, y - l * height);
    vertex(x - l * 10, y - l * height);
    endShape(CLOSE);
    return;
  }

  boolean isTextureMode() {
    return textureMode;
  }
}
