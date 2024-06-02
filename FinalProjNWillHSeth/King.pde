class King extends Piece {


  public King(){
    super();
    setSpecial(true);
  }


  public King(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "King");
    setSpecial(true);
  }
  public boolean withinPieceRange(int x, int y){
    int rX1 = 7;
    int rX2 = 0;
    
    int rY1 = getTeam() ? 7 : 0;
    int rY2 = getTeam() ? 7 : 0;
    //if((x == rX1 && x == rX2) && (y == rY1
    Piece potentialRook = getBoard().getPiece(x, y);
    if(!getBoard().inCheck(getTeam()) && potentialRook != null && potentialRook.getType().equals("Rook") && potentialRook.getSpecial()){
      if(potentialRook.withinPieceRange(getX(), getY())){
        return true;
      }
    }
    return (Math.abs(x - getX()) <= 1 && Math.abs(y - getY()) <= 1);
  }
  public PImage getImage(boolean t){
    PImage piece = t ? loadImage("Chess_klt60.png") : loadImage("Chess_kdt60.png");
    return piece;
  }
}
