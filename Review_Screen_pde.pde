Table reviews;
BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
ArrayList<Review> reviewArray;
void setup(){
  starImage=loadImage("star.gif");
size(1920,1080);
background(5);
  reviewArray=new ArrayList<Review>();
  reviews=loadTable("reviews_cleaned.csv", "header");
  //loop through all rows of table
  //for (int i=0; i<reviews.getRowCount(); i++) {
    TableRow row=reviews.getRow(TEST);
    String userID=row.getString("user_id");

    println(userID);
    String userName=row.getString("user_name");
    println(userName);
    String businessID=row.getString("business_id");
    println(businessID);
    String businessName=row.getString("business_name");
    println(businessName);
    int stars=row.getInt("stars");
    println(stars);
    String date=row.getString("date");
    println(date);
    String text=row.getString("text");
    println(text);
    int useful=row.getInt("useful");
    println(useful);
    int funny=row.getInt("funny");
    println(funny);
    int cool=row.getInt("cool");
    println(cool);
    Review newReview = new Review(userID, userName, businessID, businessName, stars, date, text, useful, funny, cool);
  reviewArray.add(newReview);
    barChart=new BarChartIndividual(newReview);
    starCounter=new StarCounter(stars,starImage);
  Review testReview = (Review) reviewArray.get(0);
  //println(testReview.getUserName());
//  println(testReview.getBusinessName());
 // println(testReview.getText());
  //testReview.draw();
//}
}

void draw(){
//fill(255);
barChart.draw();
starCounter.draw();
 //   rect(150,800,BARWIDTHH,BARHEIGHTH);
   // rect(150,800,BARWIDTHV,-BARHEIGHTV);
}