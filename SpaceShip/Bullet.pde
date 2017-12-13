class Bullet extends GameObject{
  
  Bullet(){
    x = myShip.x;
    y = myShip.y;
    dx = 0;
    dy = -15;
    hp = 1;    
  }
  
  void show(){
    fill(lightblue);
    rect(x,y,5,5);
  }
  
  void act(){
    x = x + dx;
    y = y + dy;
    
  }
  
  boolean hasDied(){
    return y < 0 || hp <= 0;
  }
}