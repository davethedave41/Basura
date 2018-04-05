class HomeScreen {
  Widget users, businesses, mostRecent, topRated;
  ArrayList<Widget> wijList;
  background template;
  userInput searchBar;
  PImage logo;
  
  HomeScreen(ArrayList wijList, background template, userInput searchBar) {
    this.wijList = wijList;
    this.template = template;
    this.searchBar = searchBar;
    logo = loadImage("Logo1.png");
  }
  void draw() {
   //template.draw();
   fill(56, 94, 90);
   image(logo, 600, 400, 600, 200);
   searchBar.draw();
  /* for (int i = 0; i < wijList.size(); i++) {
     Widget wij = (Widget) wijList.get(i);
     wij.draw();
   } */
    
  }
  
  
}