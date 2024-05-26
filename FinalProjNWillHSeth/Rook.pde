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
    if (x == getX()){
      boolean unobstructed = true;
      int chY = y-getY();
      while(Math.abs(chY) != 1){
        if(chY > 0) chY --;
        else if(chY < 0) chY ++;
        if(getBoard().getPiece(getX(),getY()+chY) != null){
            unobstructed = false;
          }
      }
      return unobstructed;
    }
    else if(y == getY()){
      boolean unobstructed = true;
      int chX = x-getX();
      while(Math.abs(chX) != 1){
        if(chX > 0) chX --;
        else if(chX < 0) chX ++;
        if(getBoard().getPiece(getX()+chX,getY()) != null){
            unobstructed = false;
          }
      }
      return unobstructed;
    }
    else{
      return false;
    }
  }
}
