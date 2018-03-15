class StarCounter {
  int stars;
  PImage starI;
  StarCounter(int stars, PImage starI) {
    this.stars=stars;
    this.starI=starI;
  }
  void draw(float y) {
    int starWidth=starI.width;
    //int starheight=starI.height;
    stroke(0);
    fill(255);
    rect(starBoxX, y, starBoxW, starBoxH);
    switch(stars) {
    case 1:
      image(starI, starBoxX+starWidth, y+starBoxH/2);
      break;
    case 2:
      for (int i=0; i<=1; i++) {
        image(starI,starBoxX+starWidth*i ,y+starBoxH/3-5);
      }
      break;
    case 3:
      for (int i=0; i<=2; i++) {
        image(starI, starBoxX+starWidth*i, y+starBoxH/3-5);
      }  
      break;
    case 4:
      for (int i=0; i<=3; i++) {
        image(starI, starBoxX+starWidth*i, y+starBoxH/3-5);
      }
      break;
    case 5:
      for (int i=0; i<=4; i++) {
        image(starI, starBoxX+starWidth*i, y+starBoxH/3-5);
      }
      break;
    default:
      break;
    }
  }
}