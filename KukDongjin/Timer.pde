class Timer {
  int seconds;
  
  // DEFAULT Constructor
  Timer() {
    seconds = 1;
  };
  
  void createNewBlock(Tower tower) {
    if (millis() / 1000 >= seconds) {
      tower.pushBlock(new Block(width / 2, height / 2, color(random(0xff), random(0xff), random(0xff))));
      seconds += 1;
    }
  }
}
