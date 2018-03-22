Table reviewTable;
userInput userText;
background backgroundTemplate;
//BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
//VScrollbar vs1;
String[] reviews, businessNames, userNames;
Review testReview, nextReview;
ArrayList<Review> reviewsArray;
int reviewNumDisplayed =0;
int screenInt = 1;
Widget widgetNext, widgetPrev, bizWidget, userWidget, reviewWidget;
ArrayList<Widget> widgetList;
PFont widgetFont;
float y = 100;
Screen currentScreen, businessScreen, userScreen, reviewScreen;
void setup () {
  starImage=loadImage("star.gif");
  size(1800, 1000);
  // reviewTable = loadTable("reviews_cleaned.csv", "header");
  // vs1 = new VScrollbar(SCREEN_X, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
  widgetFont = loadFont("SansSerif-14.vlw"); 
  textFont(widgetFont);
  widgetNext =new Widget(1500, 600, 100, 40, 
    "Next", color(220, 83, 0), widgetFont, EVENT_BUTTON1);
  widgetPrev = new Widget(700, 600, 100, 40, "Previous", color(135, 208, 250), widgetFont, EVENT_BUTTON2);
  bizWidget = new Widget(1000, 30, 100, 40, "Businesses", color(135, 208, 250), widgetFont, EVENT_BUTTON3);
  userWidget = new Widget(800, 30, 100, 40, "Users", color(135, 208, 250), widgetFont, EVENT_BUTTON4);
  reviewWidget = new Widget(600, 30, 100, 40, "Home", color(135, 208, 250), widgetFont, EVENT_BUTTON5);
  widgetList = new ArrayList<Widget>();
  widgetList.add(widgetNext); 
  widgetList.add(widgetPrev);
  widgetList.add(bizWidget);
  widgetList.add(userWidget);
  widgetList.add(reviewWidget);
  reviewsArray = new ArrayList<Review>();
  reviews = loadStrings("reviews_cleaned.csv");
  userText = new userInput();
  backgroundTemplate = new background();
  businessScreen = new Screen(userWidget, reviewWidget, widgetNext, widgetPrev);
  userScreen = new Screen(bizWidget, reviewWidget, widgetNext, widgetPrev);
  reviewScreen = new Screen (bizWidget, userWidget, widgetNext, widgetPrev);
  currentScreen = reviewScreen;
  println("there are " + reviews.length + " lines");
  for (int i = 1; i < reviews.length; i++) {
    String reviewLine = reviews[i];
    String reviewSplit[] = split(reviewLine, ",");
    String userID = reviewSplit[0];
    String userName = reviewSplit[1];
    String businessID = reviewSplit[2];
    String businessName = reviewSplit[3];
    String stars = reviewSplit[4];
    String date = reviewSplit[5];
    String review = reviewSplit[6];
    String useful = reviewSplit[7];
    String funny = reviewSplit[8];
    String cool = reviewSplit [9];
    Review newReview = new Review(userID, userName, businessID, businessName, stars, date, review, useful, funny, cool, i);
    reviewsArray.add(newReview);
  }
  if (reviewNumDisplayed < 0) {
    reviewNumDisplayed = 0;
  } 
  Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  //  barChart=new BarChartIndividual(nextReview);
  String stars = nextReview.getStars();
  int stars1 = nextReview.stringToInt(stars);
  starCounter = new StarCounter(stars1, starImage);
  // testReview = (Review) reviewArray.get(1);
  // nextReview = (Review) reviewArray.get(2);
  //  println(testReview.getUserName());
  // println(testReview.getBusinessName());
  //println(testReview.getReview());
  //println(nextReview.getReview());
  for (int i = 0; i < reviewsArray.size(); i++) {
    Review review = (Review) reviewsArray.get(i);
    int counter = 0;
    String businessName = review.getBusinessName();
    if (businessNames != null) {
      int count = 0;
      for (int index = 0; i < businessNames.length; i++) {
        if (businessName.equals(businessNames[index]) == false) {
          count++;
        }
      }
      if (count == 9) {
        businessNames[count] = businessName;
        counter++;
      }
    }
  }
}
void draw() {
  // float leftPos = vs1.getPos();
  backgroundTemplate.draw();
 // currentScreen.draw();
  userText.draw();
  userText.keyPressed();
  //  barChart.draw(800);
  starCounter.draw(800);
  // nextReview = (Review) reviewsArray.get(1);
  // nextReview.draw(-leftPos + 200);
  // testReview.draw(leftPos);
  // nextReview.draw(leftPos + 200);
  for ( int i =0; i < widgetList.size(); i ++) {
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  } 
  Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  nextReview.draw(300);
  int event;
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event == 1 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 32, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
    } else if (event == 2 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 19, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
    } else if (event == 3 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 10, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
    } else if (event == 4 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()){
      rect(aWidget.getX() + 30, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);    
    } else if (event == 5 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 28, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);   
    }
  }
}
void mousePressed() {
  int event;
  for ( int i =0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (reviewNumDisplayed  < 0) {
      reviewNumDisplayed = 0;
    }
    switch(event) {
    case EVENT_BUTTON1:
      println("Next");
      reviewNumDisplayed++;
      break;
    case EVENT_BUTTON2:
      println("Previous");
      reviewNumDisplayed --;
      break;
    case EVENT_BUTTON3:
      println("Businesses");
      screenInt = 2;
      currentScreen = businessScreen;
      break;
    case EVENT_BUTTON4:
      screenInt = 3;
      currentScreen = userScreen;
     case EVENT_BUTTON5:
      screenInt = 1;
      currentScreen = reviewScreen;
    }
  }
}