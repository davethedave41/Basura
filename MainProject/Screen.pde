class Screen {
  ArrayList wijList, addedWij;
  color background;
  int event;

  Screen( Widget red, Widget green, Widget next, Widget prev) {
    wijList = new ArrayList();
    addedWij = new ArrayList();
    wijList.add(red);
  //  wijList.add(blue);
    wijList.add(green);
    wijList.add(next);
    wijList.add(prev);
  }
  void draw() {
    background(background);
    for (int i = 0; i < wijList.size(); i++) {
      Widget aWij = (Widget) wijList.get(i);
      aWij.draw();
    }
    if (addedWij != null) {
      for (int i = 0; i < addedWij.size(); i++) {
        Widget aWij = (Widget) wijList.get(i);
        aWij.draw();
      }
    }
  }
  void addWidget() {
    int count = 0;
    Widget aWij = new Widget(700, 600, 100, 40, "Previous", color(135, 208, 250), widgetFont, EVENT_BUTTON2);
    addedWij.add(aWij);
    count++;
  }
  color getBackground() {
    return background;
  }
}