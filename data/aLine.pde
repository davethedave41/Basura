LinePlot lP;
int[]stats={2,1,19,19,25,16,24,41,31,49,38};

void setup(){
   size(1000,1000);
    background(255);
  lP=new LinePlot(50,50,10,100,900,570,520,"Review Activity","Year","Reviews",1,11,10,3.5,stats);
}
void draw(){
  lP.draw();
}