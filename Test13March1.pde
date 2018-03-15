VScrollbar vs1;
String[] reviews;
Review testReview, nextReview;
ArrayList<Review> reviewArray;
void setup () {
 
  size(800, 800);
  vs1 = new VScrollbar(SCREEN_X, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
  reviewArray = new ArrayList<Review>();
  reviews = loadStrings("reviews_cleaned.csv");
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
    Review newReview = new Review(userID, userName, businessID, businessName, stars, date, review, useful, funny, cool);
    reviewArray.add(newReview);
  }
 // testReview = (Review) reviewArray.get(1);
 // nextReview = (Review) reviewArray.get(2);
//  println(testReview.getUserName());
 // println(testReview.getBusinessName());
  //println(testReview.getReview());
  //println(nextReview.getReview());
  
}
void draw() {
   background(0);
   float leftPos = vs1.getPos();
   for (int i = 0; i < 10; i++) {
     nextReview = (Review) reviewArray.get(i);
     nextReview.draw(leftPos + 200*i);
  // testReview.draw(leftPos);
  // nextReview.draw(leftPos + 200);
   }
   vs1.update();
   vs1.display();

}
