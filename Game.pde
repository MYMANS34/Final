class Game{
  
  PFont f;
  
  ArrayList<Ball> ammo = new ArrayList<Ball>();
  
  PImage scene, base, cannon, ballImage, tarImage;
  
  Targets targ = new Targets();
  float elevation = 0;
  float power = 10;
  boolean end = false;
  int ammoRemain = 30;
 
  
  
  Game(){
    imageMode(CENTER);
    loadImages();
  }
  
  void play(){
    
   image(scene,width/2, height/2);
   displayStats();
   targ.display();
   
   //this will cause the end of the game
   if ((ammoRemain == 0) || (noAmmo() && (ammo.get(ammo.size()).miss() || ammo.get(ammo.size() - 1).contact))) {
      end = true;
      reportScreen();
    }
   
   for(int i = 0; i < ammo.size(); i++){
     Ball b = ammo.get(i);
     b.move();
     b.display();
     b.smoke();
       if(b.smokeDone){// Once the smoke disapates remove the ball
        ammo.remove(i);
        i--;
       }
      b.explosion(ammo, i, targ);
   }
  
   
    displayArtillery();
  }
  
  void formAmmo(){
    if(!noAmmo()){
    ammo.add(new Ball(new PVector(power * cos(radians(elevation * -1)), power * sin(radians(elevation * -1)))));
    ammoRemain--;
  }
}
  
  void displayArtillery(){
    pushMatrix();
    translate(90,580);
    rotate(radians(elevation * -1));
    image(cannon,0,0);
    popMatrix();
    image(base, 93, 580);
    
  }
  
  void displayStats(){
    f = createFont("Times New Roman", 16, true);
    textFont(f, 20);
    fill(0);
    text(ammoRemain,530,65);
    text(power, 30, 65);
    image(ballImage,500,60);
    image(tarImage,1020,60);
  }
  
  boolean noAmmo() {
    if (ammoRemain == 0) {
      return true;
    }  
    return false;
  }
  
  void elevate(Boolean increase){
    if(increase && elevation < 90) {
      elevation += 3;
    }
    else if (increase == false && elevation > 0){
      elevation -= 3;
    }
    
  }

void changePower(boolean positive) {
    if (positive && power < 20 && !end) {
      power++;
    } else if (!positive && power > 10 && !end) {
      power--;
    }
  }
  
  void reportScreen() {
    char rank = ' ';
    String message = "";
    int score = 30 - targ.targetsRemain;
    
    if (score < 6) {
      rank = 'F';
      message = "What";
    } else if (score >= 6 && score < 12) {
      rank = 'D';
      message = "Alright";
    } else if (score >= 12 && score < 18) {
      rank = 'C';
      message = "OK, OK!";
    } else if (score >= 24 && score < 30) {
      rank = 'B';
      message = "There We Go!";
    } else if (score >= 30) {
      rank = 'A';
      message = "LETS GOOOO!!";
    }
    
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(60);
    text(message, width/2, 140);
    textSize(25);
    text("Accuracy: " + score + "/30  " + (int((float)score/30*100)) + "%", width/2, 260); 
    text("Rank: " + rank, width/2, 320);
    textSize(15);
    text("Press ENTER to play again", width/2, 380);
  }

  
  void loadImages(){
    scene = loadImage("data/background.png");
    cannon = loadImage("data/cannonbarrel.png");
    base = loadImage("data/base.png");
    ballImage = loadImage("data/Ball.png");
    tarImage = loadImage("data/target.png");
  }
  
  
}
  

  
  
