PFont textFont;
int i;
String reviewLabel;
class Review {
  String userID, userName, businessID, businessName, stars, date, review, useful, funny, cool;
  Review(String userID, String userName, String businessID, String businessName, String stars, 
    String date, String review, String useful, String funny, String cool, int i) {

    this.userID = userID;
    this.userName = userName;
    this.businessID = businessID; 
    this.businessName = businessName;
    this.stars = stars;
    this.date = date;
    this.review = review;
    this.useful = useful;
    this.funny = funny;
    this.cool = cool;
    this.i = i;
  }
  String getUserID () {
    return userID;
  }
  String getUserName() {
    return userName;
  }
  String getBusinessID() {
    return businessID;
  }
  String getBusinessName() {
    return businessName;
  }
  String getStars() {
    return stars;
  }
  String getDate() {
    return date;
  }
  String getReview() {
    return review;
  }
  String getUseful() {
    return useful;
  }
  String getFunny() {
    return funny;
  }
  String getCool() {
    return cool;
  }
  String toString() {
    reviewLabel = "UserID: " +userID + " Username: " + userName + "\nBusinessID: " + businessID + " Business Name: " + businessName
      + "\nStars: " + stars + "\nDate: " + date + "\n" + reviewToString(); 
    return reviewLabel;
  }
  String reviewToString() {
    String reviewLines[] = split(review, ".");
    String reviewToString = "";
    for (int i = 0; i < reviewLines.length; i++) {
      reviewToString += "\n" + reviewLines[i] + ".";
    }
    return reviewToString;
  }
  void draw(float y) {
    fill(0);
    textFont = loadFont("SansSerif-14.vlw");
    text(toString(), 500, y);
   
    //  text(reviewToString(), 10, 200);
  }
  int stringToInt(String number) {
    int newNumber = 0;
    if (number.equals("1")) {
      newNumber = 1;
    } else if (number.equals("2")) {
      newNumber = 2;
    } else if (number.equals("3")) {
      newNumber = 3;
    } else if (number.equals("4")) {
      newNumber = 4;
    } else if (number.equals("5")) {
      newNumber = 5;
    }
    return newNumber;
  }
}