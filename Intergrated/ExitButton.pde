class ExitButton {
  Button exit;

  ExitButton() {
    exit = new Button(width, 0, loadImage("x.png"), "X");
    exit.x -= exit.size * 10;
    exit.y += exit.size * 10;
  }

  void drawExitButton() {
    rectMode(CENTER);
    imageMode(CENTER);
    fill(0xff, 0xff, 0xff);
    stroke(0x00, 0x00, 0x00);
    square(exit.x, exit.y, exit.size * 15);
    image(exit.img, exit.x, exit.y, exit.size * 10, exit.size * 10);
  }
}