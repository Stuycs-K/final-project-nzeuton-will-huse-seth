
class Chess{
  private Piece[][] board;
  private boolean playerOneTurn;
  private Piece initial;
  private boolean done;
  private ArrayList<Piece> whiteCapt = new ArrayList<Piece>();
  private ArrayList<Piece> blackCapt = new ArrayList<Piece>();

  public Chess(){
    board = new Piece[8][8];
    for(int i = 0; i < 8; i++){
      board[1][i] = new Pawn(i,1,false,this);
      board[6][i] = new Pawn(i,6,true,this);
    }
    board[0][0] = new Rook(0,0,false,this);
    board[7][0] = new Rook(0,7,true,this);
    board[0][1] = new Knight(1,0,false,this);
    board[7][1] = new Knight(1,7,true,this);
    board[0][2] = new Bishop(2,0,false,this);
    board[7][2] = new Bishop(2,7,true,this);
    board[0][3] = new Queen(3,0,false,this);
    board[7][3] = new Queen(3,7,true,this);
    board[0][4] = new King(4,0,false,this);
    board[7][4] = new King(4,7,true,this);
    board[0][5] = new Bishop(5,0,false,this);
    board[7][5] = new Bishop(5,7,true,this);
    board[0][6] = new Knight(6,0,false,this);
    board[7][6] = new Knight(6,7,true,this);
    board[0][7] = new Rook(7,0,false,this);
    board[7][7] = new Rook(7,7,true,this);
    playerOneTurn = true;
    done = false;
  }
  
  public Chess(int n){
    if(n == 0){
      board = new Piece[8][8];
      board[0][0] = new Rook(0,0,false,this);
      board[0][5] = new Rook(5,0,false, this);
      board[0][6] = new King(6,0,false,this);
      //board[5][6] = new Pawn(6, 5,false,this);
      board[1][1] = new Bishop(1,1,false,this);
      board[1][3] = new Pawn(3,1,false,this);
      board[1][4] = new Queen(4,1,false,this);
      board[1][7] = new Pawn(7,1,false,this);
      board[2][1] = new Bishop(1,2,false,this);
      board[2][3] = new Knight(3,2,true,this);
      board[2][4] = new Pawn(4,2,false,this);
      board[2][5] = new Pawn(5,2,true,this);
      board[3][2] = new Knight(2,3,false,this);
      board[3][4] = new Bishop(4,3,true,this);
      board[3][5] = new Pawn(5,3,false,this);
      board[4][7] = new Pawn(7,4,true,this);
      board[6][0] = new Pawn(0,6,true,this);
      board[6][1] = new Pawn(1,6,true,this);
      board[6][2] = new Pawn(2,6,true,this);
      board[6][4] = new Queen(4,6,true,this);
      board[6][5] = new Pawn(5,6,true,this);
      board[7][2] = new King(2,7,true,this);
      board[7][3] = new Rook(3,7,true,this);
      board[7][6] = new Rook(6,7,true,this);
      playerOneTurn = true;
      done = false;
      
    }
    if(n == 1){
      board = new Piece[8][8];
    for(int i = 0; i < 8; i++){
      board[1][i] = new Pawn(i,1,false,this);
      board[6][i] = new Pawn(i,6,true,this);
    }
    board[6][4] = null;
    board[3][4] = new Pawn(4, 3, true, this);
    board[0][0] = new Rook(0,0,false,this);
    board[7][0] = new Rook(0,7,true,this);
    board[0][1] = new Knight(1,0,false,this);
    board[7][1] = new Knight(1,7,true,this);
    board[0][2] = new Bishop(2,0,false,this);
    board[7][2] = new Bishop(2,7,true,this);
    board[0][3] = new Queen(3,0,false,this);
    board[7][3] = new Queen(3,7,true,this);
    board[0][4] = new King(4,0,false,this);
    board[7][4] = new King(4,7,true,this);
    board[0][5] = new Bishop(5,0,false,this);
    board[7][5] = new Bishop(5,7,true,this);
    board[0][6] = new Knight(6,0,false,this);
    board[7][6] = new Knight(6,7,true,this);
    board[0][7] = new Rook(7,0,false,this);
    board[7][7] = new Rook(7,7,true,this);
      playerOneTurn = false;

    }
    if(n == 2){
      board = new Piece[8][8];
      board[0][0] = new Rook(0,0,false,this);
      board[0][7] = new Rook(7,0,false, this);
      board[0][4] = new King(4,0,false,this);
      
      board[1][0] = new Pawn(0,1,false,this);
      board[1][1] = new Pawn(1,1,false,this);
      board[1][2] = new Pawn(2,1,false,this);
      board[1][4] = new Queen(4,1,false,this);
      board[1][5] = new Pawn(5,1,false,this);
      board[1][6] = new Bishop(6,1,false,this);
      board[1][7] = new Pawn(7,1,false,this);
      
      board[2][2] = new Knight(2,2,false,this);
      board[2][3] = new Pawn(3,2,false,this);
      board[2][5] = new Knight(5,2,false,this);
      board[2][6] = new Pawn(6,2,false,this);
      
      board[3][4] = new Pawn(4,3,false,this);
      
      board[4][2] = new Pawn(2,4,true,this);
      board[4][4] = new Pawn(4,4,true,this);
      board[4][6] = new Pawn(6,4,false,this);
      
      board[5][2] = new Knight(2,5,true,this);
      board[5][3] = new Pawn(3,5,true,this);
      board[5][5] = new Knight(5,5,true,this);
      
      board[6][0] = new Pawn(0,6,true,this);
      board[6][1] = new Pawn(1,6,true,this);
      board[6][2] = new Pawn(2,6,true,this);
      board[6][3] = new Bishop(3,6,true,this);
      board[6][4] = new Queen(4,6,true,this);
      board[6][5] = new Pawn(5,6,true,this);
      board[6][6] = new Pawn(6,6,true,this);
      board[6][7] = new Pawn(7,6,true,this);
      
      board[7][0] = new Rook(0,7,true,this);
      board[7][4] = new King(4,7,true,this);
      board[7][7] = new Pawn(7,7,true,this);
      playerOneTurn = true;
      //done = false;
    }
  }
  
  public Piece getPiece(int x,int y){
    return board[y][x];
  }
 
  public boolean turnBeg(int x, int y){
  if(x < 0 || x > 7 || y < 0 || y > 7){
    return false;
  }
    if(board[y][x] != null && board[y][x].getTeam() == playerOneTurn){
      initial = board[y][x];
      return true;
    }
    else{
      return false;
    }
  }
  
  public Piece removePiece(int x,int y){
    Piece ret = board[y][x];
    board[y][x] = null;
    return ret;
    }
    
    public void setPiece(int x, int y, Piece s){
      board[y][x] = s;
    }
  
  public ArrayList<Piece> getWhiteCapt(){
    return whiteCapt;
  }
  public ArrayList<Piece> getBlackCapt(){
    return blackCapt;
  }
  
  public boolean turnEnd(int x, int y){
    boolean doneN = false;
    boolean r = false;
    Piece p = null;
    if(initial.isValidPosition(x,y)){
      p = initial.move(x,y);
      r = true;
      /*
      if(board[y][x].getType().equals("Pawn") && (y == 0) || (y == 7)){
       board[y][x].promotion(x,y,"Queen"); 
      }
      */
    } else{
      System.out.println("Position: " + ((char)(x+97)) +  (8-y) + " is not valid for " + initial.getType() + " at " + ((char)(97+initial.getX())) + (8-initial.getY()));
    }
    if(p != null){
      if(playerOneTurn){
        whiteCapt.add(p);
      }else{
        blackCapt.add(p);
      }
      doneN = p.getType().equals("King");
    }
    
    if(!doneN && r){
      nextTurn();
    }
    else{
      done = doneN;
    }
 
    return r;
  }
  
  public boolean isDone(){
    return done;
  }
  
  public void nextTurn(){
    if(playerOneTurn){
      playerOneTurn = false;
    }else{
      playerOneTurn = true;
    }
  }
  
  public boolean playerOneTurn(){
    return playerOneTurn;
  }
  public boolean inCheck(boolean team){
     Piece king = new King();
     
     for(int r = 0; r < 8; ++r){
       for(int c = 0; c<8; ++c){
         Piece curr = getPiece(c, r);
         if(curr != null && curr.getTeam() == team && curr.getType().equals("King")){
           king = curr;
           break;
         }
       }
     }
     
     for(int r = 0; r < 8; ++r){
       for(int c = 0; c<8; ++c){
         Piece curr = getPiece(c, r);
         if(curr != null && curr.getTeam() != team && curr.withinPieceRange(king.getX(), king.getY())){
           return true;
         }
       }
     }
     return false;
  }
  public boolean inMate(boolean team){
   int moves = 0;
    for(int r = 0; r<8; ++r){
     for(int c = 0; c<8; ++c){
       Piece p = getPiece(c, r);
       if(p != null && p.getTeam() == team){
         moves += p.getValidPositions().size();
       }  
     }
    }
    return moves == 0;
  }
  
}
