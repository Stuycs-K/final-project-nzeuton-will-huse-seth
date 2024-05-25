class Queen extends Piece {
  private int xPos, yPos;
  private boolean team;

  public Queen(){
    super();
  }
  public Queen(int x, int y){
    super(x, y);
  }

  public Queen(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "Queen");

  }
  
  public boolean withinPieceRange(int x, int y){
    return ((Math.abs(x - getX()) == Math.abs(y - getY())) || (x == getX() || y == getY()));
  }
}
