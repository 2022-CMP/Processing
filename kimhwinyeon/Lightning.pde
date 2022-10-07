class Lightning {
  
  /*
  angleOfLine is start angle
  start is start position

  spd is speed. currentProgress is now distance
  n is divide count
  */

  PVector start, end;
  
  boolean issplited = false;
  boolean bothSplited = false;
  
  boolean dead = false;
  
  float angleOfLine, currentProgress = 0;
  float originalHeight, limitDistance;
  
  Lightning s1, s2;
  
  int n, max;
  
  Lightning(PVector start, float originalHeight, int n, int max) {
    this.start = start;
    this.limitDistance = random(originalHeight/2) + originalHeight;
    this.originalHeight = originalHeight;
    this.n = n;
    this.max = max;
    
    angleOfLine = random(PI/4, 3 * PI/4);
    end = new PVector(start.x + cos(angleOfLine) * this.limitDistance, start.y + sin(angleOfLine) * this.limitDistance);
  }
  
  void update(float spd) {
    
    if(currentProgress < limitDistance) {
      currentProgress += spd;
    } else {
      currentProgress = limitDistance;
      if(!issplited && n < max) {
        issplited = true;
        if(random(1) > 0.5) {
          bothSplited = true;
          s1 = new Lightning(end, originalHeight, n + 1, max);
          s2 = new Lightning(end, originalHeight, n + 1, max);
        }  else {
          bothSplited = false;
          s1 = new Lightning(end, originalHeight, n + 1, max);
        }
      } if(n >= max) {
          dead = true;
      } else {
        if(bothSplited) dead = s1.dead && s2.dead;
        else dead = s1.dead;
      }
    }
   if(issplited) {
      s1.update(spd);
      if(bothSplited) {
        s2.update(spd);
      }
    }
  }
  
  void show() {
    
    stroke(255, 255, 0);
    strokeWeight(currentProgress/limitDistance * 5);
    
    line(start.x, start.y, start.x + cos(angleOfLine) * currentProgress, start.y + sin(angleOfLine) * currentProgress);
    if(issplited) {
      s1.show();
      if(bothSplited) {
        s2.show();
      }
    }
  }
  
}
