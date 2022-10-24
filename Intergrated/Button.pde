class Button {
  float x, y, size;
  color buttonColor;
  PImage img;
  String str;

  Button(float _x, float _y, PImage _img, String _str) {
    x = _x; y = _y;
    size = width / 384;
    img = _img;
    str = _str;
  }

  void buttonClicked() {
    if (isButtonClicked() && !tower.Tower.isEmpty() && block != null) {
      // Get the block (Top of the Tower)
      Block topBlock = block;

      // When FIRE Button Clicked
      if (str.equals("Fire")) {
        fire.startOfFireParticle(topBlock.getBlockCenter());
      }
      // When BOMB Button Clicked
      if (str.equals("Bomb")) {
        explosion = new ExplosionParticleSystem(topBlock.getBlockCenter());
        explosion.startOfExplosion();
      }
      // When LIGHTNING Button Clicked
      // There are some PROBLEMS (CHANGING STROKE of UI)
      if (str.equals("Lightning")) {
        lightnings.ResetLightnings();
      }
      // When PUNCH Button Clicked
      if (str.equals("Punch")) {
        punchAct = true;
      }
      // When WIND Button Clicked
      if (str.equals("Wind")) {
        balloonAct = true;
        tower.pushBlock(block);
        block = null;
      }
      // When CHOPSTICK Button Clicked
      if (str.equals("Chopstick")) {
        chopstickAct = true;
      }
      // DIDN'T add CHOPSTICK IMAGE for DEMOLISHING yet
    }
  }

  /**
    * NEW FUNCTION for BUTTON
    * 
    * returns TRUE of FALSE
    * When Button Clicked, returns TRUE
    * else, returns FALSE
  **/
  boolean isButtonClicked() {
    return (mouseX >= x - size * 15 && mouseX <= x + size * 15 &&
            mouseY >= y - size * 15 && mouseY <= y + size * 15);
  }
}
