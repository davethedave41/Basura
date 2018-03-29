class HomeScreen {
  Widget users, businesses, mostRecent, topRated;
  ArrayList<Widget> wijList;
  background template;
  userInput searchBar;
  
  HomeScreen(ArrayList wijList, background template, userInput searchBar) {
    this.wijList = wijList;
    this.template = template;
    this.searchBar = searchBar;
  }
  void draw() {
   template.draw();
   searchBar.draw();
   for (int i = 0; i < wijList.size(); i++) {
     Widget wij = (Widget) wijList.get(i);
     wij.draw();
   }
    
  }
  
  
}