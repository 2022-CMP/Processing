class Shard {
  float x, y;    // position
  float dx, dy;  // velocity
  float r;       // radius
  float dr;      // rate of change of radius

  boolean visible;

  Shard() {
     reset();
  }

  void reset() {
    dx = random(-2.0, 2.0);   // try changing these
    dy = random(-2.0, 2.0);   // initial random
    r = random(4.0, 10.0);    // values to get different
    dr = random(-0.5, 0.0);   // kinds of explosions
    visible = true;
  }

  void render() {
    if (visible) {
      ellipse(x, y, 2 * r, 2 * r);
    }
  }

  void update() {
    x += dx;
    y += dy;
    r += dr;

    if (r < 1) {   // when the shard gets too small, make it disappear
      visible = false;
    }
  }
} // class Shard