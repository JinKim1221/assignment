class Star
{
 float xpos,ypos,zpos,speed,w;
 
 Star()
 {
  xpos = random(width);
  ypos = random(height);
  zpos = random(-200,400);
  speed = random(3,5);
  w = random(3,5);
 }
 void display()
 {
  noStroke();
  fill(#ffcc33);
  pushMatrix();
  translate(xpos,ypos,zpos);
  ellipse(0,0,w,w);
  popMatrix();
 }
 
 void move()
 {
   zpos += speed;
   if(zpos > 500)
   {
     zpos = -200;
   }
 
 }
}