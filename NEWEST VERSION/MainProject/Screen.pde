
class Screen {
  ArrayList<Widget> wijList, addedWij;
  color background;
  int event;
  background backgroundTemplate;
  Widget red, green, next, prev;
  String heading;
  ArrayList<String> words;

  Screen(ArrayList wijList, background backgroundTemplate) {
    this.wijList = wijList; 
    this.backgroundTemplate = backgroundTemplate;
    //this.words = words;
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
  /*  if (words.size() > 40) {
      for (int i = 0; i < 35; i++) {
        text(words.get(i), LEFT_X_POS, 200+i*20);
      }
      y = 0;
      for (int index = 40; index < words.size(); index++) {
        text(words.get(index), RIGHT_X_POS, 200+y*20); 
        y++;
      }
    } else {
      for (int i = 0; i < words.size(); i++) {
        text(words.get(i), LIST_X_POS, 200+i*20);
      }
    }*/
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (event == 1 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 3 && event!=2 && event !=8 && event !=9) {
        rect(aWidget.getX() + 32, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 2 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 3 && event!=1 && event !=8 && event !=9) {
        rect(aWidget.getX() + 19, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 3 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 4 && event != 5 && event != 2 && event!=1 && event !=8 && event !=9) {
        rect(aWidget.getX() + 10, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 4 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 5 && event != 2 && event!=1 && event !=8 && event !=9) {
        rect(aWidget.getX() + 30, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 5 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=8 && event !=9) {
        rect(aWidget.getX() + 28, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 8 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=5 && event !=9) {
        rect(aWidget.getX() + 25, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
      } else if (event == 9 && mouseX > aWidget.getX() && mouseX < aWidget.getX() + aWidget.getWidth() && mouseY > aWidget.getY() && mouseY < aWidget.getY() + aWidget.getHeight()&& event != 3 && event != 4 && event != 2 && event!=1 && event !=8 && event !=5) {
        rect(aWidget.getX() + 36, aWidget.getY() + aWidget.getHeight() - 10, aWidget.getTextWidth(), 0.25);
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
    widgetList.add(widget);
  }
  color getBackground() {
    return background;
  }
}