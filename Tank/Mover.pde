class Mover{
  
 
  PVector location;
  PVector location2;
  PVector velocity;
  PVector acceleration;
  PVector velocity2;
  PVector acceleration2;
  PVector mouse;
  
  float topspeed1;
  float topspeed2;
  
  float lx;
  float ly;
  float angle;
  float angle2;
  float angle3;
  float bsx=-100;
  float bsy=-100;
  float r;
  
  float px;
  float py;
  float tpx;
  float tpy;
  
  float directx;
  float directy;
  
  float ranx=0;
  float rany=0;
  
  boolean target = false;
  boolean bu = false;
  boolean ta = false;
  float distant;
  float distant2;
  
  
 float plotx1;
 float ploty1;
 float plotx2;
 float ploty2;
 float mapx;
 float mapy;
  
  Mover(){
    location = new PVector(width/2, height/2);
    location2 = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    velocity2 = new PVector(0, 0);
    mouse = new PVector(width/2, height/2);
    topspeed1 = 1.5;
    topspeed2 = 5;
    lx = -100;
    ly = -100;
    
    plotx1 = 20;
    ploty1 = 580;
    plotx2 = 220;
    ploty2 = height -20; 
    
  }
     
  void targetPoint(){
   
    if(mousePressed ==true){ 
      mouse.x = mouseX;
      mouse.y = mouseY;
     lx = mouse.x;
     ly = mouse.y;
     
    }
  }
    
  void targetdiplay(){   
       strokeWeight(2);
       stroke(255, 0, 0);    
       line(lx-7, ly, lx+7, ly);
       line(lx, ly-7, lx, ly+7);
      
  }
  
  void update(){     
    PVector dir = PVector.sub(mouse, location);
    distant = dir.mag();
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    angle3 = atan2(dir.x, dir.y);
    velocity.add(acceleration);
    velocity.limit(topspeed1);
    
    if(distant<5){                    
      ta = true;      
      directx = velocity.x;
      directy = velocity.y;
      
      tpx = location.x;
      tpy = location.y;
      
      angle = atan2(velocity.y , velocity.x);
      angle2 = atan2(velocity.y , velocity.x);
      velocity.mult(0);  
      
      
       pushMatrix();
      translate(tpx, tpy); 
       rotate(angle);
        rectMode(CENTER);
        noStroke();
        fill(175);
        rect(0, 15, 35, 10);
        rect(0, -15, 35, 10);
        fill(0, 255, 0);
        rect(0, 0, 40, 30);
        fill(125);
        rect(20, 0, 30, 8);
        fill(175);
        rect(0, 0, 15, 15);  
     popMatrix();      
     
     text("velocity x of tank =  "+ velocity.x, 500, 20);
     text("velocity y of tank =  "+ velocity.y, 500, 35);
     text("value of angle =  "+ angle, 500, 50);
      
    }  else{
        
      pushMatrix();
      translate(location.x, location.y); 
       rotate(angle);
        rectMode(CENTER);
        noStroke();
        fill(175);
        rect(0, 15, 35, 10);
        rect(0, -15, 35, 10);
        fill(0, 255, 0);
        rect(0, 0, 40, 30);
        fill(125);
        rect(20, 0, 30, 8);
        fill(175);
        rect(0, 0, 15, 15);  
     popMatrix();
     
     text("velocity x of tank =  "+ velocity.x, 500, 20);
     text("velocity y of tank =  "+ velocity.y, 500, 35);
     text("value of angle =  "+ angle, 500, 50);
     
    }
    
    location.add(velocity);          
    angle = atan2(velocity.y , velocity.x);        
  
  }
                  
           
  void tankdisplay(){
     text("coordinate x of tank =  "+int(location.x), 250, 20);
     text("coordinate y of tank =  "+int(location.y), 250, 35);
  }
    
 
 void bulletdisplay(){
            
    if (keyPressed){
      
      bu = true;
     
      if(ranx < 0 || ranx >width || rany <0 || rany >height ){
      bsx = location.x;
      bsy = location.y;
      angle2 = angle;
      r=0;
      }
     
    }
    
   if(bu){
     
     
     fill(0);  
     textFont(font);
     textSize(12);
      
     distant = dist(bsx, bsy, width/2, height/2);
     ranx = bsx + px;
     rany =bsy + py;
     text("coordinate x of bullet =  "+int(ranx), 20, 20);   
     text("coordinate y of bullet=  "+int(rany), 20, 35);
 
       px = r*cos(angle2);
       py = r*sin(angle2);
       r += 3;       
       fill(255, 0, 0);
       ellipse(bsx + px, bsy + py, 6, 6);    
     }           
     
   }           
   void mapdisplay(){
   
   fill(0, 0, 255, 20);
 
   rectMode(CORNERS);
   rect(plotx1, ploty1, plotx2, ploty2);
   
   mapx = map(location.x, 0, width, plotx1, plotx2);
   mapy = map(location.y, 0 , height, ploty1, ploty2);
   noStroke();
   fill(0, 255, 0);
   ellipse(mapx, mapy, 7, 7);
 }
       
}
    
      