int linesLength;
String[] lines;
String userID, userName, businessID, businessName, stars, date, review, useful, funny, cool;
Review reviewObj;
ArrayList<Review> reviews;
void setup() {
  background(0);
  size(2000, 1000);
  reviews = new ArrayList<Review>();
  String reviewsArray[] = loadStrings("reviews.csv");
  for (int i=0; i < reviewsArray.length; i++) {
    //println(reviewsArray[i]);
    if (i == 6) {
      println(reviewsArray[6]);
    } else {
      String lines = reviewsArray[i];
      String[] reviewsSplit = split(lines, ",");
      printArray(reviewsSplit);
      userID = reviewsSplit[0];
      userName = reviewsSplit[1];
      businessID = reviewsSplit[2];
      businessName = reviewsSplit[3];
      stars = reviewsSplit[4];
      date = reviewsSplit[5];
      review = reviewsSplit[6];
      useful = reviewsSplit[7];
      funny = reviewsSplit[8];
      cool = reviewsSplit[9];
      reviewObj = new Review(userID, userName, businessID, businessName, stars, date, review, useful, funny, cool, i);
      reviews.add(reviewObj);
    }
  }
}
void draw() {
  for (int i = 0; i < linesLength; i++) {
    reviewObj = (Review) reviews.get(i);
    reviewObj.draw();
  }
}