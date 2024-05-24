class Knight extends Piece {
  private int xPos, yPos;
  private boolean team;
  private String type = "Knight";
  public Knight(){
    super();
  }
  public Knight(int x, int y){
    super(x, y);
  }
  public Knight(int x, int y, boolean team){
    super(x, y, team);
  }
  
  public boolean withinPieceRange(int x, int y){
     int xDis = xPos - x;
     int yDis = yPos - y;
     if(xDis == 1 || xDis == -1){
       if(yDis == 2 || yDis == -2){
         return true;
       }
       return false;
     }
     if(xDis == 2 || xDis == -2){
       if(yDis == 1 || yDis == -1){
         return true;
       }
       return false;
     }
     return false;
  }
}
