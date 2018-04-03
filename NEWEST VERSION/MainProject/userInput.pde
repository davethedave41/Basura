class userInput{ 
  
String label = "";
char recentLetter;
String b = "Search ";

  void setup() {
    textSize(3);
    //textAlign(CENTER);
  }  
  
  void draw() {
    //textAlign(CENTER);
    fill(255);
    rect(1200, 20, 300, 50);
    textSize(15);
    textAlign(CENTER);
    fill(24);
   // text(letters, 1300, 50);//130, 40);
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
    recentLetter = key;}
    void append(char s){
    if(s==BACKSPACE){
    if(!label.equals(""))
    label=label.substring(0,label.length()-1);
    }
   // else if (label.length() <maxlen)
    label=label+str(s);
  //  if ((key == ENTER) || (key == RETURN) || (key == BACKSPACE)) {
  //    println(letters);  // Print to console to see input
   //   letters = letters - recentLetter;  // Clear the variable
   // } else if ((key > 31) && (key != CODED)) { 
      // If the key is alphanumeric, add it to the String
    //  b = "";
    //  letters = letters + recentLetter; 
   // }
 // }
  
}

/*
  

*/}