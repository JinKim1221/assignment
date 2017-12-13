color lightblue = #67D4FF;
color darkblue = #2F6A96;
color orange = #EE7036;

int timer = 0;

ArrayList<GameObject> engine; //kind of category
boolean wkey, akey, skey, dkey, spacekey;
Ship myShip; //ship variable

void setup()
{
  size(800,800,FX2D);
  engine = new ArrayList<GameObject>(10000); //capacity
  rectMode(CENTER);
  noStroke();
  
  myShip = new Ship();
  engine.add(myShip);
  
  engine.add(new Launcher());
}

void draw()
{
  background(0);
  timer = timer + 1;
  int i  = engine.size()-1;
  
  while(i>=0){
    GameObject obj = engine.get(i);
    obj.show();
    obj.act();
    
    if(obj.hasDied()){
      engine.remove(i);
    }
    i--;
  }
  
  engine.add(new Star());
 // engine.add(new Enemy(width/2,height/2));
}

void keyPressed(){
  if(key == 'w' || key == 'W') wkey = true;
  if(key == 'a' || key == 'A') akey = true;
  if(key == 's' || key == 'S') skey = true;
  if(key == 'd' || key == 'D') dkey = true;
  if(key == ' ')               spacekey = true;
  
}

void keyReleased(){
  if(key == 'w' || key == 'W') wkey = false;
  if(key == 'a' || key == 'A') akey = false;
  if(key == 's' || key == 'S') skey = false;
  if(key == 'd' || key == 'D') dkey = false;
  if(key == ' ')               spacekey = false;  
}