class Knight extends Piece {
  private int xPos, yPos;
  private boolean team;

  public Knight(){
    super();
  }
  public Knight(int x, int y){
    super(x, y);
  }

  public Knight(int x, int y, boolean team, Chess board){
    super(x, y, team, board,"Knight");

  }
  
  public boolean withinPieceRange(int x, int y){
     int xDis = getX() - x;
     int yDis = getY() - y;
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