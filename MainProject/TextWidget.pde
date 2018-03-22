class TextWidget extends Widget {
  String search;
  int maxLength;
  int x;
  int y;
  int width;
  int height;
  String label;
  color widgetColor;
  PFont font;
  int event;

  TextWidget(int x, int y, int width, int height, String label, color widgetColor, PFont font, int event, int maxLength) {
    super(x, y, width, height, label, widgetColor, font, event);
    this.x=x;
    this.y=y;
    this.width=width;
    this.height=height;
    this.label=label;
    this.widgetColor=widgetColor;
    this.font=font;
    this.event=event;
    this.maxLength=maxLength;
  }
  
  void setSearch(String search){
    this.search=search;
  }
  
  void append(char s) {
    //println(label);
    if(s==ENTER){
      println("im in boss");
      search=label;
     setSearch(label);
    }
    if (s==BACKSPACE) {
      if (!label.equals("")) {
        label=label.substring(0, label.length()-1);
        setLabel(label);
      }
    } else if (label.length()<maxLength) {
      //println(label);
      label=label+str(s);
      setLabel(label);
    }
  }
}