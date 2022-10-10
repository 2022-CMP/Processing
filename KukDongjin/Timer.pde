class Timer {
  int seconds;
  int timeAdder;
  Block block;
  
  // DEFAULT Constructor
  Timer(int second) {
    seconds = second;
    timeAdder = seconds;
  }
  
  void createNewBlock(Tower tower) {
    if (millis() / 1000 >= seconds) {
      if (isTextureMode) {
        tower.pushBlock(new Block(width / 2, height / 2, loadImage("sunflower.jpg")));
      }
      else {
        tower.pushBlock(new Block(width / 2, height / 2, randomColor()));
      }
      seconds += timeAdder;
    }
  }
  
  color randomColor() {
    return color(random(0xff), random(0xff), random(0xff));
  }
}
