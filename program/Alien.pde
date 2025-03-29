public class Alien {

    int posX = 0;
    int posY = 0;
    int baseY = 0;  // Maintain a base Y position
    
    boolean alreadyDone = false;

    float x = 0;

    int alienWidth = 80;
    int alienHeight = 80;

    boolean goDown = false;

    int counter = 0;
    int explosionCounter = 0;
    int tempY = 0;

    PImage alien = loadImage("../assets/alien.gif");
    PImage greenAlien = loadImage("../assets/greenAlien.gif");
    PImage explosion = loadImage("../assets/explosion.gif");

    boolean firstTime = true;
    boolean moveRight = true;
    boolean moveLeft = false;

    boolean exploded = false;
    boolean explosionAnim = false;

    boolean colRanFirstTime = true;
    boolean white = false;
    boolean green = false;

    float speed = 10;
    
    
    ArrayList<Bomb> bombs = new ArrayList<>();
    

    Alien(int positionX, int positionY) {

        posX = positionX;
        posY = positionY;
        baseY = positionY;
    }


    void sinMoveY() {

        posY = baseY + (int) (20 * sin(x));
        x += 0.2;
    }

    void move() { //<>// //<>// //<>//

        if (posX + alienWidth >= width) { //<>// //<>// //<>// //<>// //<>//

            goDown = true;
            moveRight = false;
            firstTime = false;
        }

        if (posX <= 0 && !firstTime) {

            goDown = true;
            moveLeft = false;
        }

        if (goDown) {

            baseY += 10;
            posY += 10;
            counter++;
            speed+=0.1;
        }

        if (counter >= 8) {

            goDown = false;

            if (posX + alienWidth >= width) {

                moveLeft = true;
            }

            if (posX <= 0) {

                moveRight = true;
            }

            counter = 0;
        }

        if (moveRight && !goDown && !moveLeft) {

            posX += speed;
        }

        if (!moveRight && moveLeft && !goDown) {

            posX -= speed;
        }
    }

    void draw() {

        Random colRand = new Random();
        double randNumbForCol = colRand.nextInt(0, 2);

        if (white || (randNumbForCol == 0 && colRanFirstTime)) {

            white = true;
            colRanFirstTime = false;
            alien.resize(alienWidth, alienHeight);
            image(alien, posX, posY);
        } 
        
        if (green || (randNumbForCol == 1 && colRanFirstTime)) {

            green = true;
            colRanFirstTime = false;
            greenAlien.resize(alienWidth, alienHeight);
            image(greenAlien, posX, posY);
            
            sinMoveY();
        }
    }

    void explode() {

        Random rand = new Random();
        double randomNumber = rand.nextInt(100000);

        if ((int) randomNumber == 3) {

            exploded = true;
            explosionAnim = true;
        }
    }

    void explosionAni() {

        if (explosionCounter < 20) {
            
            explosionCounter++;
            
            explosion.resize(80, 80);
            image(explosion, posX, posY);
        }
    }


    void checkCollision(ArrayList<Bullet> bullets) {
      
        for (Bullet bullet : bullets) {
          
            if (!exploded && bullet.x > posX && bullet.x < posX + alienWidth && bullet.y > posY && bullet.y < posY + alienHeight) {
                  
                exploded = true;
                
                Random rand1 = new Random();
                
                if (rand1.nextInt(100) < 30) {
                  
                    powerUps.add(new PowerUp(posX, posY));
                }
                break;
            }
        }
    }



    void createBomb() {

        Random rand3 = new Random();

        if (rand3.nextInt(10000) < 30) {

            bombs.add(new Bomb(posX, posY + 40));
            //bombs.add(new Bomb(posX, posY + 30));
            //bombs.add(new Bomb(posX, posY + 20));
            //bombs.add(new Bomb(posX, posY + 10));
            //bombs.add(new Bomb(posX, posY));
        }
    }
    
    void increaseCounter() {
      
        if (alreadyDone == false) {
          
            expoCountTest++;
            alreadyDone = true;
        }
    }
}
