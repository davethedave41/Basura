PFont textFont;
String reviewLabel;
class Review {
  String userID, userName, businessID, businessName, stars, date, review, useful, funny, cool;
  Review(String userID, String userName, String businessID, String businessName, String stars, 
    String date, String review, String useful, String funny, String cool) {

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
      + "\nStars: " + stars + "\nDate: " + date + "\n" + reviewToString() + "\nUseful: "  + useful + " Funny: " + funny + " Cool: " + cool; 
    return reviewLabel;
  }
  String reviewToString() {
    String reviewLines[] = split(review, ".");
    String reviewToString = null;
    for (int i = 0; i < reviewLines.length; i++) {
      if (i%2 > 0) {
        reviewToString += "\n" + reviewLines[i] + " ";
      } else reviewToString += reviewLines[i] + " ";
    }
    return reviewToString;
  }
  void draw() {
    textFont = loadFont("AgencyFB-Reg-14.vlw");
    text(toString(), 10, 100);
  //  text(reviewToString(), 10, 200);
  }
}