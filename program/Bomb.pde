public class Bomb {


    PImage bombImg = loadImage("../assets/bomb.jpg");

    int posXBomb;
    int posYBomb;

    int speedBomb = 5;

    boolean offScreen = false;
    
    boolean colBomb = false;
    
    boolean colShield = false;


    Bomb (int startXBo, int startYBo) {
      
      
        posXBomb = startXBo;
        posYBomb = startYBo;
      
    }

    void move() {

        posYBomb += speedBomb;
    }

    void draw() {

        image(bombImg, posXBomb, posYBomb, 40, 40);
    }


    void offScreen() {

        if (posYBomb > height) {

            offScreen = true;
        }
    }
    
    
    void collideBomb(Player player) {
      
        if (posXBomb + 40 > player.posX && posXBomb < player.posX + player.playerWidth && posYBomb + 40 > player.posY && posYBomb < player.posY + player.playerHeight) {
          
            colBomb = true;  
        }
    }
    
    /*
    void collideWShield(Player player) {
      
        if (posXBomb + 40 > player.posX && posXBomb < player.posX + player.playerWidth && posYBomb + 40 > player.posY && posYBomb < player.posY + player.playerHeight) {
          
            colShield = true;  
        }
    }*/
  
      boolean collidesWithShield(Shield s) {
        
        float bombLeft = posXBomb;
        float bombRight = posXBomb + 40;
        float bombTop = posYBomb;
        float bombBottom = posYBomb + 40;
        float shieldLeft = s.shposx - s.shWidth/2;
        float shieldRight = s.shposx + s.shWidth/2;
        float shieldTop = s.shposy - s.shHeight/2;
        float shieldBottom = s.shposy + s.shHeight/2;
        
        return (bombRight > shieldLeft && bombLeft < shieldRight && bombBottom > shieldTop && bombTop < shieldBottom);
    }
  
  
}
