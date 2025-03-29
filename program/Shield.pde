public class Shield {
  
    int shposx;
    int shposy;
    
    int shWidth = 150;
    int shHeight = 50;
    
    int lives = 3;

    Shield (int xpos, int ypos) {
      
        shposx = xpos;
        shposy = ypos;
    }

    void draw() {
      
        rectMode(CENTER);
        
        if (lives == 3) {
          
            fill(0, 255, 0); 
        }
        
        else if (lives == 2) {
          
            fill(0, 150, 0); 
        }
        
        else if (lives == 1) {
          
            fill(0, 50, 0); 
        }
        
        else {
          
            fill(50);
        }
        
        rect(shposx, shposy, shWidth, shHeight);
        noStroke();
    }
    
    // Check collision between shield and any bullets
    void checkBulletCollision(ArrayList<Bullet> bullets) {
      
        for (int i = bullets.size() - 1; i >= 0; i--) {
          
            Bullet bullet = bullets.get(i);
            
            float bulletLeft = bullet.x - bullet.bulletWidth/2;
            float bulletRight = bullet.x + bullet.bulletWidth/2;
            float bulletTop = bullet.y - bullet.bulletHeight/2;
            float bulletBottom = bullet.y + bullet.bulletHeight/2;
            
            float shieldLeft = shposx - shWidth/2;
            float shieldRight = shposx + shWidth/2;
            float shieldTop = shposy - shHeight/2;
            float shieldBottom = shposy + shHeight/2;
            
            if (bulletRight > shieldLeft && bulletLeft < shieldRight && bulletBottom > shieldTop && bulletTop < shieldBottom) {
              
                lives--;
                bullets.remove(i);
            }
        }
    }
}
