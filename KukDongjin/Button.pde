class Button {
  float x, y, size;
  color buttonColor;
  PImage img;
  String str;

  Button(float _x, float _y, PImage _img, String _str) {
    x = _x; y = _y;
    size = width / 384;
    img = _img;
    str = _str;
  }

  void buttonClicked() {
    if (mouseX >= x && mouseX <= x + size * 30 &&
        mouseY >= y && mouseY <= y + size * 30 && !tower.Tower.isEmpty()) {
      if (str.equals("Fire")) {
        Block temp = tower.popBlock();
        fire.startOfFireParticle(temp.getBlockCenter());
      }
    }
  }
}