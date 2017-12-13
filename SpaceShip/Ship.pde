class Ship extends GameObject{

  Ship(){ //constructor
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
  }
  
  void show(){
    fill(darkblue);
    rect(x,y,50,50);
    
  }
  
  void act(){
    dx = 0;
    dy = 0;
    
    if(wkey) dy = -5;
    if(akey) dx = -5;
    if(skey) dy = 5;
    if(dkey) dx = 5;
    if(spacekey) engine.add(new Bullet());
    
    x = x + dx;
    y = y + dy;
  }
 
  boolean hasDied(){
    return false;
  }
}