class Star extends GameObject{ //one of category in GameObject class
  //constuctor
  Star(){
    x = random(0, width);
    y = 0;
    dx = 0;
    dy = random(3,5);
  }
  
  void show(){
    fill(255);
    rect(x,y,dy,dy);
  }
  
  void act(){
    x = x + dx;
    y = y + dy;
  }
  
  boolean hasDied(){
    return y > height;
  }

}