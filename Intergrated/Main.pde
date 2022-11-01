class Main {
  MainButtonUI mainButtonUI;
  ExitButton exitButton;
  PImage background;

  Main() {
    mainButtonUI = new MainButtonUI();
    exitButton = new ExitButton();
    background = loadImage("Babel.png");
  }

  void drawMain() {
    background(0xff, 0xff, 0xff);
    imageMode(CENTER);
    image(background, width / 2, height / 2, width, height);
    mainButtonUI.drawPanel();
    exitButton.drawExitButton();
  }
}