Table reviewTable;
userInput userText;
LinePlot lineplot;
background backgroundTemplate;
//BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
//VScrollbar vs1;
int[] reviewCount;
String[] reviews;
Review testReview, nextReview;
ArrayList<Review> reviewsArray;
ArrayList<String> businessNames, userNames;
ArrayList<LinePlot> linePlotArray;
int reviewNumDisplayed =0;
int screenInt = 1;
Widget widgetNext, widgetPrev, bizWidget, userWidget, reviewWidget;
ArrayList<Widget> widgetList;
PFont widgetFont;
float y = 100;
Screen currentScreen, businessScreen, userScreen;
ReviewScreen currScreen, reviewScreen;
color widgetColor;
void setup () {

  reviewCount=new int[11];
   
  starImage=loadImage("star.gif");
  widgetColor = color(255);
  reviewTable=loadTable("reviews_cleaned.csv", "header");
  size(1800, 1000);
  // reviewTable = loadTable("reviews_cleaned.csv", "header");
  // vs1 = new VScrollbar(SCREEN_X, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
  widgetFont = loadFont("SansSerif-14.vlw"); 
  textFont(widgetFont);
  widgetNext =new Widget(924, 600, 100, 40, 
    "Next", widgetColor, widgetFont, EVENT_BUTTON1);
  widgetPrev = new Widget(700, 600, 100, 40, "Previous", widgetColor, widgetFont, EVENT_BUTTON2);
  bizWidget = new Widget(700, 30, 100, 40, "Businesses", widgetColor, widgetFont, EVENT_BUTTON3);
  userWidget = new Widget(924, 30, 100, 40, "Users", widgetColor, widgetFont, EVENT_BUTTON4);
  reviewWidget = new Widget(474, 30, 100, 40, "Home", widgetColor, widgetFont, EVENT_BUTTON5);
  businessNames = new ArrayList<String>();
  userNames = new ArrayList<String>();
  widgetList = new ArrayList<Widget>();
  widgetList.add(widgetNext); 
  widgetList.add(widgetPrev);
  widgetList.add(bizWidget);
  widgetList.add(userWidget);
  widgetList.add(reviewWidget);
  reviewsArray = new ArrayList<Review>();
  linePlotArray = new ArrayList<LinePlot>();
 
  reviews = loadStrings("reviews_cleaned.csv");
  userText = new userInput();
  backgroundTemplate = new background();
  businessScreen = new Screen(userWidget, reviewWidget, backgroundTemplate, businessNames);
  userScreen = new Screen(bizWidget, reviewWidget, backgroundTemplate, userNames);
  
  currScreen = reviewScreen;
  println("there are " + reviews.length + " lines");
  for (int i = 1; i < reviewTable.getRowCount(); i++) {
    TableRow row=reviewTable.getRow(i);
    String userID = row.getString("user_id");
    String userName = row.getString("user_name");
    String businessID = row.getString("business_id");
    String businessName = row.getString("business_name");
    int stars = row.getInt("stars");
    String date=row.getString("date");
    String review = row.getString("text");
    int useful = row.getInt("useful");
    int funny = row.getInt("funny");
    int cool = row.getInt("cool");
    int i2=i;
    Review newReview = new Review(userID, userName, businessID, businessName, stars, date, review, useful, funny, cool, i2);
    reviewsArray.add(newReview);
  }
   //for (int i = 1; i < reviewTable.getRowCount(); i++) {
   // TableRow row = reviewTable.getRow(i);
   // String name = row.getString("business_name");
   // businessNames.add(name);
 // }
 // for (int i = 1; i < reviewTable.getRowCount(); i++) {
   // TableRow row = reviewTable.getRow(i);
   // String name = row.getString("user_name");
   // userNames.add(name);
 // }
 for (int i = 1; i < reviewsArray.size(); i++) {
    Review testReview = (Review) reviewsArray.get(i);
    String name = testReview.getBusinessName();
    if (!businessNames.contains(name) ){
      businessNames.add(name);
    }
  }
  for (int i = 1; i < reviewsArray.size(); i++) {
    Review testReview = (Review) reviewsArray.get(i);
    String name = testReview.getUserName();
    if (!userNames.contains(name)) {
      userNames.add(name);
    }
  }
  if (reviewNumDisplayed < 0) {
    reviewNumDisplayed = 0;
  }
 
  int[] statistics=findReviews(reviewsArray.get(0).getBusinessName());
  lineplot=new LinePlot(50, 60, 10, 100, 900, 700, 500, "Review Activity", "Years", "Reviews", 1, 11, 10, 4, statistics);
  Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  reviewScreen = new ReviewScreen (bizWidget, userWidget, widgetNext, widgetPrev, backgroundTemplate, reviewsArray, reviewNumDisplayed, lineplot);
  currScreen = reviewScreen;
  
  //  barChart=new BarChartIndividual(nextReview);

  // testReview = (Review) reviewArray.get(1);
  // nextReview = (Review) reviewArray.get(2);
  //  println(testReview.getUserName());
  // println(testReview.getBusinessName());
  //println(testReview.getReview());
  //println(nextReview.getReview());
}

void draw() {
  // float leftPos = vs1.getPos();
  //backgroundTemplate.draw();
  if (screenInt == 1) {
    currScreen.draw();
  } else currentScreen.draw();
  userText.draw();

  //  barChart.draw(800);
  // starCounter.draw(200);
 // lineplot.draw();
  // nextReview = (Review) reviewsArray.get(1);
  // nextReview.draw(-leftPos + 200);
  // testReview.draw(leftPos);
  // nextReview.draw(leftPos + 200);
  /*for ( int i =0; i < widgetList.size(); i ++) {
   Widget aWidget = (Widget) widgetList.get(i);
   aWidget.draw();
   } */
  // Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  // nextReview.draw(200);
  int event;
}
int[] findReviews(String businessName) {//gets how many reviews the business got in each year, returns integer array.
  Review currentReview;
  String nameCompared;
  businessName=getRidOfQuotation(businessName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getBusinessName());
    if (businessName.equals(nameCompared)) {
      String date=currentReview.getDate();
      int reviewsYear=getYearFromDate(date);
      switch(reviewsYear) {
      case 2007:
        reviewCount[0]++;
        println(reviewCount[0]);
        break;
      case 2008:
        reviewCount[1]++;
        println(reviewCount[0]);
        break;
      case 2009:
        reviewCount[2]++;
        println(reviewCount[0]);
        break;
      case 2010:
        reviewCount[3]++;
        println(reviewCount[0]);
        break;
      case 2011:
        reviewCount[4]++;
        println(reviewCount[0]);
        break;
      case 2012:
        reviewCount[5]++;
        println(reviewCount[0]);
        break;
      case 2013:
        reviewCount[6]++;
        println(reviewCount[0]);
        break;
      case 2014:
        reviewCount[7]++;
        println(reviewCount[7]);
        break;
      case 2015:
        reviewCount[8]++;
        println(reviewCount[8]);
        break;
      case 2016:
        reviewCount[9]++;
        println(reviewCount[9]);
        break;
      case 2017:
        reviewCount[10]++;
        println(reviewCount[10]);
        break;
      }
    }
  }
  // for (int i=0; i<reviewCount.length; i++) {
  //  println(reviewCount[i]);
  //}
  return reviewCount;
}

int getYearFromDate(String date) {
  char[]dateToChars=date.toCharArray();
  int index2=dateToChars.length-1;
  char[] flipped=new char[4];
  int counter=0;
  for (int index=index2; index>dateToChars.length-5; index--) {
    char c=dateToChars[index];
    flipped[counter]=c;
    counter++;
  }
  int i2=3;
  char[]fliperoo=new char[4];
  for (int i=0; i<flipped.length; i++) {
    fliperoo[i]=flipped[i2];
    i2--;
  }
  String yearString=new String(fliperoo);
  //println(yearString);
  int year=Integer.parseInt(yearString);
  // println(year);
  return year;
}

String getRidOfQuotation(String text) {
  char[]textToChars=text.toCharArray();
  char[] cleanText=new char[textToChars.length-2];
  int counter=0;
  for (int i=1; i<textToChars.length-1; i++) {
    char c=textToChars[i];
    cleanText[counter]=c;
    counter++;
  } 
  String newString=new String(cleanText);
  //println(newString);
  return newString;
}

void mousePressed() {
  int event;
  for ( int i =0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (reviewNumDisplayed  < 0) {
      reviewNumDisplayed = 0;
    }
    switch(event) {
    case EVENT_BUTTON1:
      println("Next");
      reviewNumDisplayed++;
      break;
    case EVENT_BUTTON2:
      println("Previous");
      reviewNumDisplayed --;
      break;
    case EVENT_BUTTON3:
      println("Businesses");
      screenInt = 2;
      currentScreen = businessScreen;
      break;
    case EVENT_BUTTON4:
      println("Users");
      screenInt = 3;
      currentScreen = userScreen;
      break;
    case EVENT_BUTTON5:
      println("Home");
      screenInt = 1;
      currScreen = reviewScreen;
      break;
    }
  }
}
void keyPressed() {
 userText.userKeyPressed(); 
}