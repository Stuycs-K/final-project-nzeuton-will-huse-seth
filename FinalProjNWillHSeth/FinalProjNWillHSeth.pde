import processing.sound.SoundFile;

SoundFile move;
SoundFile take;
SoundFile game_end;
SoundFile check;

boolean begTurn = true;
Chess game;
int SQUARE_SIZE = 50;
color WHITE = color(236,236,214);
color BLACK = color(116,148,84);
color VALID_HIGHLIGHT = color(0, 0, 255, 100);
color SELECTED_HIGHLIGHT = color(255, 255, 0, 100);
color TAKE_HIGHLIGHT = color(255, 0, 0, 100);
boolean promotion = false;
int prox,proy,x,y;
boolean pressing = false;
Piece moving = null;

void setup(){
  size(500,500);
  background(150);
  game = new Chess();
  drawSquares(SQUARE_SIZE, WHITE, BLACK);
  begTurn = true;
  
  move = new SoundFile(this, "assets/sounds/move.mp3");
  take = new SoundFile(this, "assets/sounds/capture.mp3");
  game_end = new SoundFile(this,"assets/sounds/game_end.mp3");
  check = new SoundFile(this,"assets/sounds/move-check.mp3");
}
void mouseDragged(){
  if(!pressing){
    pressing = true;
  mouseClicked();
  }
}
void mouseReleased(){
  if(pressing){
    
  mouseClicked();
  pressing = false;
  moving = null;
  }
}
void draw(){
  if(pressing && moving != null && game.getPiece(x,y) != null && (game.getPiece(x,y).getTeam() == game.playerOneTurn())){
    displayEv();
    
    ArrayList<int[]> validPos = game.getPiece(x,y).getValidPositions();
        for(int[] pos : validPos){
          fill(VALID_HIGHLIGHT);
          if(game.getPiece(pos[0], pos[1]) != null && game.getPiece(pos[0], pos[1]).getTeam() != game.playerOneTurn()){
            fill(TAKE_HIGHLIGHT);  
          }
          square(SQUARE_SIZE+pos[0]*SQUARE_SIZE,SQUARE_SIZE+pos[1]*SQUARE_SIZE,SQUARE_SIZE);
        }
        fill(SELECTED_HIGHLIGHT);
        square(SQUARE_SIZE*x+SQUARE_SIZE,SQUARE_SIZE*y+SQUARE_SIZE,SQUARE_SIZE);
    
    if(game.playerOneTurn()){
      image(moving.getImage(true),mouseX-20,mouseY-20,50,50);
    }
    else{
      image(moving.getImage(false),mouseX-20,mouseY-20,50,50);
    }
  }
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
    textSize(12);
    text(8-i+"",53,62+50*i);
    if(i%2 == 0){
        fill(white);
      }
      else{
        fill(black);
      }
    text(Character.toString( (char) i+97),i*50+93,447);
    textSize(12);
  }
}
  void displayOptions(){
    if(game.playerOneTurn()){
      //black's promotion
      image(loadImage("assets/images/Chess_qdt60.png"),0,50,50,50);
      image(loadImage("assets/images/Chess_bdt60.png"),0,100,50,50);
      image(loadImage("assets/images/Chess_rdt60.png"),0,150,50,50);
      image(loadImage("assets/images/Chess_ndt60.png"),0,200,50,50);
    }
    else{
      image(loadImage("assets/images/Chess_qlt60.png"),0,50,50,50);
      image(loadImage("assets/images/Chess_blt60.png"),0,100,50,50);
      image(loadImage("assets/images/Chess_rlt60.png"),0,150,50,50);
      image(loadImage("assets/images/Chess_nlt60.png"),0,200,50,50);
    }

 }
  
  void displayEv(){
     background(150);
  fill(255, 255, 255);
  if(game.playerOneTurn()) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  drawSquares(SQUARE_SIZE, WHITE, BLACK);
  for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
        if(game.getPiece(j,i) != null){
          Piece p = game.getPiece(j,i);
          displayPiece(p);
        }
      }
    }
    fill(0,0,0);
  rect(0,0,100, SQUARE_SIZE);
  fill(255, 255, 255);
  if((game.playerOneTurn() && !promotion) || (!game.playerOneTurn() && promotion)) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  
  text(game.inCheck(true) ? "white in check" : "white not in check", 0, 30);
  text(game.inCheck(false) ? "black in check" : "black not in check", 0, 40);
  
  if(promotion){
    displayOptions();
  }
  
  ArrayList<Piece> whiteCapt = game.getWhiteCapt();
  
  for(int i = 0; i < whiteCapt.size(); i++){
    image(whiteCapt.get(i).getImage(false),i*25+100,470,25,25);
  }
  
  ArrayList<Piece> blackCapt = game.getBlackCapt();
  
  for(int i = 0; i < blackCapt.size(); i++){
    image(blackCapt.get(i).getImage(true),i*25+100,10,25,25);
  }
  }
void mouseClicked(){
  if(promotion){
    
  int mX = mouseX/50;
  int mY = mouseY/50;
  if(mX == 0 && mY == 1){
    game.getPiece(prox,proy).promotion(prox,proy,"Queen");
    promotion = false;
  }
  if(mX == 0 && mY == 2){
    game.getPiece(prox,proy).promotion(prox,proy,"Bishop");
    promotion = false;
  }
  if(mX == 0 && mY == 3){
    game.getPiece(prox,proy).promotion(prox,proy,"Rook");
    promotion = false;
  }
  if(mX == 0 && mY == 4){
    game.getPiece(prox,proy).promotion(prox,proy,"Knight");
    promotion = false;
  }
 
   displayEv();

  }
  else{
    background(150);
  fill(255, 255, 255);
  if(game.playerOneTurn()) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  drawSquares(SQUARE_SIZE, WHITE, BLACK);

  if(!game.isDone()){
     x = (mouseX-SQUARE_SIZE)/SQUARE_SIZE;
     y = (mouseY-SQUARE_SIZE)/SQUARE_SIZE;
    if(begTurn && x >=0 && x < 8 && y >= 0 && y < 8){
      if(game.turnBeg(x,y)){
        begTurn = false;
        moving = game.getMoving();
        ArrayList<int[]> validPos = game.getPiece(x,y).getValidPositions();
        for(int[] pos : validPos){
          fill(VALID_HIGHLIGHT);
          if(game.getPiece(pos[0], pos[1]) != null && game.getPiece(pos[0], pos[1]).getTeam() != game.playerOneTurn()){
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
        if(game.getPiece(x, y) != null && game.getPiece(x,y).getType().equals("Pawn") && ((y == 0) || (y == 7))){
       //game.getPiece(x,y).promotion(x,y,"Queen"); 
       prox = x;
       proy = y;
       promotion = true;
       displayOptions();
      }
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
  rect(0,0,100, SQUARE_SIZE);
  fill(255, 255, 255);
  if((game.playerOneTurn() && !promotion) || (!game.playerOneTurn() && promotion)) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  
  text(game.inCheck(true) ? "white in check" : "white not in check", 0, 30);
  text(game.inCheck(false) ? "black in check" : "black not in check", 0, 40);
  
  ArrayList<Piece> whiteCapt = game.getWhiteCapt();
  
  for(int i = 0; i < whiteCapt.size(); i++){
    image(whiteCapt.get(i).getImage(false),i*25+100,470,25,25);
  }
  
  ArrayList<Piece> blackCapt = game.getBlackCapt();
  
  for(int i = 0; i < blackCapt.size(); i++){
    image(blackCapt.get(i).getImage(true),i*25+100,10,25,25);
  }
     
  }
}

void done(){
  game_end.play();
  fill(255,255,255);
    rect(100,100,300,200);
    fill(0,0,0);
    textSize(50);
    if(game.inMate(!game.playerOneTurn()) == 1) text("Stalemate",130,150);
    else if(game.playerOneTurn()) text("White Wins!",130,150);
    else text("Black Wins!",130,150);
    textSize(30);
    text("Press any key",170,200);
    text("to restart.",180,250);
    textSize(12);
    
    fill(0,0,0);
  rect(0,0,100, SQUARE_SIZE);
  fill(255, 255, 255);
  if((game.playerOneTurn() && !promotion) || (!game.playerOneTurn() && promotion)) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  
  text(game.inCheck(true) ? "white in check" : "white not in check", 0, 30);
  text(game.inCheck(false) ? "black in check" : "black not in check", 0, 40);
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
    /*
    fill(0,0,0);
  square(0,0,SQUARE_SIZE);
  fill(255, 255, 255);
  text("white turn", 0, 20);
  
  fill(0,0,0);
  rect(0,0,100, SQUARE_SIZE);
  fill(255, 255, 255);
  if((game.playerOneTurn() && !promotion) || (!game.playerOneTurn() && promotion)) text("white turn", 0, 20);
  else text("black turn", 0, 20);
  
  text(game.inCheck(true) ? "white in check" : "white not in check", 0, 30);
  text(game.inCheck(false) ? "black in check" : "black not in check", 0, 40);
  */
  displayEv();
  }
  if(key == 'c'){
    game = new Chess(0);
  }
  if(key == 'e'){
    game = new Chess(1);
  }
  if(key == 't'){
    game = new Chess(2);
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
  fill(255, 0, 0);
  //text(p.getSpecial() + "", x, y + 20);
}
