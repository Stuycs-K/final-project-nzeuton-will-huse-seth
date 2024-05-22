abstract class Piece{
  private int xPos, yPos;
  private boolean team;
  
  public Piece(){
    xPos = 0;
    yPos = 0;
    team = true;
  }
  public Piece(int x, int y){
    xPos = x;
    yPos = y;
    team = true;
  }
  public Piece(int x, int y, boolean team){
    xPos = x;
    yPos = y;
    this.team = team;
  }
  
  public boolean move(int[] coordinate){
    if(isValidPosition(coordinate)){
      xPos = coordinate[0];
      yPos = coordinate[1];
      
    }
    return false;
  }
  
  public abstract boolean isValidPosition(int[] coordinates);
}
