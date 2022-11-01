class MainButtonUI {
  ArrayList<Button> mainButtonPanel = new ArrayList<>();
  float x, y;
  float startY;
  float size = width / 384;

  PFont font = createFont("Georgia", size * 10);

  MainButtonUI() {
    x = width / 2;
    y = height / 2;
    startY = y;

    mainButtonPanel.add(new Button(x, y, "Start"));
    y += size * 30;
    mainButtonPanel.add(new Button(x, y, "Option"));
    y += size * 30;
    mainButtonPanel.add(new Button(x, y, "Credit"));
    y = startY;
  }

  void drawPanel() {
    for (int i = 0; i < mainButtonPanel.size(); i++, y += size * 30) {
      rectMode(CENTER);
      noFill();
      stroke(0x00, 0x00, 0x00);
      strokeWeight(3);
      rect(x, y, size * 40, size * 15);
      fill(0x00, 0x00, 0x00);
      textFont(font, size * 10);
      textAlign(CENTER, CENTER);
      text(mainButtonPanel.get(i).str, x, y);
    }
    y = startY;
  }
}