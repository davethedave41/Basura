class LinePlot {

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
  int[] statistics;
  int max;
  int min;
  int maxPoint;

  LinePlot(int maxPoint, int oneValueX, int oneValueY, int axisX, int axisY, int graphWidth, int graphHeight, String title, 
    String xLabel, String yLabel, int lineThickness, int xPoints, 
    int yPoints, float radiusOfPoint, int[] statistics) {
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

  void draw() {//line(x1,y1,x2,y2)
    stdFont=loadFont("SansSerif-14.vlw");
    text(xLabel, graphWidth/2, axisY+40);
    text(yLabel, axisX-50, graphHeight);
    strokeWeight(1);
    stroke(0);
    line(axisX, axisY, graphWidth, axisY);
    line(axisX, axisY, axisX, graphHeight);
    int previousCoordinateY=0;
    int previousCoordinateX=0;
    int currentCoordinateX;
    int currentCoordinateY;
    int gap=1;

    for (int z=0; z<xPoints; z++) {//ellipse(x,y,r)
      if (z==0) {
        previousCoordinateX=(oneValueX*gap)+axisX;
        previousCoordinateY=axisY-(oneValueY*statistics[z]);
      }
      currentCoordinateX=(oneValueX*gap+1)+axisX;
      currentCoordinateY=axisY-(oneValueY*statistics[z]);
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

/*int getMax(int[] statistics) {
  int max=0;
  for (int i=0; i<statistics.length; i++) {
    if (max<statistics[i]) {
      max=statistics[i];
    }
  }
  return max;
}

int getMin(int[] statistics) {
  int min=0;
  for (int i=0; i<statistics.length; i++) {
    if (min>statistics[i]) {
      min=statistics[i];
    }
  }
  return min;
}*/

void setSteps() {
  int ySetter=maxPoint/yPoints;
  for (int i=1; i<=yPoints; i++) {
    line(axisX-5, axisY-((ySetter*i)*oneValueY), axisX+5, axisY-((ySetter*i)*oneValueY));
    text(""+ySetter*i, axisX-20, axisY-((ySetter*i)*oneValueY)+5);
  }
  int year=2007;
  for (int i=1; i<=xPoints; i++) {
    line(axisX+(oneValueX*i), axisY-5, axisX+(oneValueX*i), axisY+5);
    text(""+year, axisX+(oneValueX*i)-9, axisY+20);
    year++;
  }
}
}