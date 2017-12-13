class Launcher extends GameObject{
  
  
  Launcher(){
    x = width/2;
    y = -100;
    dx = 0;
    dy = 0;
  }
  
  void show(){
    fill(100);
    ellipse(x,y,100,100);
  }
  
  void act(){
    if(frameCount < 100){
      //do nothing
    } else if(frameCount<600){
      straightLine(100); //attack a player with one line
    } else if(frameCount<1100){
      straightLine(400); //attack a player with one line
    } else if(frameCount<15000){
      randomWave();
    }
    
  }
  
  void straightLine(float incomingX){
    x = incomingX;
    if(frameCount % 100 == 0){//moudulus
      engine.add(new Enemy(x,y));
    }
  }
  
  void randomWave(){
    x = random(50, width-50);
    if(frameCount % 50 == 0){
      engine.add(new Enemy(x,y));
    }
  }
  
  boolean hasDied(){
    return false;
  }
    
}