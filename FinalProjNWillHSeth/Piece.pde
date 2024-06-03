abstract class Piece{
  private int xPos, yPos;
  private boolean team;
  private String type;
  public boolean special = false;
  private Chess board;

  public Piece(){
    xPos = 0;
    yPos = 0;
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
  public void setType(String type){
    this.type = type;
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
  public Piece move(int x, int y){
    boolean pieceExisted = false;
    Piece pieceAtLoc = board.getPiece(x, y);
    Piece remP = null;
    boolean end = false;
    Piece pR = null;
    if(pieceAtLoc != null){
      end = pieceAtLoc.getType().equals("King");
    }
    Piece originalPiece = board.removePiece(xPos, yPos);
    Piece removed = null;
    if(pieceAtLoc != null){
      //if(pieceAtLoc.getTeam() != getTeam()){
        
      remP = board.removePiece(x, y);
      
      pieceExisted = true;
    }
    for(int r = 0; r<8; ++r){
      for(int c = 0; c<8; ++c){
        Piece p = getBoard().getPiece(c, r);
        if(p != null && p.getType().equals("Pawn")){
          p.setSpecial(false);
        }
      }
    }
    
    if((getType().equals("King") || getType().equals("Rook"))&& getSpecial()){
      setSpecial(false);
    }
    
    if(getType().equals("Pawn")){
      if(Math.abs(y - yPos) == 1 && Math.abs(x - xPos) == 1 && !pieceExisted){
        Piece sidePiece = getBoard().getPiece(x, getTeam() ? y + 1 : y - 1);
         pR = getBoard().removePiece(sidePiece.getX(), sidePiece.getY());
        getBoard().setPiece(x, y, pR );
      }
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
           this.setSpecial(true);
        }
        if(rPawn != null && rPawn.getTeam() != getTeam()){
           this.setSpecial(true);
        }
        //System.out.println("Moved to passantable location? " + getSpecial());
      }
    }
    if(pieceAtLoc != null && originalPiece.getType().equals("King") && pieceAtLoc.getType().equals("Rook")){
      int kX = pieceAtLoc.getX() == 7 ? 6 : 2;
      int rX = pieceAtLoc.getX() == 7 ? 5 : 3;
      getBoard().setPiece(kX, y, originalPiece);
      if(remP != null){
        
      getBoard().setPiece(rX, y, remP);
      }  
      xPos = kX;
      yPos = y;
      pieceAtLoc.setX(rX);
      pieceAtLoc.setY(y);
      pieceAtLoc.setSpecial(false);
  } else{
    
    xPos = x;
    yPos = y;
    //remP = board.removePiece(x,y);
    board.setPiece(x, y, originalPiece);
  }
  if(remP != null && getType().equals("King") && remP.getType().equals("Rook") && remP.getTeam() == getTeam()){
    
    return null;
  }
    if(getBoard().inMate(!getTeam()) != 0){
      return new King();
    }
    else{
      if(remP == null && pR != null){
        return pR;
      }
      return remP;
    }

  
  }
  public boolean isValidPosition(int x, int y) {
    if (x < 0 || x > 7 || y < 0 || y > 7) {
        System.out.println("Out of board bounds");
        return false;
    }

    Piece pieceAt = board.getPiece(x, y);
    if (pieceAt != null && (pieceAt.getTeam() == getTeam() || pieceAt.getType().equals("King"))) {
      if(!(!getBoard().inCheck(getTeam()) && getType().equals("King") && pieceAt.getType().equals("Rook") && getSpecial() && pieceAt.getSpecial())){
        
        return false;
      }  
  }

    if (withinPieceRange(x, y)) {
      int originalX = getX();
      int originalY = getY();
      Piece pieceAtDestination = getBoard().getPiece(x, y);
  
      Piece originalPiece = getBoard().removePiece(originalX, originalY);
      if(pieceAtDestination != null && pieceAtDestination.getTeam() == getTeam() && pieceAtDestination.getType().equals("Rook")){
        if(x == 0){
          setX(2);
          getBoard().setPiece(2, y, this);
  
          boolean isInCheck = getBoard().inCheck(getTeam());
      
          setX(originalX);
          setY(originalY);
          getBoard().setPiece(originalX, originalY, originalPiece);
          getBoard().removePiece(2, y);
          if(isInCheck){
            return false;
          }
          setX(3);
          getBoard().setPiece(3, y, this);
  
          isInCheck = getBoard().inCheck(getTeam());
      
          setX(originalX);
          setY(originalY);
          getBoard().setPiece(originalX, originalY, originalPiece);
          getBoard().removePiece(3, y);
          //getBoard().setPiece(x, y, pieceAtDestination);
          return !isInCheck;
        }
        if(x==7){
          setX(5);
          getBoard().setPiece(5, y, this);
  
          boolean isInCheck = getBoard().inCheck(getTeam());
      
          setX(originalX);
          setY(originalY);
          getBoard().setPiece(originalX, originalY, originalPiece);
          getBoard().removePiece(5, y);
          //getBoard().setPiece(5, y, pieceAtDestination);
          if(isInCheck){
            return false;
          }
          setX(6);
          getBoard().setPiece(6, y, this);
  
          isInCheck = getBoard().inCheck(getTeam());
      
          setX(originalX);
          setY(originalY);
          getBoard().setPiece(originalX, originalY, originalPiece);
          getBoard().removePiece(6, y);
          //getBoard().setPiece(x, y, pieceAtDestination);
          return !isInCheck;
        }
      } else{
        
      setX(x);
      }
      //setX(x);
      setY(y);
      
      getBoard().setPiece(x, y, this);
  
      boolean isInCheck = getBoard().inCheck(getTeam());
  
      setX(originalX);
      setY(originalY);
      getBoard().setPiece(originalX, originalY, originalPiece);
      if(pieceAtDestination != null){
        if(pieceAtDestination.getTeam() != getTeam()){
          getBoard().setPiece(x, y, pieceAtDestination);
        }
      } else{
        
      getBoard().setPiece(x, y, pieceAtDestination);
      }
  
      return !isInCheck;
    }

    return false;
}

public void promotion(int x, int y, String type){
  if(type.equals("Queen")){
    board.setPiece(x,y,new Queen(x,y,team,board));
  }
  if(type.equals("Knight")){
    board.setPiece(x,y,new Knight(x,y,team,board));
  }
  if(type.equals("Rook")){
    board.setPiece(x,y,new Rook(x,y,team,board));
  }
  if(type.equals("Bishop")){
    board.setPiece(x,y,new Bishop(x,y,team,board));
  }
}

  public abstract boolean withinPieceRange(int x, int y);
  public abstract PImage getImage(boolean team);
  public void setSpecial(boolean passant){
    special = passant;
  }
  public boolean getSpecial(){
    return special;
  }
}
