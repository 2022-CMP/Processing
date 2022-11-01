class Credit {
  float x, y;
  float size = width / 384;

  String info = "MADE BY\n\n\nKim Hwi-Nyeon\nShim Gi-Ho\nKuk Dong-Jin\n";
  PFont font = createFont("Georgia", size * 10);

  BackButton backButton;

  Credit() {
    x = width / 2;
    y = height / 2;

    backButton = new BackButton();
  }

  void drawCredit() {
    background(0xff, 0xff, 0xff);
    fill(0x00, 0x00, 0x00);
    textAlign(CENTER);
    text(info, x, y);

    backButton.drawBackButton();
  }
}