class UserScreen {
  ArrayList<Review> reviews, revisedReviews;
  ArrayList<Widget> wijList;
  background template;
  String username;
  int event, reviewNum;
  StarCounter starCounter;
  PImage starImage;
  color mouseMoved, normal;

  UserScreen(ArrayList<Review> reviews, ArrayList<Widget> wijList, background template, String username) {
    this.reviews = reviews;
    this.wijList = wijList;
    this.template = template;
    this.username = username;
    revisedReviews = new ArrayList<Review>();
    for (int i = 0; i < reviews.size(); i++) {
      Review review = (Review) reviews.get(i);
      if (review.getUserName().equals(username)) {
        revisedReviews.add(review);
      }
    }
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
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
    Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
    int stars = nextReview.getStars();
    starCounter = new StarCounter(stars, starImage);
    nextReview.draw(200);
    starCounter.draw(200);
  }
}