class Bishop extends Piece {
  private int xPos, yPos;
  private boolean team;
  
  public Bishop(){
    super();
  }
  public Bishop(int x, int y){
    super(x, y);
  }
  public Bishop(int x, int y, boolean team){
    super(x, y, team);
  }
  
  public boolean isValidPosition(int[] coordinate){
    if(0 <= coordinate[0] && coordinate[0] <= 7 && 0 <= coordinate[1] && coordinate[1] <= 7){
      return (coordinate[0] - xPos == coordinate[1] - yPos);
    }
    return false;
  }
}
