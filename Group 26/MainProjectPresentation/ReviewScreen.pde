class ReviewScreen { //<>// //<>// //<>//
  ArrayList wijList, addedWij;
  color background, mouseMoved, normal;
  int event, reviewNum;
  background backgroundTemplate;
  Widget red, green, next, prev;
  String heading;
  ArrayList<Review> reviewsArray, displayReviewsArray;
  ArrayList<LinePlot> linePlotArray;
  StarCounter starCounter;
  PImage starImage;
  LinePlot linePlot;
  String reviewNameFilter;
  float leftPos;

  ReviewScreen(ArrayList wijList, background backgroundTemplate, ArrayList<Review> reviewsArray, int reviewNum, ArrayList linePlotArray) {
    this.wijList = wijList;
    this.backgroundTemplate = backgroundTemplate;
    this.reviewsArray = reviewsArray;
    //println("Setting reviewsArray : " + reviewsArray);
    this.reviewNum = reviewNum;
    this.linePlotArray = linePlotArray;
    wijList = new ArrayList();
    addedWij = new ArrayList();
    starImage=loadImage("star.gif");
    wijList.add(red);
    wijList.add(green);
    wijList.add(next);
    wijList.add(prev);
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
    displayReviewsArray = reviewsArray;
    leftPos = vs1.getPos();
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
    if (displayReviewsArray.isEmpty()) {
      return;
    }
    if (reviewNumDisplayed < 0) {
      reviewNumDisplayed = 0;
    }
    if (reviewNumDisplayed > (displayReviewsArray.size() -1)) {
      reviewNumDisplayed = displayReviewsArray.size() - 1;
    }
    Review nextReview = (Review) displayReviewsArray.get(reviewNumDisplayed);
    //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
    // String stars = nextReview.getStars();
    int stars = nextReview.getStars();
    starCounter = new StarCounter(stars, starImage);
    //  nextReview.draw(250);
    starCounter.draw(200);
    // linePlot.draw();
    // println("Use review filter : " + reviewNameFilter);
    // vs1.update();
    if (reviewNameFilter != null) {
      filterReviews(reviewNameFilter);
    }
    Review newReview = null;
    if (!displayReviewsArray.isEmpty()) {
      newReview = (Review) displayReviewsArray.get(reviewNumDisplayed);
      //  println("Showing review for " + nextReview.getBusinessName());
    }
    if (lineplot != null) {
     //lineplot.draw(); 
    }
   /* for (int i = 0; i < linePlotArray.size(); i++) {
     if (reviewsArray.get(reviewNumDisplayed).getBusinessName().equals(linePlotArray.get(i).getBusinessName())) {
         lineplot = linePlotArray.get(i);
         lineplot.draw();
     }
    } */

    /* for (int i = 0; i < linePlotArray.size(); i++) {
     if (reviewsArray.get(reviewNumDisplayed).getBusinessName().equals(linePlotArray.get(i).getBusinessName())) {
     linePlotArray.get(i).draw();
     // lineplot.draw();
     }
     } */



    //  LinePlot linePlot = (LinePlot) linePlotArray.get(reviewNumDisplayed);
    // String stars = nextReview.getStars();
    // int stars = nextReview.getStars();

    starCounter = new StarCounter(stars, starImage);
    if (newReview != null) {
      nextReview.draw(200);
      //   starCounter.draw(200);
      //   linePlot.draw();
    /*  lineplot = makeLinePlot(nextReview);
      if (lineplot != null) {
        lineplot.draw();
      }*/
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
    //println("Set review filter : " + reviewNameFilter);
  }

  ArrayList filterReviews(String name ) {
    //Pass in the name of the business 
    //Loop through table
    //If business name matches string put review into an arrayList
    displayReviewsArray = new ArrayList<Review>();
    for (int i = 1; i < reviewsArray.size(); i++) {
      Review testReview = (Review) reviewsArray.get(i);
      if ( name.trim().equals(testReview.getBusinessName().trim())) {
        displayReviewsArray.add(testReview);
      } else if (name.equals(testReview.getUserName())) {
        displayReviewsArray.add(testReview);
      }
    }
    return displayReviewsArray;
  }
  LinePlot filterLinePlot(String name) {
    for(int i =0; i< linePlotArray.size(); i++) {
      lineplot = linePlotArray.get(i);
      if (name.trim().equals(lineplot.getBusinessName().trim())) {
        return lineplot; 
      }
    }
    return null;
  }
    Review currentReviewDisplayed() {
    return nextReview; 
  }
 /* LinePlot makeLinePlot(Review nextReview) {

    int[] statistics=findReviews(nextReview.getBusinessName());
    lineplot=new LinePlot(50, 60, 10, 100, 900, 700, 500, "Review Activity", "Years", "Reviews", 1, 11, 10, 4, statistics); 
    return linePlot;
  }*/
}