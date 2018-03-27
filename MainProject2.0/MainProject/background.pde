class background {
  
  void draw(){
    background(56, 90, 94);
    strokeWeight(3);
    stroke(242, 204, 47, 102);  // More transparency
    line(30, 20, 50, 80);
    stroke(242, 204, 47, 204);  // Less transparency
    line(50, 20, 70, 80);
    
    //white rectangle
    fill(255);
    rect(0, 110, 1915, 900);
    
    String s = "REVIEWS";
    textSize(50);
    fill(255);
    text(s, 100, 20, 220, 60);
  }
  
}