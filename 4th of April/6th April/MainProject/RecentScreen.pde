class RecentScreen {
  ArrayList wijList, addedWij;
  color background;
  int event, reviewNum;
  background backgroundTemplate;
  Widget red, green, next, prev;
  String heading;
  ArrayList<Review> reviewsArray;
  ArrayList<LinePlot> linePlotArray;
  ArrayList<Widget> wijlist;
  StarCounter starCounter;
  Review[] mostRecent;
  PImage star0;
  PImage star1;
  PImage star15;
  PImage star2;
  PImage star25;
  PImage star3;
  PImage star35;
  PImage star4;
  PImage star45;
  PImage star5;
  LinePlot linePlot;
  color normal, mouseMoved;

  RecentScreen(ArrayList wijList, background backgroundTemplate, Review[] mostRecent, int reviewNum) {
    this.wijList = wijList;
    this.backgroundTemplate = backgroundTemplate;
    this.mostRecent = mostRecent;
    this.reviewNum = reviewNum;
    wijList = new ArrayList();
    addedWij = new ArrayList();
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
    starImage=loadImage("star.gif");
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
    if (reviewNumDisplayed < 0) {
      reviewNumDisplayed = 0;
    }
    if (reviewNumDisplayed > mostRecent.length -1) {
      reviewNumDisplayed = mostRecent.length - 1; 
    }
  
    Review nextReview = (Review) mostRecent[reviewNumDisplayed];
  //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
   // String stars = nextReview.getStars();
    int stars = nextReview.getStars();
    //starCounter = new StarCounter(stars, star0, star1,star15, star2,star25,
 //star3,  star35, star4, star45, star5);
    nextReview.draw(200);
    //starCounter.draw(200);
    //linePlot.draw();
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