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
  public int setX(int x){
    int temp = xPos;
    xPos = x;
    return temp;
  }
  public int setY(int y){
    int temp = yPos;
    yPos = y;
    return temp;
  }
  public String getType(){
    return type;
  }
  public Chess getBoard(){
    return board;
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
    if(getType().equals("Pawn")){
      if(Math.abs(y - yPos) > 1){
        Piece lPawn = null;
        Piece rPawn = null;
        try{
          lPawn = getBoard().getPiece(x - 1, y);
        } catch(Exception e){}
        try{
          rPawn = getBoard().getPiece(x + 1, y);
        } catch(Exception e){}
        if(lPawn != null && lPawn.getTeam() != getTeam()){
           this.setPassant(true);
        }
      }
    }
    xPos = x;
    yPos = y;
    board.setPiece(x, y, originalPiece);
    return getBoard().inMate(!getTeam());
  }
  public boolean isValidPosition(int x, int y) {
    if (x < 0 || x > 7 || y < 0 || y > 7) {
        System.out.println("Out of board bounds");
        return false;
    }

    Piece pieceAt = board.getPiece(x, y);
    if (pieceAt != null && (pieceAt.getTeam() == getTeam() || pieceAt.getType().equals("King"))) {
        return false;
    }

    if (withinPieceRange(x, y)) {
      int originalX = getX();
      int originalY = getY();
      Piece pieceAtDestination = getBoard().getPiece(x, y);
  
      Piece originalPiece = getBoard().removePiece(originalX, originalY);
      setX(x);
      setY(y);
      
      getBoard().setPiece(x, y, this);
  
      boolean isInCheck = getBoard().inCheck(getTeam());
  
      setX(originalX);
      setY(originalY);
      getBoard().setPiece(originalX, originalY, originalPiece);
      getBoard().setPiece(x, y, pieceAtDestination);
  
      return !isInCheck;
    }

    return false;
}


  public abstract boolean withinPieceRange(int x, int y);
  public abstract PImage getImage(boolean team);
  public abstract boolean setPassant(boolean passant); 
}
