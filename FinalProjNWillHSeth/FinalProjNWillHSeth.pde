boolean begTurn = true;
Chess game;

void setup(){
  size(500,500);
  background(150);
  game = new Chess();
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if((i+j)%2 == 0){
        fill(255,255,255);
      }
      else{
        fill(0,0,0);
      }
      square(50+i*50,50+j*50,50);
    }
  }
  begTurn = true;
}

void draw(){

}

void mouseClicked(){
  background(150);
  fill(255, 255, 255);
  text(game.playerOneTurn() + "", 0, 20);
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if((i+j)%2 == 0){
        fill(255,255,255);
      }
      else{
        fill(0,0,0);
      }
      square(50+i*50,50+j*50,50);
    }
  }
  if(!game.isDone()){
    int x = (mouseX-50)/50;
    int y = (mouseY-50)/50;
    if(begTurn && x >=0 && x < 8 && y >= 0 && y < 8){
      if(game.turnBeg(x,y)){
        begTurn = false;
      }
    }
    else{
      if(game.turnEnd(x,y)){
        begTurn = true;
      }
    }
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        if(game.getPiece(j,i) != null){
          Piece p = game.getPiece(j,i);
          displayPiece(p);
        }
      }
    }
  }
  fill(255, 255, 255);
  text(game.playerOneTurn() + "", 0, 20);
}

void displayPiece(Piece p){
  String type = p.getType();
  boolean team = p.getTeam();
  int xP = p.getX();
  int yP = p.getY();
  
  int x = xP*50+50;
  int y = yP*50+50; 
  
  if(team){
    fill(0,255,0);
  }
  else{
    fill(color(255, 0, 0));
  }
  text(type,x + 5,y + 10);
  text(xP + " " + yP, x + 10, y + 20);
  text(team + "", x + 10, y + 30);
  text(xP + " " + yP, x + 10, y + 40);
  
  
}
