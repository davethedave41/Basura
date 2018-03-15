Table reviewTable;
userInput userText;
background backgroundTemplate;
BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
VScrollbar vs1;
String[] reviews;
Review testReview, nextReview;
ArrayList<Review> reviewsArray;
int reviewNumDisplayed =0;
float y = 100;
void setup () {
  starImage=loadImage("star.gif");
  size(1800, 1080);
  reviewTable = loadTable("reviews_cleaned.csv", "header");
  vs1 = new VScrollbar(SCREEN_X, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
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
  testReview = (Review) reviewsArray.get(1);
  barChart=new BarChartIndividual(testReview);
  String stars = testReview.getStars();
  int stars1 = testReview.stringToInt(stars);
  starCounter = new StarCounter(stars1, starImage);
  // testReview = (Review) reviewArray.get(1);
  // nextReview = (Review) reviewArray.get(2);
  //  println(testReview.getUserName());
  // println(testReview.getBusinessName());
  //println(testReview.getReview());
  //println(nextReview.getReview());
}
void draw() {
  float leftPos = vs1.getPos();
  backgroundTemplate.draw();
  userText.draw();
  userText.keyPressed();
  barChart.draw(-leftPos + 800);
  starCounter.draw(-leftPos + 800);
// nextReview = (Review) reviewsArray.get(1);
 // nextReview.draw(-leftPos + 200);
    // testReview.draw(leftPos);
    // nextReview.draw(leftPos + 200);
  Review review = reviewsArray.get(reviewNumDisplayed);
  review.draw(leftPos);
  vs1.update();
  vs1.display();
}
void mousePressed(){
  reviewNumDisplayed++;
}