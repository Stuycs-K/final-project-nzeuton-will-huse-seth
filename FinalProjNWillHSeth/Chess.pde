
class Chess{
  private Piece[][] board;
  private boolean playerOneTurn;
  private Piece initial;
  private boolean done;

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
  
  
  
  public boolean turnEnd(int x, int y){
    boolean doneN = false;
    boolean r = false;
    if(initial.isValidPosition(x,y)){
      doneN = initial.move(x,y);
      r = true;
    } else{
      System.out.println("Position: " + ((char)(x+97)) +  (8-y) + " is not valid for " + initial.getType() + " at " + ((char)(97+initial.getX())) + (8-initial.getY()));
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
