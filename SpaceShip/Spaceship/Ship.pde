class Ship extends GameObject{
  int w = 80;
  Ship(){ //constructor
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
    
  }
  
  void show(){
    fill(darkblue);
    noStroke();
    ellipse(x, y, w, w/3);
    ellipse(x, y-w/8, w/3, w/3);
    float diam = w * 0.125;
    for (float windowX = x-diam*2; windowX <= x+diam*2; windowX += diam*2) {
    fill(255);
    ellipse(windowX, y, diam, diam);
  }
    
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