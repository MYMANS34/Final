class Ball{
  
  PVector position, speed, acceleration;
  PImage ballImage;
  PImage[] explosion = new PImage[6];
  
  int count = 0;
  
  boolean contact = false;
  boolean smokeDone = false;
  
  ArrayList<Smoke> smoke = new ArrayList<Smoke>();
  
  int smokeSize = 100;
  
  Ball(PVector w){
    
    position = new PVector(90, 580);
    speed = w;
    acceleration = new PVector(0,0.2);
    loadImages();
    ballImage = loadImage("data/Ball.png");
  }
  
  void move(){
   if (!contact && !miss()) {
    position = position.add(speed);
    speed = speed.add(acceleration);
    
  }
  }
  
  void display(){
    
    pushMatrix();
    translate(position.x, position.y);
    image(ballImage, 0,0);
    popMatrix();
    
  }
  


void explosion(ArrayList<Ball> b, int index, Targets target) {
   
    if (index != -1 && (target.targetCollision(b.get(index)) || contact == true)) {
      contact = true;
      image(explosion[count], position.x, position.y);
      count++;
      
      if (count > 5) {
      b.remove(index); 
      }
    }
  }
  
boolean miss() {
    if (position.y >= 600) {
      return true;
    }
    return false;
  }
  
void smoke() {
    if (miss()) {
      if (smokeSize > 0) {
        smoke.add(new Smoke(new PVector(position.x, position.y)));
        smokeSize --;
      }
      
      if (smoke.size() == 0) {
        smokeDone = true;
      }
      for (int i = 0; i < smoke.size(); i++) {
        Smoke s = smoke.get(i);
        s.display();
        s.move();
        s.time();
        if (s.dead == true) {
          smoke.remove(i);
          i--;
        }
      }
    }
  }
  
void loadImages(){
 for (int i = 1; i < 7; i++) {
      explosion[i - 1] = loadImage("data/ex" + i + ".png");
    }
}
}
  
  
  
