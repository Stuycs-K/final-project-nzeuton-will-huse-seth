boolean begTurn = true;
Chess game;
int SQUARE_SIZE = 10;
color WHITE = color(236,236,214);
color BLACK = color(116,148,84);
color VALID_HIGHLIGHT = color(0, 0, 255, 100);
color SELECTED_HIGHLIGHT = color(255, 255, 0, 100);
color TAKE_HIGHLIGHT = color(255, 0, 0, 100);
void setup(){
  size(500,500);
  background(150);
  game = new Chess();
  drawSquares(SQUARE_SIZE, WHITE, BLACK);
  begTurn = true;
}

void draw(){

}
void drawSquares(int size, color white, color black){
  noStroke();
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if((i+j)%2 == 0){
        fill(white);
      }
      else{
        fill(black);
      }
      square(size+i*size,size+j*size,size);
    }
  }
}
  
void mouseClicked(){
  background(150);
  fill(255, 255, 255);
  if(game.playerOneTurn()) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  drawSquares(SQUARE_SIZE, WHITE, BLACK);
  if(!game.isDone()){
    int x = (mouseX-SQUARE_SIZE)/SQUARE_SIZE;
    int y = (mouseY-SQUARE_SIZE)/SQUARE_SIZE;
    if(begTurn && x >=0 && x < 8 && y >= 0 && y < 8){
      if(game.turnBeg(x,y)){
        begTurn = false;
        ArrayList<int[]> validPos = game.getPiece(x,y).getValidPositions();
        for(int[] pos : validPos){
          fill(VALID_HIGHLIGHT);
          if(game.getPiece(pos[0], pos[1]) != null){
            fill(TAKE_HIGHLIGHT);  
          }
          square(SQUARE_SIZE+pos[0]*SQUARE_SIZE,SQUARE_SIZE+pos[1]*SQUARE_SIZE,SQUARE_SIZE);
        }
        fill(SELECTED_HIGHLIGHT);
        square(SQUARE_SIZE*x+SQUARE_SIZE,SQUARE_SIZE*y+SQUARE_SIZE,SQUARE_SIZE);
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
    if(game.isDone()){
        done();
      }
  }
  else{
    done();
  }
  fill(0,0,0);
  square(0,0,SQUARE_SIZE);
  fill(255, 255, 255);
  if(game.playerOneTurn()) text("white turn", 0, 20);
  else text("black turn", 0, 20);
}

void done(){
  fill(255,255,255);
    rect(100,100,300,200);
    fill(0,0,0);
    textSize(50);
    if(game.playerOneTurn()) text("White Wins!",130,150);
    else text("Black Wins!",130,150);
    textSize(30);
    text("Press any key",170,200);
    text("to restart.",180,250);
    textSize(12);
}

void keyPressed(){
  if(game != null && game.isDone()){
    game = new Chess();
    drawSquares(SQUARE_SIZE, WHITE, BLACK);
  begTurn = true;
  for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        if(game.getPiece(j,i) != null){
          Piece p = game.getPiece(j,i);
          displayPiece(p);
        }
      }
    }
    fill(0,0,0);
  square(0,0,SQUARE_SIZE);
  fill(255, 255, 255);
  text("white turn", 0, 20);
  }
  
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
  
  int x = xP*SQUARE_SIZE+SQUARE_SIZE;
  int y = yP*SQUARE_SIZE+SQUARE_SIZE; 
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
  image(p.getImage(p.getTeam()), x, y, SQUARE_SIZE, SQUARE_SIZE);
  
}
