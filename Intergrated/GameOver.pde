// Processing PDE files are designed by inner class (inference)
// tower.Tower.peek can also conneted in other class like in here

class GameOver {
    boolean IsGameOver = false;
    boolean firstStart = true;
    // Font
    PFont font;
    String gameOverMessage = "Game Over!";
    

    void GameOverCheck () {
        if (tower.Tower.peek().y < tower.Tower.peek().blockHeight * 2)
            IsGameOver = true;
    }

    void run () {
        if (firstStart) {
            firstStart = false;

            font = createFont("BAUHS93", 16);
        }

        GameOverCheck();

        if (IsGameOver) GameOverDraw(); 
        else GameOverLineDraw();
        
    }

    void GameOverDraw () {
        background(0xff, 0xff, 0xff);

        pushMatrix();
        
        translate(width/2, height/2, 0);
        textFont(font, height/20);
        textAlign(CENTER);
        text(gameOverMessage, 0, 0);

        popMatrix();
    }

    void GameOverLineDraw () {
        stroke(255, 0, 0);
        fill(255, 0, 0);
        rect(0, tower.Tower.peek().blockHeight, width, 10);
    }
}
