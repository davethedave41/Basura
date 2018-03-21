class Widget {
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor, borderColor;
  PFont widgetFont;

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
    borderColor = color(0);
  }
  void draw() {

    fill(widgetColor);
    strokeWeight(2);
    stroke(borderColor);
    rect(x, y, width, height, 20);
    fill(labelColor);
    text(label, x + width/2, y+height - 15);
  }
  int getEvent( int mX, int mY) {
    if (mX > x && mX < x + width && mY > y && mY < y + height) {
      return event;
    }
    return EVENT_NULL;
  }
}