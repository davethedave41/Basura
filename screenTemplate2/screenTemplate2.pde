userInput userText;
background backgroundTemplate;

void setup(){
  size(1000, 800);
  userText = new userInput();
  backgroundTemplate = new background();
}

void draw(){
  
  
  backgroundTemplate.draw();
  
  userText.draw();
  userText.keyPressed();
  
}