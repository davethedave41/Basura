
class Screen {
  ArrayList wijList, addedWij;
  color background;
  int event;
  background backgroundTemplate;
  Widget red, green, next, prev;
  String heading;
  ArrayList<String> words;

  Screen(Widget red, Widget green, background backgroundTemplate, ArrayList<String> words) {
    this.red = red; 
    this.green = green;
    this.backgroundTemplate = backgroundTemplate;
    this.words = words;
    wijList = new ArrayList();
    addedWij = new ArrayList();
    wijList.add(red);
    wijList.add(green);
  }
  void draw() {
    backgroundTemplate.draw();
    for (int i = 0; i < wijList.size(); i++) {
      Widget aWij = (Widget) wijList.get(i);
      textSize(16);
      aWij.draw();
    }
    if (addedWij != null) {
      for (int i = 0; i < addedWij.size(); i++) {
        Widget aWij = (Widget) wijList.get(i);
        aWij.draw();
      }
    }
    for (int i = 0; i < words.size(); i++) {
      text(words.get(i), REVIEW_X_POS, 200 + i * 20); 
    }
    for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event == 1 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 32, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
    } else if (event == 2 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 19, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
    } else if (event == 3 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 10, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
    } else if (event == 4 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()){
      rect(aWidget.getX() + 30, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);    
    } else if (event == 5 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()) {
      rect(aWidget.getX() + 28, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);   
    }
  }
  }
  void addWidget() {
    int count = 0;
    Widget aWij = new Widget(700, 600, 100, 40, "Previous", color(135, 208, 250), widgetFont, EVENT_BUTTON2);
    addedWij.add(aWij);
    count++;
  }
  void addWidget2(Widget widget){
    wijList.add(widget);
  }
  
  color getBackground() {
    return background;
  }
}