/* autogenerated by Processing revision 1286 on 2022-10-07 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class kimhwinyeon extends PApplet {



NewLightnings lightnings;
ParticleSystem fire;

 public void setup() {
    /* size commented out by preprocessor */;
    lightnings = new NewLightnings();
    fire = new ParticleSystem(new PVector(width/2, height/2));
}

 public void draw () {
    background(150);
    
    lightnings.Update();
    ps.addParticle();
    ps.run();
}

 public void mousePressed () {
    lightnings.ResetLightnings();
}
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
  
   public void update(float spd) {
    
    if(currentProgress < limitDistance) {
      currentProgress += spd;
    } else {
      currentProgress = limitDistance;
      if(!issplited && n < max) {
        issplited = true;
        if(random(1) > 0.5f) {
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
  
   public void show() {
    
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
class NewLightning {
    PVector start, end;
    
    // Lightning...
    float angleOfLine, currentProgress = 0;
    float originalDistance, limitDistance;
    float speed = width / 50;

    // Reculsion
    NewLightning s1, s2;
    boolean issplited = false;
    boolean bothSplited = false;

    // Reculsion end Condition
    int reculsionCount, max;
    boolean dead = false;


    NewLightning(PVector start, int reculsionCount, int max) {
        // Lightning
        
        this.start = start;

        angleOfLine = random(PI/4, 3 * PI/4);

        this.originalDistance = width/10;
        this.limitDistance = random(originalDistance/2) + originalDistance;
        
        end = new PVector(start.x + cos(angleOfLine) * this.limitDistance, start.y + sin(angleOfLine) * this.limitDistance);
        
        // For Reculsion
        this.reculsionCount = reculsionCount;
        this.max = max;
    }

     public void Update () {

        if(currentProgress < limitDistance) {
            currentProgress += speed;
        } else {
            // Only once when split
            if(!issplited && reculsionCount < max) {
                currentProgress = limitDistance;

                issplited = true;
                if(random(1) > 0.5f) {
                    bothSplited = true;
                    s1 = new NewLightning(end, reculsionCount + 1, max);
                    s2 = new NewLightning(end, reculsionCount + 1, max);
                }  else {
                    bothSplited = false;
                    s1 = new NewLightning(end, reculsionCount + 1, max);
                }
            }

            // After Splited
            if (reculsionCount < max) {
                s1.Update();
                if(bothSplited) {
                    s2.Update();
                }
            } 
            
            if(reculsionCount >= max) {
                dead = true;
            } else {
                if(bothSplited) dead = s1.dead && s2.dead;
                else dead = s1.dead;
            }
        }
    }

     public void show() {
    
        stroke(255, 255, 0);
        strokeWeight(currentProgress/limitDistance * width/200);
        
        line(start.x, start.y, start.x + cos(angleOfLine) * currentProgress, start.y + sin(angleOfLine) * currentProgress);
        
        if(issplited) {
            s1.show();
            
            if(bothSplited) {
                s2.show();
            }
        }
    }
}
class NewLightnings {
    ArrayList<NewLightning> lightnings = new ArrayList<NewLightning>(); 
    boolean firstOccur = true;

    // Check Done
    boolean Done = false;

     public void Update () {
        if(firstOccur) {
            firstOccur = false;
            for (int i = 0 ; i < 3 ; i++)
                lightnings.add(new NewLightning(new PVector(random(0, width), 0), 0, 7));
        }

        for (int i = lightnings.size() - 1; i >=0; i--) {
            lightnings.get(i).Update();
            lightnings.get(i).show();

            if (lightnings.get(i).dead) {
                lightnings.remove(i);
            }
        }
    }

     public void ResetLightnings () {
        firstOccur = true;
    }

}
// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05f);
    velocity = new PVector(random(-1, 1), random(1, 0));
    position = l.copy();
    lifespan = 255.0f;
  }

   public void run() {
    update();
    display();
  }

  // Method to update position
   public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0f;
  }

  // Method to display
   public void display() {
    stroke(255, random(0,20), 0, lifespan);
    fill(255, random(0,20), 0, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
   public boolean isDead() {
    if (lifespan < 0.0f) {
      return true;
    } else {
      return false;
    }
  }
}
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

   public void addParticle() {
    particles.add(new Particle(origin));
  }

   public void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
class Fire {
  
}


  public void settings() { size(1080, 720); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "kimhwinyeon" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
