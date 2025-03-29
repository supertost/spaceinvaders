import java.util.Random;
import processing.sound.*;

Alien[] theAlien;
Player thePlayer;
Bullet theBullet;

//Shield[] theShield;

boolean continueGame = true;
boolean gameWon = false;

public int expoCountTest = 0;

ArrayList<PowerUp> powerUps = new ArrayList<>();

ArrayList<Shield> shields = new ArrayList<>();


SoundFile file;

void setup() {
  
    file = new SoundFile(this, "../assets/testo.mp3");
    file.play();
    file.loop();
    
    size(1200, 1000);
    
    PFont testF;
    
    testF = createFont("../assets/PStart.ttf", 64);
    
    textMode(CENTER);
    textFont(testF);
    textAlign(CENTER);

    theAlien = new Alien[10];

    int positionX = mouseX;
    int positionY = height - 100;

    thePlayer = new Player(positionX, positionY);
    
    for (int i = 0; i < theAlien.length; i++) {
      
        int xPosition = i * 100;
        int yPosition = 50;
        
        theAlien[i] = new Alien(xPosition, yPosition);
    }
    
    
    for (int i = 0; i < 3; i++) {
      
        int xPosition = i * 400 + width/2 - 400;
        int yPosition = height - 225;
        
        shields.add(new Shield(xPosition, yPosition));
    }
    
    
    
}

void draw() {

    background(0);



    if (continueGame == false && gameWon == false) {
      
        
        fill(250, 255, 150);
        
        text("You Lost", width/2, height/2);
    }

    if (continueGame == false && gameWon == true) {
      
        fill(250, 255, 150);
        text("You Won", width/2, height/2);
    }


    if (continueGame) {
      
        if (expoCountTest == theAlien.length) {

             gameWon = true;
             continueGame = false;
        }

        thePlayer.draw();

        for (int i = 0; i < theAlien.length; i++) {
        
            Alien currentAlien = theAlien[i];

            
            if (!currentAlien.exploded) {
            
                currentAlien.draw();
                currentAlien.move();
                currentAlien.explode();
                //currentAlien.sinMoveY();
                
                currentAlien.checkCollision(thePlayer.bullets);
                
                currentAlien.createBomb();
            }
            
            if (currentAlien.exploded) {

                currentAlien.explosionAni();
                currentAlien.increaseCounter();
            }
            
            
            for (int j = currentAlien.bombs.size() - 1; j >= 0; j--) {
        
                Bomb b = currentAlien.bombs.get(j);
                
                b.move();
                
                b.draw();
                
                b.collideBomb(thePlayer);
                
                
                for (int k = shields.size() - 1; k >= 0; k--) {
                  
                    Shield s = shields.get(k);
                    
                    if (b.collidesWithShield(s)) {
                      
                        s.lives--;
                        currentAlien.bombs.remove(j);
                        break;
                    }
                }
                
                //b.checkCollision(thePlayer);
                
                if (b.offScreen == true) {
                    
                    currentAlien.bombs.remove(i);
                }
                
                if (b.colBomb == true) {
                
                    continueGame = false;
                }
                
            }
        }
        
        for (int i = shields.size() - 1; i >= 0; i--) {
          
            Shield s = shields.get(i);
            
            s.checkBulletCollision(thePlayer.bullets);
            
            s.draw();
            
            if (s.lives <= 0) {
              
                shields.remove(i);
            }
        }
        
        for (int i = powerUps.size() - 1; i >= 0; i--) {
        
            PowerUp p = powerUps.get(i);
            
            p.update();
            
            p.draw();
            
            p.checkCollision(thePlayer);
            
            if (p.col == true) {
            
                thePlayer.applyPowerUp(p);
                powerUps.remove(i);
            }
        }
    }

    
}

void mousePressed() {
    
    thePlayer.shoot();
}
