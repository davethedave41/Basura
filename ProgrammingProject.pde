void setup(){
  background(0);
  size(300, 300);
  String lines[] = loadStrings("reviews.csv");
   for(int i =0; i < lines.length; i++){
    println(lines[i]);
   }
  
}