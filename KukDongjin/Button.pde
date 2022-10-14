class Button {
  float x, y, size;
  color buttonColor;
  PImage img;

  Button(float _x, float _y, PImage _img) {
    x = _x; y = _y;
    size = width / 384;
    img = _img;
  }
}