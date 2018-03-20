PFont textFont;
int i;
String reviewLabel;
class Review {
  String userID, userName, businessID, businessName, stars, date, review, useful, funny, cool;
  int i;
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
  int getUseful() {
    int usefulInt = 0;
    if (this.useful.equals("0")) {
      usefulInt = 0;
    } else if (this.useful.equals("1")) {
      usefulInt = 1; 
    } else if (this.useful.equals("2")) {
      usefulInt = 2; 
    } else if (this.useful.equals("3")) {
      usefulInt = 3; 
    } else if (this.useful.equals("4")) {
      usefulInt = 4; 
    } else if (this.useful.equals("5")) {
      usefulInt = 5; 
    }
    return usefulInt;
  }
  int getFunny() {
     int funnyInt = 0;
    if (this.funny.equals("0")) {
      funnyInt = 0;
    } else if (this.funny.equals("1")) {
      funnyInt = 1; 
    } else if (this.funny.equals("2")) {
      funnyInt = 2; 
    } else if (this.funny.equals("3")) {
      funnyInt = 3; 
    } else if (this.funny.equals("4")) {
      funnyInt = 4; 
    } else if (this.funny.equals("5")) {
      funnyInt = 5; 
    }
    return funnyInt;
  }
  int getCool() {
     int coolInt = 0;
    if (this.cool.equals("0")) {
      coolInt = 0;
    } else if (this.cool.equals("1")) {
      coolInt = 1; 
    } else if (this.cool.equals("2")) {
      coolInt = 2; 
    } else if (this.cool.equals("3")) {
      coolInt = 3; 
    } else if (this.cool.equals("4")) {
      coolInt = 4; 
    } else if (this.cool.equals("5")) {
      coolInt = 5; 
    }
    return coolInt;
  }
  String toString() {
    reviewLabel = "UserID: " +userID + " Username: " + userName + "\nBusinessID: " + businessID + " Business Name: " + businessName
      + "\nDate: " + date + "\n" + reviewToString(); 
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
    if (y < 150) {
      fill(56, 90, 94);
    } else fill(0);
    textFont = loadFont("SansSerif-14.vlw");
    text(toString(), REVIEW_X_POS, y);
    /* text("User ID : " + userID + "\nUsername : " + userName + "\nBusiness ID : " + businessID + 
        "\nBusiness Name : " + businessName + "\nStars : " + stars + "\nDate : " + date 
        + "\nReview : \n" + review + "\nUseful : " + useful
        + "\nFunny : " + funny + "\nCool : " + cool, TEXT_X, TEXT_Y); */
   
     text(reviewToString(), 10, 200);
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
