UserInput userInput;
ArrayList myWidgets;
PFont font;
String savedInput = "";
void setup() {
  font=loadFont("AgencyFB-Reg-18.vlw");
  textFont(font);
  background(255);
  size(1000, 1000);
  userInput=new UserInput(18, 400, 600, 100, 50, "Search", color(255), font, EVENT_BUTTON30);
  myWidgets = new ArrayList();
}
void draw() {
  userInput.draw();
  
}
void keyPressed() {
  if (userInput != null) {
    userInput.append(key);
  }
  println("search widget");
  
}
void mousePressed() {
  int event;
  
  for(int i = 0; i < myWidgets.size(); i++){
    UserInput theWidget = (UserInput)myWidgets.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    if(event == EVENT_BUTTON30){
      println("clicked on a text enrty widget!");
      userInput = theWidget;
      break;
    }
    else{
      userInput = null;
    }
  }
  if(userInput.label.equals("Search")){
    //userInput.setLabel("");
    userInput.label="";
   // println(tW.label);
  }
  if((key == RETURN) || (key == ENTER)){
    background(0);
    savedInput = userInput.label;
    println(savedInput);
    //for(int index=0; index<ReviewList.size();  index++){
    //if(ReviewList.get(index).businessName.contains(savedInput)
    
    //{
      //go to business screen
    }
    
  }
  