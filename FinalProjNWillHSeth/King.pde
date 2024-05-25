class King extends Piece {
  private int xPos, yPos;
  private boolean team;
  private String type = "King";
  public King(){
    super();
  }
  public King(int x, int y){
    super(x, y);
  }
  public King(int x, int y, boolean team){
    super(x, y, team);
  }
  
  public boolean withinPieceRange(int x, int y){
    return (x - xPos <= 1 && y - yPos <= 1);
  }
}
