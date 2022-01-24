class Targets{
  
  PFont f;
  
  PImage target;
  PVector position;
  int targetsHit = 0;
  int targetsRemain = 30;
  
  Targets(){
    imageMode(CENTER);
    target = loadImage("data/target.png");
    position = new PVector(random(190, width - target.width), random(120 + target.height, 480 - target.height));
    
  }
  
  void display() {
    f = createFont("Times New Roman", 16, true);
    image(target, position.x, position.y);
    textFont(f, 20);
    fill(0);
    text(targetsRemain, 1050,65);
  
  }

  void changePosition() {
    position = new PVector(random(100, width - target.width), random(100, 608 -target.height));
    targetsHit++;
  }


  boolean targetCollision(Ball shot) {
    
    int ballRadius = shot.ballImage.width/2; 
    int targetRadius = target.width/2;
    
    
    if (dist(shot.position.x, shot.position.y, position.x, position.y) < ballRadius + targetRadius) {
      changePosition();
      targetsRemain--;
      return true;
    }
    return false;
  }
}
  
  
