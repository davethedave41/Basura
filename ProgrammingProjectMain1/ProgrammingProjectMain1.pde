int linesLength; //<>//
String[] lines;
PFont reviewFont;
String userID, userName, businessID, businessName, stars, date, review, useful, funny, cool;
Review reviewObj;
ArrayList<Review> reviews;
int reviewNumDisplayed = 0;

void setup() {
  size(1000, 800);
  background(0);
  reviewFont = loadFont("Dialog-12.vlw");
  //textFont(reviewFont);
  reviews = new ArrayList<Review>();
  //String reviewsArray[] = loadStrings("reviews.csv");
  Table table = loadTable("reviews.csv", "header, csv");
  int reviewCount = table.getRowCount();
  println("Count " + reviewCount);
  for (int i=0; i < reviewCount; i++) {
    TableRow row = table.getRow(i);
    //printArray(row);
    userID = row.getString("user_id");
    userName = row.getString("user_name");
    businessID = row.getString("business_id");
    businessName = row.getString("business_name");
    stars = row.getString("stars");
    date = row.getString("date");
    review = row.getString("text");
    useful = row.getString("useful");
    funny = row.getString("funny");
    cool = row.getString("cool");
    reviewObj = new Review(userID, userName, businessID, businessName, stars, date, review, useful, funny, cool, i);
    reviews.add(reviewObj);
  }
}

void mousePressed() {
  reviewNumDisplayed++;
}

void draw() {
  textFont(reviewFont);
  Review review = reviews.get(reviewNumDisplayed);
  review.draw(); //<>//
}