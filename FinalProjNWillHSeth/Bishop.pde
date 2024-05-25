class Bishop extends Piece {
  private int xPos, yPos;
  private boolean team;
  private String type = "Bishop";
  public Bishop(){
    super();
  }
  public Bishop(int x, int y){
    super(x, y);
  }
  public Bishop(int x, int y, boolean team){
    super(x, y, team);
  }
  
  public boolean withinPieceRange(int x, int y){
      return (x - xPos == y - yPos);
  }
}
