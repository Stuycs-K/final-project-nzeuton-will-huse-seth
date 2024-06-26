class Bishop extends Piece {

  public Bishop(){
    super();
  }

  public Bishop(int x, int y, boolean team, Chess board){
    super(x, y, team, board, "Bishop", loadImage("assets/images/Chess_blt60.png"), loadImage("assets/images/Chess_bdt60.png"));

  }
  public boolean withinPieceRange(int x, int y){
      if ((Math.abs(x - getX()) == Math.abs(y - getY()))){
        boolean unobstructed = true;
        int chX = x-getX();
        int chY = y-getY();
        while(Math.abs(chX) != 1){
          if(chX > 0) chX --;
          else if(chX < 0) chX ++;
          if(chY > 0) chY --;
          else if(chY < 0) chY ++;
          if(getBoard().getPiece(getX()+chX,getY()+chY) != null){
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
