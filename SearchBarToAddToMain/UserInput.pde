class UserInput extends SearchWidget { 
 int maxLength;
  
  UserInput(int maxLength,int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y,  width, height,  label,  widgetColor,  widgetFont,  event);
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.label=label; this.event=event;
    this.widgetColor=widgetColor; this.widgetFont=widgetFont;
    labelColor=color(0); this.maxLength = maxLength;
    
  }
  /*  void setup() {
   textSize(3);
   //textAlign(CENTER);
   }  */


  //void userKeyPressed() {
   //textSize(15);
   //fill(24);
   //textAlign(CENTER);
  // text(b, 1500, 50);
   //recentLetter = key;*/

  void append(char s) {
    if (s==BACKSPACE) {
      if (!label.equals(""))
        label=label.substring(0, label.length()-1);
    } else if (label.length() <maxLength)
      label=label+str(s);
    //if ((key == ENTER) || (key == RETURN) || (key == BACKSPACE)) {
    // println(letters);  // Print to console to see input
    //// letters = letters - recentLetter;  // Clear the variable
    //} else if ((key > 31) && (key != CODED)) { 
    // // If the key is alphanumeric, add it to the String
    //  b = "";
    // letters = letters + recentLetter;
  }
}

/*
  
 
 */