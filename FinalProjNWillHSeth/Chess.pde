class Chess{
  private Piece[][] board;
  private boolean playerOneTurn;
  private Piece initial;
  
  public Chess(){
    board = new Piece[8][8];
    for(int i = 0; i < 8; i++){
      board[1][i] = new Pawn(i,1,false);
      board[6][i] = new Pawn(i,6,true);
    }
    board[0][0] = new Rook(0,0,false);
    board[7][0] = new Rook(0,7,true);
    board[0][1] = new Knight(1,0,false);
    board[7][1] = new Knight(1,7,true);
    board[0][2] = new Bishop(2,0,false);
    board[7][2] = new Bishop(2,7,true);
    board[0][3] = new Queen(3,0,false);
    board[7][3] = new Queen(3,7,true);
    board[0][4] = new King(4,0,false);
    board[7][4] = new King(4,7,true);
    board[0][5] = new Bishop(5,0,false);
    board[7][5] = new Bishop(5,7,true);
    board[0][6] = new Knight(6,0,false);
    board[7][6] = new Knight(6,7,true);
    board[0][7] = new Rook(7,0,false);
    board[7][7] = new Rook(7,7,true);
    playerOneTurn = true;
  }
  
  public Piece getPiece(int x,int y){
    return board[y][x];
  }
  
  public boolean turnBeg(int x, int y){
  
    if(board[y][x] != null){
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
    boolean done = false;
    if(initial.isValidPosition(x,y)){
      done = initial.move(x,y);
    }
  }
    
}
