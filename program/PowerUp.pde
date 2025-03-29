public class PowerUp {
  
    int x, y, type;
    PImage powerUpImage;
    Random rand = new Random();
    
    boolean col = false;

    PowerUp(int xp, int yp) {
      
        x = xp;
        y = yp;
        type = (int) rand.nextInt(3);
        
        if (type == 0) {
          
          powerUpImage = loadImage("../assets/doubleShot.png");
        }
        
        if (type == 1){
          
          powerUpImage = loadImage("../assets/tripleShot.png");
        }
        
        if (type == 2) {
          
          powerUpImage = loadImage("../assets/rapidFire.png");
        }
    }

    void update() {
      
        y += 5;
    }

    void draw() {
      
        image(powerUpImage, x, y, 40, 40);
    }
    
    void checkCollision(Player player) {
      
        if (x + 40 > player.posX && x < player.posX + player.playerWidth && y + 40 > player.posY && y < player.posY + player.playerHeight) {
          
            col = true;  
        }
    }
}
