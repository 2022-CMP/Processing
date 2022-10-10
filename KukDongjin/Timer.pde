class Timer {
  int seconds;
  
  Block block;
  
  // DEFAULT Constructor
  Timer() {
    seconds = 1;
  }
  
  void createNewBlock(Tower tower) {
    if (millis() / 1000 >= seconds) {
      if (isTextureMode) {
        tower.pushBlock(new Block(width / 2, height / 2, loadImage("sunflower.jpg")));
      }
      else {
        tower.pushBlock(new Block(width / 2, height / 2, randomColor()));
      }
      seconds += 1;
    }
  }
  
  color randomColor() {
    return color(random(0xff), random(0xff), random(0xff));
  }
}
