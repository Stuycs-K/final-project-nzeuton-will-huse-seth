boolean begTurn = true;
Chess game;

void setup(){
  size(500,500);
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
  if(!game.isDone()){
    int x = (mouseX-50)/50;
    int y = (mouseY-50)/50;
    if(begTurn){
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
          displayPiece(j,i,p.getTeam(),p.getType());
        }
      }
    }
  }
}

void displayPiece(int xP, int yP, boolean team, String type){
  int x = xP*50+50;
  int y = yP*50+50;
  if(team){
    fill(255,255,255);
    text(type,x,y);
  }
  else{
    fill(0,0,0);
    text(type,x,y);
  }
}
