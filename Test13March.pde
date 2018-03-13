String[] reviews;
ArrayList<Review> reviewArray;
void setup () {
  background(0);
  size(1000, 1000);
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
  Review testReview = (Review) reviewArray.get(1);
  println(testReview.getUserName());
  println(testReview.getBusinessName());
  println(testReview.getReview());
  testReview.draw();
}