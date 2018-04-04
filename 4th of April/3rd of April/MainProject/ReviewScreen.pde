class ReviewScreen {
  ArrayList wijList, addedWij;
  color background, mouseMoved, normal;
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
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
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
    for (int i = 0; i<wijList.size(); i++) {
      Widget aWidget = (Widget) wijList.get(i);
       if (event == aWidget.getEvent(mouseX, mouseY)) {
        aWidget.setWidgetColor(normal);
      } else aWidget.setWidgetColor(mouseMoved);
    }
    Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
   // String stars = nextReview.getStars();
    int stars = nextReview.getStars();
    starCounter = new StarCounter(stars, starImage);
    nextReview.draw(200);
    starCounter.draw(200);
    linePlot.draw();
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