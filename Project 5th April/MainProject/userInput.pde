class userInput { 
  ArrayList<Review> reviews;
  ArrayList<String> businessNames, userNames;
  String letters = " ";
  String b = "Search ";
  int x = 1200;
  int y = 30;
  int barWidth = 220;
  Screen results;
  userInput() {
  }
  userInput(int x, int y, int barWidth, ArrayList reviews, ArrayList businessNames, ArrayList userNames) {
    this.x = x;
    this.y = y;
    this.barWidth = barWidth;
    this.reviews = reviews;
    this.businessNames = businessNames;
    this.userNames = userNames;
  }


  void setup() {
    textSize(3);
    //textAlign(CENTER);
  }  

  void draw() {
    //textAlign(CENTER);
    fill(255);
    rect(x, y, barWidth, 50);
    textSize(15);
    textAlign(CENTER);
    fill(24);
    text(letters, 1300, 50);//130, 40);
    //String b = "Search ";
    //textSize(15);
    //fill(24);
    //textAlign(CENTER);
    //text(b, 850, 50);
  }

  void userKeyPressed() {
    textSize(15);
    fill(24);
    textAlign(CENTER);
    text(b, 1500, 50);
    if ((key == ENTER) || (key == RETURN) || (key == BACKSPACE)) {
      letters = letters.toLowerCase();
      println(letters);  // Print to console to see input
      letters = "";  // Clear the variable
    } else if ((key > 31) && (key != CODED)) { 
      // If the key is alphanumeric, add it to the String
      b = "";
      letters = letters + key;
    }
  }
  void result() {
    if (key == ENTER) {
      for (int i = 0; i < businessNames.size(); i++) {
        String businessName = getRidOfQuotation(businessNames.get(i));
        if (businessName.contains(letters)) {
          text(businessNames.get(i), 1600, 300);
        }
      }
      for (int i = 0; i < userNames.size(); i++) {
        if (userNames.get(i).contains(letters)) {
          text(userNames.get(i), 1600, 300);
        }
      }
    }
  }
}

/*
  
 
 */