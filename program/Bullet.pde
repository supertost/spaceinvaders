public class Bullet {

    int x, y;
    
    int bulletWidth = 10;
    int bulletHeight = 20;
    int speed;

    

    Bullet(int startX, int startY) {

        x = startX;
        y = startY;
    }
    
    void speed() {
      
        speed = 10;
      
    }

    void update() {
        
        y -= speed;
    }

    void draw() {

        fill(255, 0, 0);  
        noStroke();
        rectMode(CENTER);
        rect(x, y, bulletWidth, bulletHeight);
    }

    boolean offScreen() {

        return y < 0;
    }
    
    void speedIncrease() {
      
         speed = 20; 
    }
}
