class NewLightning {
    PVector start, end;
    
    // Lightning...
    float angleOfLine, currentProgress = 0;
    float originalDistance, limitDistance;
    float speed = width / 30;

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

    void Update () {

        if(currentProgress < limitDistance) {
            currentProgress += speed;
        } else {
            // Only once when split
            if(!issplited && reculsionCount < max) {
                currentProgress = limitDistance;

                issplited = true;
                if(random(1) > 0.5) {
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

    void show() {
    
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
