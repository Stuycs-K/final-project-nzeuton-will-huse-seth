class Chess{
  private Piece[][] board;
  private boolean playerOneTurn;
  
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
}
