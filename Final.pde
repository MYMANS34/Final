
Game setGame;

void setup(){
  size(1080, 608);
  setGame = new Game();
  
}

void draw(){
  setGame.play();
  input();
}

void keyPressed(){
  if(key == ' '){
    setGame.formAmmo();
  }
 
}

void input(){
  if(keyPressed){
    if(keyCode == UP){
      setGame.changePower(true);
    }
    if(keyCode == DOWN){
      setGame.changePower(false);
    }
    if(keyCode == LEFT){
      setGame.elevate(true);
    }
    if(keyCode == RIGHT){
      setGame.elevate(false);
    }
    if (keyCode == ENTER) {
    if (setGame.end) {
      setGame = new Game();
    }
  }
  
}
}
