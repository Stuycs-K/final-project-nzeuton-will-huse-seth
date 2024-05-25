class Pawn extends Piece {
  private int xPos, yPos;
  private boolean team;

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
     if(team){
       if(xPos != x){
         if(xPos - x == 1 || xPos - x == -1){
           if(yPos - y == 1){
             return true;
           }
           return false;
         }
         return false;
       }
       if(yPos - y != 1){
         if(yPos == 6 && yPos - y == 2){
           return true;
         }
         return false;
       }
       return true;
     } else{
       if(xPos != x){
         if(xPos - x == 1 || xPos - x == -1){
           if(yPos - y == -1){
             return true;
           }
           return false;
         }
         return false;
       }
       if(yPos - y != -1){
         if(yPos == 1 && yPos - y == -2){
           return true;
         }
         return false;
       }
       return true;
  }
}

}
