public class Player {
  
    int posX = mouseX;
    int posY = height - 100;
    
    int fireMode = 0;
    int fireRate = 10;
    

    int playerWidth = 80;
    int playerHeight = 80;


    boolean shootBul = false;

    ArrayList<Bullet> bullets = new ArrayList<>();

    PImage player = loadImage("../assets/spaceship.png");
  
    Player (int positionX, int positionY) {

        posX = positionX;
        posY = positionY;

        noCursor();
        imageMode(CENTER);
    }

    void draw() {
      
        posX = mouseX;

        player.resize(playerWidth, playerHeight);
        image(player, posX, posY);

        for (int i = bullets.size() - 1; i >= 0; i--) {
            
            Bullet bullet = bullets.get(i);
            bullet.update();
            bullet.draw();
            
            if (fireRate == 10) {
              
              bullet.speed();
            }
            else if ( fireRate == 15 ) {
          
                bullet.speedIncrease();
            }

            // Remove bullet if it goes off the screen
            if (bullet.offScreen()) {
              
                bullets.remove(i);
            }
            

        }

    }
    
    
    void shoot() {
      
        if (fireMode == 0) {
          
            bullets.add(new Bullet(mouseX, posY - 40));
        }
        
        else if (fireMode == 1) {
          
            bullets.add(new Bullet(mouseX - 10, posY - 40));
            bullets.add(new Bullet(mouseX + 10, posY - 40));
        } 
        
        else if (fireMode == 2) {
          
            bullets.add(new Bullet(mouseX, posY - 40));
            bullets.add(new Bullet(mouseX - 15, posY - 35));
            bullets.add(new Bullet(mouseX + 15, posY - 35));
        }
        
    }
    
    void applyPowerUp(PowerUp p) {
      
        if (p.type == 0) {
          
          fireMode = 1; 
        }
        
        if (p.type == 1) {
          
          fireMode = 2;
        }
        
        if (p.type == 2) {
          
          fireRate = 15;
        }
    }
  
}
