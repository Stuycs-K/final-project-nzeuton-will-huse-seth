class Pawn extends Piece {
  public Pawn(){
    super();
  }
  public Pawn(int x, int y){
    super(x, y);
  }

  public Pawn(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "Pawn");
  }
  public boolean getSpecial(){
    return special;
  }
  public void setSpecial(boolean passantable){
    this.special = passantable; 
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
   Piece pU;
   if(getX() - 1 < 0){
     pU = null;
     System.out.println("out of bounds");
   } else{
     pU = getBoard().getPiece(getX() - 1, y);
   }
   if(pU != null){
     
   
   }
   //Piece pU = getBoard().getPiece(x, y - 1);
   if(disX != 0){
     //System.out.println("Attempting " + x + " " + y);
     //System.out.println("disX " + disX);
     //System.out.println("disY " + disY);
     System.out.println(pU == null);
     if(pU != null){
     System.out.println(pU.getType().equals("Pawn"));
     System.out.println(pU.getSpecial());
     }
     if(pU != null && pU.getType().equals("Pawn") && pU.getSpecial()){
       
       System.out.println(pU.getType());
       return true;
       
     }
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
