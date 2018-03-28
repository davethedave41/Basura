Table reviewTable;
userInput userText;
LinePlot lineplot;
LinePlotStars linePlotStars;
background backgroundTemplate;
//BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
//VScrollbar vs1;
//int[] reviewCount;
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
  reviewWidget = new Widget(600, 30, 100, 40, "Home", widgetColor, widgetFont, EVENT_BUTTON5);
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
   Widget busWidget1 = new Widget(100, 200, 100, 40, "Carini's", widgetColor, widgetFont, EVENT_BUTTON6);
  Widget busWidget2 = new Widget(100, 250, 100, 40, "Quicktrip", widgetColor, widgetFont, EVENT_BUTTON7);
  Widget busWidget3 = new Widget(100, 300, 100, 40, "Barrio Fiesta", widgetColor, widgetFont, EVENT_BUTTON8);
  Widget busWidget4 = new Widget(100, 350, 100, 40, "Sally Beauty", widgetColor, widgetFont, EVENT_BUTTON9);
  Widget busWidget5 = new Widget(100, 400, 100, 40, "Phoenix Pharmacy", widgetColor, widgetFont, EVENT_BUTTON10);
  Widget busWidget6 = new Widget(100, 450, 100, 40, "Impact Auto", widgetColor, widgetFont, EVENT_BUTTON11);
  Widget busWidget7 = new Widget(100, 500, 100, 40, "Liberty", widgetColor, widgetFont, EVENT_BUTTON12);
  Widget busWidget8 = new Widget(100, 550, 100, 40, "Plantation Animal", widgetColor, widgetFont, EVENT_BUTTON13);
  Widget busWidget9 = new Widget(100, 600, 100, 40, "Super Star", widgetColor, widgetFont, EVENT_BUTTON14);
  Widget busWidget10 = new Widget(250, 200, 100, 40, "Capriotti's", widgetColor, widgetFont, EVENT_BUTTON15);
  Widget busWidget11 = new Widget(250, 250, 100, 40, "Cool Springs", widgetColor, widgetFont, EVENT_BUTTON16);
  Widget busWidget12 = new Widget(250, 300, 100, 40, "Peoria Nissan", widgetColor, widgetFont, EVENT_BUTTON17);
  Widget busWidget13 = new Widget(250, 350, 100, 40, "Cafe Presse", widgetColor, widgetFont, EVENT_BUTTON18);
  Widget busWidget14 = new Widget(250, 400, 100, 40, "Fresh & Easy", widgetColor, widgetFont, EVENT_BUTTON19);
  Widget busWidget15 = new Widget(250, 450, 100, 40, "Office Team", widgetColor, widgetFont, EVENT_BUTTON20);
  Widget busWidget16 = new Widget(250, 500, 100, 40, "Foreign Fix", widgetColor, widgetFont, EVENT_BUTTON22);
  Widget busWidget17 = new Widget(250, 550, 100, 40, "Dollarama", widgetColor, widgetFont, EVENT_BUTTON23);
  Widget busWidget18 = new Widget(250, 600, 100, 40, "McDonald's", widgetColor, widgetFont, EVENT_BUTTON24);
  Widget busWidget19 = new Widget(250, 650, 100, 40, "Realstar", widgetColor, widgetFont, EVENT_BUTTON25);
  
  businessScreen.addWidget2(busWidget1);
  businessScreen.addWidget2(busWidget2);
  businessScreen.addWidget2(busWidget3);
  businessScreen.addWidget2(busWidget4);
  businessScreen.addWidget2(busWidget5);
  businessScreen.addWidget2(busWidget6);
  businessScreen.addWidget2(busWidget7);
  businessScreen.addWidget2(busWidget8);
  businessScreen.addWidget2(busWidget9);
  businessScreen.addWidget2(busWidget10);
  businessScreen.addWidget2(busWidget11);
  businessScreen.addWidget2(busWidget12);
  businessScreen.addWidget2(busWidget13);
  businessScreen.addWidget2(busWidget14);
  businessScreen.addWidget2(busWidget15);
  businessScreen.addWidget2(busWidget16);
  businessScreen.addWidget2(busWidget17);
  businessScreen.addWidget2(busWidget18);
  businessScreen.addWidget2(busWidget19);
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
  for (int i = 1; i < reviewTable.getRowCount(); i++) {
    TableRow row = reviewTable.getRow(i);
    String name = row.getString("business_name");
    businessNames.add(name);
  }
  for (int i = 1; i < reviewTable.getRowCount(); i++) {
    TableRow row = reviewTable.getRow(i);
    String name = row.getString("user_name");
    userNames.add(name);
  }
  if (reviewNumDisplayed < 0) {
    reviewNumDisplayed = 0;
  }

  int[] statistics=findReviews(reviewsArray.get(0).getBusinessName());
 linePlotStars=new LinePlotStars(5, 50, 70, 100, 900, 600, 400, "Average Star Ratings", "Years", "Average Stars", 1, 11, 5, 4, findAverageStars(reviewsArray.get(0).getBusinessName()));
  //lineplot=new LinePlot(50, 60, 10, 100, 900, 700, 500, "Review Activity", "Years", "Reviews", 1, 11, 10, 4, statistics);
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
  // linePlotStars.draw();
  // float leftPos = vs1.getPos();
  //backgroundTemplate.draw();
  if (screenInt == 1) {
    currScreen.draw();
  } else currentScreen.draw();
  userText.draw();
  userText.keyPressed();
  //  barChart.draw(800);
  // starCounter.draw(200);
   linePlotStars.draw();
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
  int[] reviewCount=new int[11];
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

double calculateAverageStars(ArrayList<Integer> starArray) {    //gets the average star rating of a specific business for one year
    int total=0;
     if (starArray.size()>0) {
    for (int i=0; i<starArray.size(); i++) {
      total+=starArray.get(i);
    }
    int arrayLength=starArray.size();
    double average=total/arrayLength;
    return average;
  } 
  else {
   System.out.println("i be broke");
   return total;
  }
}

double[]findAverageStars(String businessName) {      //finds the average star rating of a specific business for all its years
  Review currentReview;
  String nameCompared;
  ArrayList<Integer>stars2007=new ArrayList<Integer>();
  ArrayList<Integer>stars2008=new ArrayList<Integer>();
  ArrayList<Integer>stars2009=new ArrayList<Integer>();
  ArrayList<Integer>stars2010=new ArrayList<Integer>();
  ArrayList<Integer>stars2011=new ArrayList<Integer>();
  ArrayList<Integer>stars2012=new ArrayList<Integer>();
  ArrayList<Integer>stars2013=new ArrayList<Integer>();
  ArrayList<Integer>stars2014=new ArrayList<Integer>();
  ArrayList<Integer>stars2015=new ArrayList<Integer>();
  ArrayList<Integer>stars2016=new ArrayList<Integer>();
  ArrayList<Integer>stars2017=new ArrayList<Integer>();
  businessName=getRidOfQuotation(businessName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getBusinessName());
    if (businessName.equals(nameCompared)) {
      String date=currentReview.getDate();
      int reviewsYear=getYearFromDate(date);
      int star=currentReview.getStars();
      switch(reviewsYear) {
      case 2007:
        stars2007.add(star);
        println(stars2007);
        break;
      case 2008:
        stars2008.add(star);
        println(stars2008);
        break;
      case 2009:
        stars2009.add(star);
        println(stars2009);
        break;
      case 2010:
        stars2010.add(star);
        println(stars2010);
        break;
      case 2011:
        stars2011.add(star);
        println(stars2011);
        break;
      case 2012:
        stars2012.add(star);
        println(stars2012);
        break;
      case 2013:
        stars2013.add(star);
        println(stars2013);
        break;
      case 2014:
        stars2014.add(star);
        println(stars2014);
        break;
      case 2015:
        stars2015.add(star);
        println(stars2015);
        break;
      case 2016:
        stars2016.add(star);
        println(stars2016);
        break;
      case 2017:
        stars2017.add(star);
        println(stars2017);
        break;
      default:
        break;
      }
    }
  }
  double[]stats=new double[11];                //sending off array of star averages of each year
  for(int i=0;i<11;i++){
   println(stars2007.size()); 
     println(stars2008.size()); 
       println(stars2009.size()); 
         println(stars2010.size()); 
           println(stars2011.size()); 
  }
  stats[0]=calculateAverageStars(stars2007);
  stats[1]=calculateAverageStars(stars2008);
  stats[2]=calculateAverageStars(stars2009);
  stats[3]=calculateAverageStars(stars2010);
  stats[4]=calculateAverageStars(stars2011);
  stats[5]=calculateAverageStars(stars2012);
  stats[6]=calculateAverageStars(stars2013);
  stats[7]=calculateAverageStars(stars2014);
  stats[8]=calculateAverageStars(stars2015);
  stats[9]=calculateAverageStars(stars2016);
  stats[10]=calculateAverageStars(stars2017);
  

  return stats;
}
double getTheAverageStarRating(double[]stars){
  Review aReview=reviewsArray.get(0);
  aReview.getBusinessName();
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
    case EVENT_BUTTON5:
      println("Home");
      screenInt = 1;
      currScreen = reviewScreen;
    }
  }
}