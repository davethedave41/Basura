class LinePlotStars {

  int oneValueX;
  int oneValueY;
  PFont stdFont;
  int axisX;      //coordinates for starting point of x-axis and y-axis
  int axisY;
  int graphHeight;
  int graphWidth;
  String title;
  String xLabel;
  String yLabel;
  int lineThickness;
  int xPoints;
  int yPoints;
  float radiusOfPoint;
  double[] statistics;
  int max;
  int min;
  int maxPoint;

  LinePlotStars(int maxPoint, int oneValueX, int oneValueY, int axisX, int axisY, int graphWidth, int graphHeight, String title, 
    String xLabel, String yLabel, int lineThickness, int xPoints, 
    int yPoints, float radiusOfPoint, double[] statistics) {
    this.axisX=axisX;
    this.axisY=axisY;
    this.graphHeight=(axisY-graphHeight)-10;
    this.graphWidth=(graphWidth+axisX)+10;
    this.title=title;
    this.xLabel=xLabel;
    this.yLabel=yLabel;
    this.lineThickness=lineThickness;
    this.xPoints=xPoints;
    this.yPoints=yPoints;
    this.radiusOfPoint=radiusOfPoint;
    this.statistics=statistics;
    this.oneValueX=oneValueX;
    this.oneValueY=oneValueY;
    //max=getMax(statistics);
    //min=getMin(statistics);
    this.maxPoint=maxPoint;
  }
  
  int getAxisX(){
   return axisX;
  }

  int getAxisY(){
   return axisY;
  }
    int getOneValueX(){
   return oneValueX;
  }
  
  int getXPoints(){
    return xPoints;
  }
  
  void draw() {//line(x1,y1,x2,y2)
    stdFont=loadFont("SansSerif-14.vlw");
     pushMatrix();
  translate( axisX-graphWidth/2-20, axisY-graphHeight-graphHeight/2);      //rotating the text by 90 degrees
  rotate(2*PI-(PI/2));
  translate( axisX-graphWidth/2-20, axisY-graphHeight-graphHeight/2);
  textAlign(CENTER);
  text(yLabel, axisX-graphWidth/2-20, axisY-graphHeight-graphHeight/2);
  popMatrix();
  textAlign(RIGHT);
    text(xLabel, graphWidth/2, axisY+40);
   // text(yLabel, axisX-50, graphHeight);
    strokeWeight(1);
    line(axisX, axisY, graphWidth, axisY);
    line(axisX, axisY, axisX, graphHeight);
    float previousCoordinateY=0;
    float previousCoordinateX=0;
    float currentCoordinateX;
    float currentCoordinateY;
    int gap=1;

    for (int z=0; z<xPoints; z++) {//ellipse(x,y,r)
      if (z==0) {
        previousCoordinateX=(oneValueX*gap)+axisX;
        previousCoordinateY=(float)(axisY-(oneValueY*statistics[z]));
      }
      currentCoordinateX=(oneValueX*gap+1)+axisX;
      currentCoordinateY=(float)(axisY-(oneValueY*statistics[z]));
      fill(0);
      strokeWeight(1);
      line(previousCoordinateX, previousCoordinateY, currentCoordinateX, currentCoordinateY);
      ellipse(currentCoordinateX, currentCoordinateY, radiusOfPoint, radiusOfPoint);

      previousCoordinateX=currentCoordinateX;
      previousCoordinateY=currentCoordinateY;
      gap++;
    }
  
  //  line((oneValueX*1)+axisX,axisY-(oneValueY*statistics[0]),(oneValueX*2)+axisX,axisY-(oneValueY*statistics[1]));
  fill(255, 0, 0);
  ellipse(axisX, axisY, radiusOfPoint, radiusOfPoint);
  setSteps();

}


void setSteps() {
  int ySetter=maxPoint/yPoints;
  for (int i=1; i<=yPoints; i++) {
    line(axisX-5, axisY-((ySetter*i)*oneValueY), axisX+5, axisY-((ySetter*i)*oneValueY));
    text(""+ySetter*i, axisX-20, axisY-((ySetter*i)*oneValueY)+5);
  }
  int year=2007;
  for (int i=1; i<=xPoints; i++) {
    line(axisX+(oneValueX*i), axisY-5, axisX+(oneValueX*i), axisY+5);
    text(""+year, axisX+(oneValueX*i)+18, axisY+20);
    year++;
  }
}
}