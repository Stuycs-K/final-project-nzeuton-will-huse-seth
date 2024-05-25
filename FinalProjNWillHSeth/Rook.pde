class Rook extends Piece {
  private int xPos, yPos;
  private boolean team;

  public Rook(){
    super();
  }
  public Rook(int x, int y){
    super(x, y);
  }

  public Rook(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "Rook");

  }
  
  public boolean withinPieceRange(int x, int y){
    return (x == xPos || y == yPos);
  }
}
