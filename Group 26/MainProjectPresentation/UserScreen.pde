class UserScreen {
  ArrayList<Review> reviews, revisedReviews;
  ArrayList<Widget> wijList;
  background template;
  String username;
  int event, reviewNum;
  StarCounter starCounter;
  PImage starImage;
  color mouseMoved, normal;
  VScrollbar scroll;
  float leftpos;

  UserScreen(ArrayList<Review> reviews, ArrayList<Widget> wijList, background template, String username) {
    this.reviews = reviews;
    this.wijList = wijList;
    this.template = template;
    this.username = username;
    revisedReviews = new ArrayList<Review>();
    for (int i = 0; i < reviews.size(); i++) {
      Review review = (Review) reviews.get(i);
      if (review.getUserName().equals(this.username)) {
        revisedReviews.add(review);
      }
    }
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
   // scroll = new VScrollbar(1750, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
   // leftpos = scroll.getPos();
  }
  void draw() {
    template.draw();
    for (int i = 0; i < wijList.size(); i++) {
      Widget aWij = (Widget) wijList.get(i);
      textSize(16);
      aWij.draw();
    }

    for (int i = 0; i<wijList.size(); i++) {
      Widget aWidget = (Widget) wijList.get(i);
      if (event == aWidget.getEvent(mouseX, mouseY)) {
        aWidget.setWidgetColor(normal);
      } else aWidget.setWidgetColor(mouseMoved);
    }
  //  textSize(50);
   // PFont text = loadFont(
   // scroll.update();
   // scroll.display();
    /*if (revisedReviews.size() == 1) {
      Review nextReview = revisedReviews.get(0); 
       if (username.equals("Renee") == false && nextReview.getUserName().equals("Renee") == false && username.equals("Nicholas") == false && nextReview.getUserName().equals("Nicholas") == false) {
      nextReview.draw(200);
      }
    }
    if (reviewNumDisplayed < revisedReviews.size()) {
      Review nextReview = revisedReviews.get(reviewNum);
      if (username.equals("Renee") == false && nextReview.getUserName().equals("Renee") == false && username.equals("Nicholas") == false && nextReview.getUserName().equals("Nicholas") == false) {
      nextReview.draw(200);
      }
    } */
   // Review nextReview = (Review) revisedReviews.get(reviewNum);
   // nextReview.draw(200);
    //  int stars = nextReview.getStars();
    //  starCounter = new StarCounter(stars, starImage);
  
   // Review nextReview = (Review) revisedReviews.get(reviewNum);
   // nextReview.draw(200);
      
    
    // starCounter.draw(200);
  }
  void userProfileMousePress() {
    int events;
    for (int i = 0; i < 2; i++) {
      Widget aWidget = (Widget) wijList.get(i);
      events = aWidget.getEvent(mouseX, mouseY);
      if (reviewNum < 0) {
        reviewNum = 0;
      }
      switch(events) {
      case EVENT_BUTTON1:
        println("Next");
        reviewNum++;
        break;
      case EVENT_BUTTON2:
        println("Previous");
        reviewNum--;
        break;
      }
    }
  }
}