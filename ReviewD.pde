PFont textFont;
String reviewLabel;
class Review {
  String userID, userName, businessID, businessName, date, text; 
  int useful, funny, cool, stars;
  Review(String userID, String userName, String businessID, String businessName, int stars, 
    String date, String text, int useful, int funny, int cool) {

    this.userID = userID;
    this.userName = userName;
    this.businessID = businessID; 
    this.businessName = businessName;
    this.stars = stars;
    this.date = date;
    this.text = text;
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
  int getStars() {
    return stars;
  }
  String getDate() {
    return date;
  }
  String getText() {
    return text;
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
      + "\nStars: " + stars + "\nDate: " + date + "\n" + textToString() + "\nUseful: "  + useful + " Funny: " + funny + " Cool: " + cool; 
    return reviewLabel;
  }
  String textToString() {
    String reviewLines[] = split(text, ".");
    String textToString = null;
    for (int i = 0; i < reviewLines.length; i++) {
      if (i%2 > 0) {
        textToString += "\n" + reviewLines[i] + " ";
      } else textToString += reviewLines[i] + " ";
    }
    return textToString;
  }
  void draw() {
    textFont = loadFont("AgencyFB-Reg-14.vlw");
    text(toString(), 10, 100);
    //  text(textToString(), 10, 200);
  }
}