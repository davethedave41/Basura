class Review {
  PFont textFont;
  int i;
  String userID, userName, businessID, businessName, stars, date, review, useful, funny, cool;
  Review(String userID, String userName, String businessID, String businessName, String stars, String date, 
    String review, String useful, String funny, String cool,  int i) {
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
  void draw() {
    text(userID + "" + userName + " " + businessID + " " + businessName + " " + stars + " " + date + " " + review + " " + useful
        + " " + funny + " " + cool, TEXT_X, TEXT_Y + (i*10));
  }
}