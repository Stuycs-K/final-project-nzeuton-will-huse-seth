void setup(){
  size(500,500);
  //Chess game = new Chess();
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if((i+j)%2 == 0){
        fill(255,255,255);
      }
      else{
        fill(0,0,0);
      }
      square(50+i*50,50+j*50,50);
    }
  }
}

void draw(){
  
}
