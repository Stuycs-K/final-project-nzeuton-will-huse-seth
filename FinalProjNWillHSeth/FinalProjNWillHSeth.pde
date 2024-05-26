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
        fill(0,255,0);
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
  if(game.playerOneTurn()) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if((i+j)%2 == 0){
        fill(255,255,255);
      }
      else{
        fill(0,255,0);
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
        ArrayList<int[]> validPos = game.getPiece(x,y).getValidPositions();
        for(int[] pos : validPos){
          fill(0,0,255);
          square(50+pos[0]*50,50+pos[1]*50,50);
        }
        fill(255,127,0);
        square(50*x+50,50*y+50,50);
      }
    }
    else{
      if(game.turnEnd(x,y)){
        begTurn = true;
      }
      begTurn = true;
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
  fill(0,0,0);
  square(0,0,50);
  fill(255, 255, 255);
  if(game.playerOneTurn()) text("white turn", 0, 20);
  else text("black turn", 0, 20);
}

void displayPiece(Piece p){
  /*
  String type = p.getType();
  String team;
  if(p.getTeam()){
    team = "white";
  }
  else{
    team = "black";
  }
  */
  int xP = p.getX();
  int yP = p.getY();
  
  int x = xP*50+50;
  int y = yP*50+50; 
  /*
  if(team.equals("white")){
    fill(0,255,0);
  }
  else{
    fill(color(255, 0, 0));
  }
  text(type,x + 5,y + 10);
  text(xP + " " + yP, x + 10, y + 20);
  text(team + "", x + 10, y + 30);
  text(xP + " " + yP, x + 10, y + 40);
  */
  if(p.getTeam()){
    if(p.getType().equals("Bishop")){
      PImage piece = loadImage("Chess_blt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("King")){
      PImage piece = loadImage("Chess_klt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Knight")){
      PImage piece = loadImage("Chess_nlt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Pawn")){
      PImage piece = loadImage("Chess_plt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Queen")){
      PImage piece = loadImage("Chess_qlt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Rook")){
      PImage piece = loadImage("Chess_rlt60.png");
      image(piece,x,y,50,50);
    }
  }
  else{
    if(p.getType().equals("Bishop")){
      PImage piece = loadImage("Chess_bdt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("King")){
      PImage piece = loadImage("Chess_kdt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Knight")){
      PImage piece = loadImage("Chess_ndt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Pawn")){
      PImage piece = loadImage("Chess_pdt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Queen")){
      PImage piece = loadImage("Chess_qdt60.png");
      image(piece,x,y,50,50);
    }
    if(p.getType().equals("Rook")){
      PImage piece = loadImage("Chess_rdt60.png");
      image(piece,x,y,50,50);
    }
  }
  
  
}
