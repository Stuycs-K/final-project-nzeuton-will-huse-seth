class Bishop extends Piece {
  private int xPos, yPos;
  private boolean team;

  public Bishop(){
    super();
  }
  public Bishop(int x, int y){
    super(x, y);
  }

  public Bishop(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "Bishop");

  }
  
  public boolean withinPieceRange(int x, int y){
      return (x - xPos == y - yPos);
  }
}
