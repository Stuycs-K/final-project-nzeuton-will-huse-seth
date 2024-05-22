class Chess{
  private Piece[][] board;
  private boolean playerOneTurn;
  
  public Chess(){
    board = new Piece[8][8];
    for(int i = 0; i < 8; i++){
      board[1][i] = new Pawn(i,1,false);
      board[6][i] = new Pawn(i,6,true);
    }
  }
}
