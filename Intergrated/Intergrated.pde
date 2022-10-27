import java.util.*;

PApplet myClass = this;

// Stacking Tower of Babel
boolean isTextureMode = false;
Tower tower = new Tower();

Character slave;
Block block;

// Demolishing Powers

NewLightnings lightnings; // 01. Lightnings
FireParticleSystem fire; // 02. Fire
ExplosionParticleSystem explosion; // 03. Explosion

// 4. Punch
boolean punchAct = false;
// 5. Chopsticks
boolean chopstickAct = false;
// 6. Wind
boolean balloonAttached =false;
boolean balloonAct = false;

// 22.10.18 : GameOver
GameOver gameOver; 

// 22.10.19 : Change the difficulty
float startTime;
float EachLevelPeriod;

// 22.10.20 : Background Image
PImage background;

// 22.10.21 : Music & Effets
SoundManager soundManager;

// 22.10.21 : WeatherAPI
WeatherAPI weatherAPI;
boolean isWeatherAPIExceptionOccur = false; // exception check

// 22.10.21 : Button UI
DemolishUI demolishUI;

// 22.10.27 : Main Page
Main main;

// 22.10.27 : Page Status
Page currentPage = Page.MAIN;


void setup() {
    size(displayWidth, displayHeight, P3D);
    // size(1000, 1000, P3D);

    // 22.10.20 : Background Image
    background = loadImage("Background.png");
    
    // Stacking Tower
    slave = new Character(2);
    // 22.10.20 : texture - block
    isTextureMode = true;


    // Demolising Powers 1
    lightnings = new NewLightnings();
    fire = new FireParticleSystem(0, new PVector(width/2, height/2));
    explosion = new ExplosionParticleSystem(new PVector(mouseX, mouseY));


    // Demolising Powers 2

    // Punch
    windowBreak = loadImage("pngwing.com.png");//thanks for pngwing
    punchM = loadImage("pngaaa.com-76920.png");//thanks for pngaaa

    // Chopsticks
    chopstick = loadImage("chopstick.png");//thanks fo dlf.pt.

    // Wind
    balloon = loadImage("balloon.png"); // image thanks for flaticon


    // 22.10.18 : GameOver
    gameOver = new GameOver();

    // 22.10.19 : Change Difficulty
    startTime = millis();
    EachLevelPeriod = 10000;

    // 22.10.20 : Music & Effects
    soundManager = new SoundManager();
    
    // 22.10.21 : Weather API
    try {
        weatherAPI = new WeatherAPI();
    }
    catch (Exception e) {
        println("WeatherAPI Exception Occur");
        isWeatherAPIExceptionOccur = true;
    }
    
    // 22.10.21 : Demolish UI & Button
    demolishUI = new DemolishUI(width/2, height/2);
    
    // 22.10.26 : plz finish sound
    soundManager.SoundAmp("Background.wav",0.3);
    soundManager.BackgroundMusic("Background.wav");

    // 22.10.27 : Main Page
    main = new Main();
}

void draw () {
    // Main Page
    if (currentPage == Page.MAIN) {
        main.drawMain();
    }

    // Game Page
    if (currentPage == Page.GAME) {
        background(0xff, 0xff, 0xff);
        imageMode(CORNER);
        image(background, 0, 0, width, height);
        
        // Stacking Tower
        if (block != null) {
        block.createBlock();
        println(block.x + "    " + block.y);
        }

        slave.drawBlock(tower);
        tower.drawTower();
        slave.drawChar();
        
        
        // Demolising Powers 1
        lightnings.Update();
        fire.run();
        explosion.run();


        // Demolising Powers 2

        // Punch
        if (punchAct == true) {//function start
            Punching(block);

            if (block != null)
                block.y -=10;
        }

        // Chopsticks
        if(chopstickAct == true){
            Chopstick(block);
            println("Chopsticks");
        }

        // Wind
        if (balloonAttached == true) {//check to activate function
            wind(block);
        } else if(balloonAct == true) {//check  
            beforeWind(block);
        }

        // 22.10.18 : Game Over
        gameOver.run();

        // 22.10.19 : Change the Difficulty
        if (millis() - startTime > EachLevelPeriod)  {
            startTime += EachLevelPeriod;
            slave.speed += 1;
        }
        
        // 22.10.21 : WeatherAPI
        if (!isWeatherAPIExceptionOccur)
            weatherAPI.run();

        // 22.10.21 : Demolish UI
        demolishUI.drawPanel();
        // 22.10.26 : time Checking
        //println(weatherAPI.timeChecker);
    }
}


void BlockRemove () {
    block = null;
}


// Initial version of integration
void mousePressed () {
    
    if (!tower.Tower.isEmpty()) {
        if (block != null && (punchAct || balloonAttached || chopstickAct)) {
            punchAct = false;
            balloonAttached = false;
            chopstickAct = false;

            BlockRemove();
        }

        block = tower.popBlock();

        for (int i = 0 ; i < demolishUI.buttonPanel.size() ; i++) {
            demolishUI.buttonPanel.get(i).buttonClicked(); 
        }

        if (balloonAct) {
            if (balloonAct && (mouseX > tower.Tower.peek().x - tower.Tower.peek().size*10&&mouseX < tower.Tower.peek().x + tower.Tower.peek().size*10 
                && mouseY < tower.Tower.peek().y && mouseY > tower.Tower.peek().y - tower.Tower.peek().size * tower.Tower.peek().blockHeight)) {
                balloonAttached = true;
                balloonAct = false;
            } else {
                if (block != null) {
                    tower.pushBlock(block);
                    block = null;
                }
            }
        } 
    }

    // Button in Main Screen
    for (int i = 0; i < main.mainButtonUI.mainButtonPanel.size(); i++) {
        main.mainButtonUI.mainButtonPanel.get(i).buttonClicked();
    }

    /*
    // Checking highest stack block
    if (!tower.Tower.isEmpty()) {
        if (block != null && (punchAct || balloonAttached || chopstickAct)) {
            punchAct = false;
            balloonAttached = false;
            chopstickAct = false;

            BlockRemove();
        }

        block = tower.popBlock();

        if (key == '1')
            lightnings.ResetLightnings();
        else if (key == '2') {
            fire.startOfFireParticle(new PVector(block.x, block.y));
        } else if (key == '3') {
            explosion = new ExplosionParticleSystem(new PVector(block.x, block.y));
            explosion.startOfExplosion();
        } else if (key == '4') 
            punchAct = true;
        else if (key == '5')
            chopstickAct = true;
        else if (balloonAct) {
            if (balloonAct && (mouseX > block.x - block.size*10&&mouseX < block.x + block.size*10 && mouseY < block.y && mouseY > block.y - block.size * block.blockHeight)) {
                balloonAttached = true;
                balloonAct = false;
            }
        }
    } */
}

void keyPressed() {
    if (key == '6')
        balloonAct =true;
}
