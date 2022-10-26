class Main {
  MainUI mainUI;
  
  Main() {
    mainUI = new MainUI();
  }

  void drawMain() {
    background(0xff, 0xff, 0xff);
    mainUI.drawPanel();
  }
}