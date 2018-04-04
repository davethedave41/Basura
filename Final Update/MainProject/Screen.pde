
class Screen {
  ArrayList<Widget> wijList, addedWij;
  color background, mouseMoved, normal;
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
    mouseMoved = color(2, 183, 201);
    normal = color(56, 90, 94);
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
    //underline function
    for (int i = 0; i<wijList.size(); i++) {
      Widget aWidget = (Widget) wijList.get(i);
      if (event == aWidget.getEvent(mouseX, mouseY)) {
        aWidget.setWidgetColor(normal);
      } else aWidget.setWidgetColor(mouseMoved);
    }
  }
  void addWidget() {
    int count = 0;
    Widget aWij = new Widget(700, 600, 100, 40, "Previous", color(135, 208, 250), widgetFont, EVENT_BUTTON2);
    addedWij.add(aWij);
    count++;
  }
  void addWidget2(Widget widget) {
    wijList.add(widget);
    widgetList.add(widget);
  }
  color getBackground() {
    return background;
  }
}