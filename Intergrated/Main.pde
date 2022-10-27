class Main {
  MainButtonUI mainButtonUI;

  Main() {
    mainButtonUI = new MainButtonUI();
  }

  void drawMain() {
    background(0xff, 0xff, 0xff);
    mainButtonUI.drawPanel();
  }
}