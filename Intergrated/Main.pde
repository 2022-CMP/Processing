class Main {
  MainButtonUI mainButtonUI;
  ExitButton exitButton;

  Main() {
    mainButtonUI = new MainButtonUI();
    exitButton = new ExitButton();
  }

  void drawMain() {
    background(0xff, 0xff, 0xff);
    mainButtonUI.drawPanel();
    exitButton.drawExitButton();
  }
}