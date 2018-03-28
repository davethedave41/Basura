class ReviewScreen {
  ArrayList wijList, addedWij;
  color background;
  int event, reviewNum;
  background backgroundTemplate;
  Widget red, green, next, prev;
  String heading;
  ArrayList<Review> reviewsArray;
  ArrayList<LinePlot> linePlotArray;
  StarCounter starCounter;
  PImage starImage;
  LinePlot linePlot;

  ReviewScreen(ArrayList wijList, background backgroundTemplate, ArrayList<Review> reviewsArray, int reviewNum, LinePlot linePlot) {
    this.wijList = wijList;
    this.backgroundTemplate = backgroundTemplate;
    this.reviewsArray = reviewsArray;
    this.reviewNum = reviewNum;
    this.linePlot = linePlot;
    wijList = new ArrayList();
    addedWij = new ArrayList();
    starImage=loadImage("star.gif");
    wijList.add(red);
    wijList.add(green);
    wijList.add(next);
    wijList.add(prev);
  }
  void draw() {
    backgroundTemplate.draw();
    for (int i = 0; i < wijList.size(); i++) {
      Widget aWij = (Widget) wijList.get(i);
      textSize(16);
      aWij.draw();
    }
    if (addedWij != null) {
      for (int i = 0; i < addedWij.size(); i++) {
        Widget aWij = (Widget) wijList.get(i);
        aWij.draw();
      }
    }
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (event == 1 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 3 && event!=2) {
        rect(aWidget.getX() + 32, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 2 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 3 && event!=1) {
        rect(aWidget.getX() + 19, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 3 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 2 && event!=1) {
        rect(aWidget.getX() + 10, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 4 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 5 && event != 2 && event!=1) {
        rect(aWidget.getX() + 30, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 5 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=8 && event !=9) {
        rect(aWidget.getX() + 28, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 8 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=5 && event !=9) {
        rect(aWidget.getX() + 25, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 9 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=8 && event !=5) {
        rect(aWidget.getX() + 36, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      }
    }
    Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
   // String stars = nextReview.getStars();
    int stars = nextReview.getStars();
    starCounter = new StarCounter(stars, starImage);
    nextReview.draw(200);
    starCounter.draw(200);
   // linePlot.draw();
  }
  void addWidget() {
    int count = 0;
    Widget aWij = new Widget(700, 600, 100, 40, "Previous", color(135, 208, 250), widgetFont, EVENT_BUTTON2);
    addedWij.add(aWij);
    count++;
  }
  color getBackground() {
    return background;
  }
}