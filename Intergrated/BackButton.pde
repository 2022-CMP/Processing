class BackButton {
  Button back;

  BackButton() {
    back = new Button(width, 0, loadImage("back.png"), "Back");
    back.x -= back.size * 10;
    back.y += back.size * 10;
  }

  void drawBackButton() {
    imageMode(CENTER);
    fill(0xff, 0xff, 0xff);
    stroke(0x00, 0x00, 0x00);
    image(back.img, back.x, back.y, back.size * 25, back.size * 20);
  }
}