class Widget {
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor, borderColor;
  PFont widgetFont;
  float textWidth;
  Widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    this.x = x; 
    this.y=y; 
    this.width = width; 
    this.height = height;
    this.label = label;
    this.event = event;
    this.widgetColor = widgetColor; 
    this.widgetFont = widgetFont;
    labelColor = color(0);
    borderColor = color(242, 204, 47);
  }
  void draw() {

    fill(widgetColor);
    strokeWeight(2);
    stroke(borderColor);
    rect(x, y, width, height, 20);
    fill(labelColor);
    text(label, x + width/2, y+height - 15);
    textWidth = textWidth(label);
    
  }
  int getEvent( int mX, int mY) {
    if (mX > x && mX < x + width && mY > y && mY < y + height) {
      return event;
    }
    return EVENT_NULL;
  }
  int getY() {
    return this.y; 
  }
  int getX() {
    return this.x; 
  }
  float getTextWidth() {
    return textWidth; 
  }
  int getWidth() {
   return width; 
  }
  int getHeight() {
   return height; 
  }
}