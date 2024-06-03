class King extends Piece {


  public King(){
    super();
    setType("King");
    setSpecial(true);
  }


  public King(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "King");
    setSpecial(true);
  }
  public boolean withinPieceRange(int x, int y){
    return (Math.abs(x - getX()) <= 1 && Math.abs(y - getY()) <= 1);
  }
  public PImage getImage(boolean t){
    PImage piece = t ? loadImage("Chess_klt60.png") : loadImage("Chess_kdt60.png");
    return piece;
  }
}
