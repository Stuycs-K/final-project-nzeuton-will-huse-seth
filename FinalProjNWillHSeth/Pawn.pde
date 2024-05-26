class Pawn extends Piece {
  private int xPos, yPos;
  private boolean team;
  private Chess board;
  public Pawn(){
    super();
  }
  public Pawn(int x, int y){
    super(x, y);
  }

  public Pawn(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "Pawn");
  }
  
  public boolean withinPieceRange(int x, int y){
    Piece pAtXY = getBoard().getPiece(x, y);
    boolean team = getTeam();
    int startRow;
    boolean dir;
    if(team){
      if(y >= getY()){
        return false;
      }
      startRow = 6;
    } else{
      if(y<= getY()){
        return false;
      }
      startRow = 1;
    }
   int disX = Math.abs(getX() - x);
   int disY = Math.abs(getY() - y);
   if(disX != 0){
     if(disX == 1 && disY == 1 && pAtXY != null && pAtXY.getTeam() != team){
         return true;
     }
     return false;
   }
   if(disY == 1 && pAtXY == null){
     return true;
   }
   if(disY == 2 && getY() == startRow && pAtXY == null){
     return true;
   }
   return false;
     
  }
  public PImage getImage(boolean t){
    PImage piece = t ? loadImage("Chess_plt60.png") : loadImage("Chess_pdt60.png");
    return piece;
  }

}
