class Queen extends Piece {
  private int xPos, yPos;
  private boolean team;
  private String type = "Queen";
  public Queen(){
    super();
  }
  public Queen(int x, int y){
    super(x, y);
  }
  public Queen(int x, int y, boolean team, Chess board){
    super(x, y, team, board);
  }
  
  public boolean withinPieceRange(int x, int y){
    return ((x - xPos == y - yPos) || (x == xPos || y == yPos));
  }
}
