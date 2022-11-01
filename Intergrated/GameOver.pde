// Processing PDE files are designed by inner class (inference)
// tower.Tower.peek can also conneted in other class like in here

class GameOver {
    boolean IsGameOver = false;
    boolean firstStart = true;
    // Font
    PFont font1;
    String gameOverMessage = "Game Over!";
    float lineHeight;
    

    void GameOverCheck () {
        if (!tower.Tower.isEmpty()) {
            if (tower.Tower.peek().y < tower.Tower.peek().blockHeight * 2)
                IsGameOver = true;
        }
    }

    void run () {
        if (firstStart) {
            firstStart = false;

            lineHeight = tower.Tower.peek().blockHeight;
            font1 = createFont("Arial", 16);
        }

        GameOverCheck();

        if (IsGameOver) GameOverDraw(); 
        else GameOverLineDraw();
        
    }

    void GameOverDraw () {
        background(0xff, 0xff, 0xff);

        pushMatrix();
        
        translate(width/2, height/2, 0);
        textFont(font1, height/20);
        textAlign(CENTER);
        text(gameOverMessage, 0, 0);

        popMatrix();
    }

    void GameOverLineDraw () {
        stroke(255, 0, 0);
        fill(255, 0, 0);
        rect(0, lineHeight, width, 10);
    }
}
