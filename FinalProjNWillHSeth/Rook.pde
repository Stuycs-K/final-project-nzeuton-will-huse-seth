class Rook extends Piece {
  private int xPos, yPos;
  private boolean team;
  private String type = "Rook";
  public Rook(){
    super();
  }
  public Rook(int x, int y){
    super(x, y);
  }
  public Rook(int x, int y, boolean team){
    super(x, y, team);
  }
  
  public boolean withinPieceRange(int x, int y){
    return (x == xPos || y == yPos);
  }
}
