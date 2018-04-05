class BarChart { 
  PFont stdFont;
  int oneValueX;
  int oneValueY;
  int axisX;      //coordinates for starting point of x-axis and y-axis
  int axisY;
  int graphHeight;
  int graphWidth;
  String title;
  String xLabel;
  String yLabel;
  int xPoints;
  int yPoints;
  int barWidth;
  int[] statistics;
  int max;
  int min;
  int maxPoint;
  Review review;
  String businessName;

  BarChart(Review review, int maxPoint, int barWidth, int yPoints, int xPoints, String xLabel, 
    String yLabel, String title, int graphWidth, int graphHeight, int axisX, 
    int axisY, int oneValueX, int oneValueY,int[] statistics, String businessName) {
    this.review=review;
    this.maxPoint=maxPoint;
    this.barWidth=barWidth;
    this.yPoints=yPoints;
    this.xPoints=xPoints;
    this.xLabel=xLabel;
    this.yLabel=yLabel;
    this.title=title;
    this.graphWidth=graphWidth;
    this.graphHeight=graphHeight;
    this.axisX=axisX;
    this.axisY=axisY;
    this.oneValueX=oneValueX;
    this.oneValueY=oneValueY;
    this.statistics=statistics;
    this.businessName = businessName;
  }

  void draw() {
    fill(0);
    stdFont=loadFont("Dialog.plain-15.vlw");
    fill(100,10,50);
    text(xLabel, graphWidth/2+axisX-20, axisY+50);
    text(yLabel, axisX-70, axisY-graphHeight/3-20);
    strokeWeight(1);
    line(axisX, axisY, graphWidth+axisX, axisY);
    line(axisX, axisY, axisX, axisY-graphHeight);
    setSteps();
    for (int i=0; i<xPoints; i++) {
      stroke(255);
      rect(axisX+(oneValueX*i),axisY,200,-1*(oneValueY*statistics[i]));
    }
  }

  int getAxisX() {
    return axisX;
  }
  int getOneValueX() {
    return oneValueX;
  }

  void setSteps() {
    int ySetter=maxPoint/yPoints;
    for (int i=1; i<=yPoints; i++) {
      line(axisX-5, axisY-((ySetter*i)*oneValueY), axisX+5, axisY-((ySetter*i)*oneValueY));
      text(""+ySetter*i, axisX-20, axisY-((ySetter*i)*oneValueY)+5);
      println((ySetter*i)*oneValueY);
    }

    for (int i=1; i<=xPoints; i++) {
      line(axisX+(oneValueX*i), axisY-5, axisX+(oneValueX*i), axisY+5);
    }
  }
   String getBusinessName() {
   return businessName; 
 }
}