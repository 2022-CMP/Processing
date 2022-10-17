class DemolishUI {
  ArrayList<Button> buttonPanel = new ArrayList<>();
  float x, y;
  float startX;
  float size = width / 384;

  /**
   * *  ORDER OF BUTTONS
   * 1. FIRE
   * 2. BOMB
   * 3. LIGHTNING
   * 4. PUNCH
   * 5. WIND
   * 6. CHOPSTICK
   */
  DemolishUI(float _x, float _y) {
    x = _x - size * 80; y = _y - size * 90;
    startX = x;

    buttonPanel.add(new Button(x, y, loadImage("fire.png")));
    buttonPanel.add(new Button(x, y, loadImage("bomb.png")));
    buttonPanel.add(new Button(x, y, loadImage("lightning.png")));
    buttonPanel.add(new Button(x, y, loadImage("punch.png")));
    buttonPanel.add(new Button(x, y, loadImage("wind.png")));
    buttonPanel.add(new Button(x, y, loadImage("chopstick.png")));
  }

  void drawPanel() {
    rectMode(CENTER);
    imageMode(CENTER);
    for (int i = 0; i < buttonPanel.size(); i++, x += size * 30) {
      noFill();
      stroke(0x00, 0x00, 0x00);
      square(x, y, size * 30);
      image(buttonPanel.get(i).img, x, y, size * 20, size * 20);
    }
    x = startX;
  }
}
