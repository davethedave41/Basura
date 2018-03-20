Review review;
class BarChartIndividual{ 
  Review review;
  PFont stdFont;
  int x1=280;      //useful
  int y1=1640;
  int x2=0;        //funny
  int y2=0;
  int x3=0;        //cool
  int y3=0;
  int x4=0;        //stars
  int y4=0;
//  int uR=5;
//  int cR=4;
 // int fR=0;
 String useful="Useful", funny="Funny", cool="Cool", stars="Stars";


  BarChartIndividual(Review review) {
    this.review=review;
  }

  /*Review getReview(Review review) {
    return review;
  }*/
  void draw(float y) {
    fill(255);
    rect(barX, y, barWidthH, barHeightH);
    rect(barX, y,barWidthV,barHeightV);
    rect(barX-20,y-oneRating,20,barHeightH);
    text("1",barX-30,y-oneRating+barHeightH);
    rect(barX-20,y-2*oneRating,20,barHeightH);
    text("2",barX-30,y-2*oneRating+barHeightH);
    rect(barX-20,y-3*oneRating,20,barHeightH); 
    text("3",barX-30,y-3*oneRating+barHeightH);
    rect(barX-20,y-4*oneRating,20,barHeightH);
    text("4",barX-30,y-4*oneRating+barHeightH);
    rect(barX-20,y-5*oneRating,20,barHeightH);
    text("5",barX-30,y-5*oneRating+barHeightH);
    stdFont = loadFont("SansSerif-14.vlw");
    fill(255,5,5);
    text(useful,barX+barWidthV+barGraphWidth/3-5,y+20);
    fill(0,255,0);
    text(funny,barX+barWidthV+barGraphWidth+barGraphWidth/3-5,y+20);
    fill(0,0,255);
    text(cool,barX+barWidthV+2*barGraphWidth+barGraphWidth/3-5,y+20);
    switch(review.getUseful()){
      case 1:
      fill(255,0,0);
      rect(barX+barWidthV, y, barGraphWidth,-1*(oneRating*review.getUseful()));
     break;
     case 2:
     fill(255,0,0);
     rect(barX+barWidthV, y, barGraphWidth,-1*(oneRating*review.getUseful()));
     break;
     case 3:
     fill(255,0,0);
     rect(barX+barWidthV, y, barGraphWidth,-1*(oneRating*review.getUseful()));
     break;
     case 4:
     fill(255,0,0);
     rect(barX+barWidthV, y, barGraphWidth,-1*(oneRating*review.getUseful()));
     break;
     case 5:
     fill(255,0,0);
     rect(barX+barWidthV, y-1, barGraphWidth,-1*(oneRating*review.getUseful()));
     break;
     default:
     break;
    }
    switch(review.getFunny()){
    case 1:
     fill(0,255,0);
    rect(barX+barWidthV+barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getFunny()));
    break;
    case 2:
     fill(0,255,0);
    rect(barX+barWidthV+barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getFunny()));
    break;
    case 3:
     fill(0,255,0);
     rect(barX+barWidthV+barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getFunny()));
    break;
    case 4:
     fill(0,255,0);
    rect(barX+barWidthV+barGraphWidth,barWidthV,barGraphWidth,-1*(oneRating*review.getFunny()));
    break;
    case 5:
     fill(0,255,0);
    rect(barX+barWidthV+barGraphWidth,barWidthV,barGraphWidth,-1*(oneRating*review.getFunny()));
    break;
    default:
    break;
    }
    switch(review.getCool()){
    case 1:
    fill(0,0,255);
    rect(barX+barWidthV+2*barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getCool()));
    break;
    case 2:
    fill(0,0,255);
    rect(barX+barWidthV+2*barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getCool()));
    break;
    case 3:
    fill(0,0,255);
    rect(barX+barWidthV+2*barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getCool()));
    break;
    case 4:
    fill(0,0,255);
    rect(barX+barWidthV+2*barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getCool()));
    break;
    case 5:
    fill(0,0,255);
    rect(barX+barWidthV+2*barGraphWidth,y,barGraphWidth,-1*(oneRating*review.getCool()));
    break;
    default:
    break;
    }
  }
}
