PFont font;
Mover mover;

int s_num = 150;
Star myStar[] = new Star[s_num];

void setup()
{
  size(800,600,P3D);
  for(int i = 0; i<s_num; i++)
  {
   myStar[i] = new Star(); 
  }
  mover = new Mover();
  smooth(8);
}

void draw()
{
  background(0);
  for(int i = 0; i<s_num; i++)
  {
    myStar[i].display();
    myStar[i].move();
  }
  tankDraw();
}



void tankDraw(){
  mover.targetPoint();
  mover.targetdiplay();
  mover.tankdisplay();
  mover.bulletdisplay();
  mover.update();
  stroke(255, 0, 0);
  mover.mapdisplay();
}