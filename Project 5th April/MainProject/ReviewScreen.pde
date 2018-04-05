class ReviewScreen {
  ArrayList wijList, addedWij;
  color background, mouseMoved, normal;
  int event, reviewNum;
  background backgroundTemplate;
  Widget red, green, next, prev;
  String heading;
  ArrayList<Review> reviewsArray;
  ArrayList<Review> displayReviewsArray;
  ArrayList<LinePlot> linePlotArray;
  StarCounter starCounter;
  PImage starImage;
  LinePlot linePlot;
  VScrollbar scrollBar;
  String reviewNameFilter = null;

  ReviewScreen(ArrayList wijList, background backgroundTemplate, ArrayList<Review> reviewsArray, int reviewNum, LinePlot linePlot) {
    this.wijList = wijList;
    this.backgroundTemplate = backgroundTemplate;
    this.reviewsArray = reviewsArray;
    this.displayReviewsArray = reviewsArray;
    this.reviewNum = reviewNum;
    this.linePlot = linePlot;
    wijList = new ArrayList();
    addedWij = new ArrayList();
    starImage=loadImage("star.gif");
    wijList.add(red);
    wijList.add(green);
    wijList.add(next);
    wijList.add(prev);
    this.scrollBar = scrollBar;
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
  }
  /* ReviewScreen(Widget red, Widget green, Widget next, Widget prev, background backgroundTemplate, ArrayList<Review> reviewsArray, int reviewNum, LinePlot linePlot) {
    this.red = red;
    this.green = green;
    this.next = next;
    this.prev = prev;
    this.backgroundTemplate = backgroundTemplate;
    this.reviewsArray = reviewsArray;
    this.displayReviewsArray = reviewsArray;
    this.reviewNum = reviewNum;
    this.linePlot = linePlot;
    wijList = new ArrayList();
    addedWij = new ArrayList();
    starImage=loadImage("star.gif");
    wijList.add(red);
    wijList.add(green);
    wijList.add(next);
    wijList.add(prev);
  }*/
  void draw() {
    scrollBar = new VScrollbar( 950,  10,  50,  70,  70);
    scrollBar.update();
    scrollBar.display();
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
        aWidget.setWidgetColor(mouseMoved);
      } else if (event == 2 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 3 && event!=1) {
         aWidget.setWidgetColor(mouseMoved);
      } else if (event == 3 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 2 && event!=1) {
        aWidget.setWidgetColor(mouseMoved);
      } else if (event == 4 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 5 && event != 2 && event!=1) {
        aWidget.setWidgetColor(mouseMoved);
      } else if (event == 5 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=8 && event !=9) {
        aWidget.setWidgetColor(mouseMoved);
      } else if (event == 8 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=5 && event !=9) {
        aWidget.setWidgetColor(mouseMoved);
      } else if (event == 9 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=8 && event !=5) {
        aWidget.setWidgetColor(mouseMoved);
      } else aWidget.setWidgetColor(normal);
    }
  /*  Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
   // String stars = nextReview.getStars();
    int stars = nextReview.getStars();
    starCounter = new StarCounter(stars, starImage);
    nextReview.draw(200);
    starCounter.draw(200);
    linePlot.draw();
  }*/
   println("Use review filter : " + reviewNameFilter);

    if (reviewNameFilter != null) {
      filterReviews(reviewNameFilter);
    }
    Review nextReview = null;
    if (!displayReviewsArray.isEmpty()) {
      nextReview = (Review) displayReviewsArray.get(reviewNumDisplayed);
      println("Showing review for " + nextReview.getBusinessName());
    }

    //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
    // String stars = nextReview.getStars();
   int stars = nextReview.getStars();
   
   starCounter = new StarCounter(stars, starImage);
    if (nextReview != null) {
      nextReview.draw(200);
   //   starCounter.draw(200);
      linePlot.draw();
    }
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
   void setReviewNameFilter(String name) {
    this.reviewNameFilter = name;  
    println("Set review filter : " + reviewNameFilter);
  }
   
  void filterReviews(String name ) {
    //Pass in the name of the business 
    //Loop through table
    //If business name matches string put review into an arrayList
    displayReviewsArray = new ArrayList<Review>();
    for (int i = 1; i < reviewsArray.size(); i++) {
      Review testReview = (Review) reviewsArray.get(i);
      if ( name.trim().equals(testReview.getBusinessName().trim())) {
        displayReviewsArray.add(testReview);
      }
    }
  }
}