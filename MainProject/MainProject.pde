Table reviewTable;
userInput userText;
background backgroundTemplate;
BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
//VScrollbar vs1;
String[] reviews;
Review testReview, nextReview;
ArrayList<Review> reviewsArray;
int reviewNumDisplayed =0;
Widget widgetNext, widgetPrev;
ArrayList<Widget> widgetList;
PFont widgetFont;
float y = 100;
void setup () {
  starImage=loadImage("star.gif");
  size(1280, 800);
 // reviewTable = loadTable("reviews_cleaned.csv", "header");
  // vs1 = new VScrollbar(SCREEN_X, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
  widgetFont = loadFont("SansSerif-14.vlw"); 
  textFont(widgetFont);
  widgetNext =new Widget(750, 600, 100, 40, 
    "Next", color(255, 0, 0), widgetFont, EVENT_BUTTON1);
  widgetPrev = new Widget(250, 600, 100, 40, "Previous", color(0, 0, 255), widgetFont, EVENT_BUTTON2);
  widgetList = new ArrayList<Widget>();
  widgetList.add(widgetNext); 
  widgetList.add(widgetPrev);
  reviewsArray = new ArrayList<Review>();
  reviews = loadStrings("reviews_cleaned.csv");
  userText = new userInput();
  backgroundTemplate = new background();
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
  barChart=new BarChartIndividual(nextReview);
  String stars = nextReview.getStars();
  int stars1 = nextReview.stringToInt(stars);
  starCounter = new StarCounter(stars1, starImage);
  // testReview = (Review) reviewArray.get(1);
  // nextReview = (Review) reviewArray.get(2);
  //  println(testReview.getUserName());
  // println(testReview.getBusinessName());
  //println(testReview.getReview());
  //println(nextReview.getReview());
}
void draw() {
  // float leftPos = vs1.getPos();
  backgroundTemplate.draw();
  userText.draw();
  userText.keyPressed();
  barChart.draw(800);
  starCounter.draw(800);
  // nextReview = (Review) reviewsArray.get(1);
  // nextReview.draw(-leftPos + 200);
  // testReview.draw(leftPos);
  // nextReview.draw(leftPos + 200);
  for ( int i =0; i < widgetList.size(); i ++) {
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
 
   nextReview.draw(200);
}
void mousePressed() {
  int event;
  for ( int i =0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      println("Next");
      reviewNumDisplayed++;
      break;
    case EVENT_BUTTON2:
      println("Previous");
      reviewNumDisplayed --;
      break;
    }
  }
}
