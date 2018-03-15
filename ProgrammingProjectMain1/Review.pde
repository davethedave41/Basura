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
  
  String getText() {
    return userID + " " + userName;
  }
  
  void draw() {
     fill(255);
     background(0);
    text("User ID : " + userID + "\nUsername : " + userName + "\nBusiness ID : " + businessID + 
        "\nBusiness Name : " + businessName + "\nStars : " + stars + "\nDate : " + date 
        + "\nReview : \n" + review + "\nUseful : " + useful
        + "\nFunny : " + funny + "\nCool : " + cool, TEXT_X, TEXT_Y);
}
}