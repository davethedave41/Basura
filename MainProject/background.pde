class background {
  PFont textFont;
  color textColor;
  
  void draw(){
    background(2, 183, 201);
    strokeWeight(5);
    stroke(242, 204, 47, 102);  // More transparency
    line(30, 20, 50, 80);
    stroke(242, 204, 47, 204);  // Less transparency
    line(50, 20, 70, 80);
    
    //white rectangle
    fill(255);
    rect(0, 110, 1915, 900);
    
    //review on header
    String s = "";
    textFont = loadFont("SansSerif-14.vlw");
    textColor = color(255);
    textFont(textFont);
    textAlign(CENTER);
    textSize(50);
    fill(textColor);
    text(s, 220, 60);//100, 20, 
    
    //textColor = color(255);
    //textFont(labelFont);
    //textAlign(CENTER);
    //textSize(25);
    //fill(textColor);
    //text(businessName, REVIEW_X_POS, y);
  }
  
}