class Smoke {
  PVector position, speed;
  int size, lifeSpan, life, countDown;
  boolean dead = false;
  color c = (int(random(100, 170)));


  Smoke(PVector xy) {
    shapeMode(CENTER);
    position = new PVector(random(xy.x - 20, xy.x + 20), xy.y);
    speed = new PVector(random(-0.25, 0.25), -1);
    size = int(random(20, 25));
    lifeSpan = int(random(110, 160));
    life = lifeSpan; 
    countDown = int(random(0, 40)); 
  }

  void display() {
    if (countDown == 0) {
      pushMatrix();
      translate(position.x, position.y);
      scale(map(lifeSpan, life, 0, 1, 0)); 
      noStroke();
      fill(0,0,c);
      circle(0, 0, size);
      popMatrix();
    } else {
      countDown --;
    }
  }

  void move() {    
    if (countDown == 0) {
      position.add(speed);
      lifeSpan --;
    }
  }

  void time() {
    if (lifeSpan <= 0) {
      dead = true;
    }
  }
}
