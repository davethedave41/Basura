class Review {
  color headerColor, textColor;
  PFont labelFont,textFont;
  String dateLabel;
  String userNameLabel;
  String idLabel;
  String reviewLabel;
  String userID, userName, businessID, businessName, date, review;
  int i,useful,funny,cool,stars;
  Review(String userID, String userName, String businessID, String businessName, int stars, 
    String date, String review, int useful, int funny, int cool, int i) {

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
  
  int getStars() {
    return stars;
  }
  
  String getDate() {
    return date;
  }
  
  String getReview() {
    return review;
  }
  
  int getUseful() {
 return useful;
  }
  
  int getFunny() {
    return funny;
  }
  
  int getCool() {
    return cool;
  }
  
  String toString() {
    reviewLabel = "UserID: " +userID + " Username: " + userName + "\nBusinessID: " + businessID + " Business Name: " + businessName
      + "\nDate: " + date + "\n" + reviewToString(); 
    return reviewLabel;
  }
  
  String reviewToString() {
    String reviewLines[] = review.split( "[.|,|?|!]+");
    String reviewToString = "";
    for (int i = 0; i < reviewLines.length; i++) {
      reviewToString += "\n" + reviewLines[i] + ".";
    }
    return reviewToString;
  }
  
   String userString() {
   userNameLabel = "Posted by ";  
   return userNameLabel;
  }
  
  String dateString() {
   dateLabel = "Posted on ";
   return dateLabel;
    
  }
  
  String idLabel() {
    idLabel = "User ID: " + userID + "\nBusiness ID:" + businessID;
    return idLabel;
     
  }
  
  int getI() {
    return i;
  }
  
  void draw(float y) {
    if (y < 150) {
      fill(56, 90, 94);
    } else fill(0);
    textFont = loadFont("SansSerif-14.vlw");
    labelFont = loadFont("CopperplateGothic-Bold-18.vlw");
    headerColor = color(2, 183, 201);
    textColor = color(0);
    textFont(labelFont);
    textAlign(CENTER);
    textSize(25);
    fill(headerColor);
    text(businessName, REVIEW_X_POS, y);
    textSize(18);
    text(userString(), REVIEW_X_POS - 200, y + 50, headerColor);
    textFont(textFont);
    fill(textColor);
    text(userName, REVIEW_X_POS - 100, y + 50, textColor); 
    textFont(labelFont);
    fill(headerColor);
    text(dateString(), REVIEW_X_POS + 100, y + 50, headerColor);
    textFont(textFont);
    fill(textColor);
    text(date, REVIEW_X_POS + 200, y + 50, textColor);
    textAlign(CENTER);
    text(reviewToString(), REVIEW_X_POS, y + 100, textColor);
  
    
    /* text("User ID : " + userID + "\nUsername : " + userName + "\nBusiness ID : " + businessID + 
     "\nBusiness Name : " + businessName + "\nStars : " + stars + "\nDate : " + date 
     + "\nReview : \n" + review + "\nUseful : " + useful
     + "\nFunny : " + funny + "\nCool : " + cool, TEXT_X, TEXT_Y); */

    //   text(reviewToString(), 10, 200);
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