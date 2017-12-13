class Enemy extends GameObject{

  Enemy(float incomingX, float incomingY){
    x = incomingX;
    y = incomingY;
    dx = 0;
    dy = 3;
    hp = 10;
  }
  
  void show(){
    fill(orange);
    rect(x,y,50,50);
  }
  
  void act(){
    x = x + dx;
    y = y + dy;
    
    int i = 0 ;
    while (i < engine.size()){
      GameObject thing = engine.get(i);
      if(thing instanceof Bullet){
        if(rectRect(x, y, 50, 50, thing.x, thing.y, 5, 5)){
          hp = hp-1;
          thing.hp = 0;
          for(int j = 0; j < 5; j++){
            engine.add(new Particle(thing.x, thing.y));
          }
        }
      }
      i++;
    }
  }
  
  boolean hasDied(){
    return y > height || hp <= 0;
  }
}