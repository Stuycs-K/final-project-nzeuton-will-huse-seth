abstract class Piece{
  private int xPos, yPos;
  private boolean team;
  private String type;

  private Chess board;

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

  public Piece(int x, int y, boolean team, Chess board, String type){
    xPos = x;
    yPos = y;
    this.team = team;
    this.board = board;
    this.type = type;

  }
  public boolean getTeam(){
    return team;
  }
  public int getX(){
    return xPos;
  }
  public int getY(){
    return yPos;
  }
  public String getType(){
    return type;
  }
  public ArrayList<int[]> getValidPositions(){
    ArrayList<int[]> res = new ArrayList<int[]>();
    for(int r = 0; r <= 7; ++r){
      for(int c = 0; c<= 7; ++c){

        if(isValidPosition(c, r)){

          res.add(new int[]{c, r});
        }
      }
    }
    return res;
  }
  public boolean move(int x, int y){

    Piece pieceAtLoc = board.getPiece(x, y);
    boolean end = false;
    if(pieceAtLoc != null){
      end = pieceAtLoc.getType().equals("King");
    }
    Piece originalPiece = board.removePiece(xPos, yPos);
    if(pieceAtLoc != null){
      board.removePiece(x, y);
    }
    xPos = x;
    yPos = y;
    board.setPiece(x, y, originalPiece);
    return end;
  }
  public boolean isValidPosition(int x, int y){
    Piece pieceAt = board.getPiece(x, y);

    if(pieceAt != null){
      System.out.println("There is a piece at " + x + " " + y);
      if(pieceAt.getTeam() == getTeam()){
        System.out.println("This is a same color piece");
        return false;
      }
    }
    if(x == xPos && y == yPos){
      System.out.println("Cannot move to itself");
      return false;
    }
    if(0 <= x && x <= 7 && 0 <= y && y <= 7){
      return withinPieceRange(x, y);
    }
    System.out.println("Out of board bounds");
    return false;
  }
  public abstract boolean withinPieceRange(int x, int y);
  
}
