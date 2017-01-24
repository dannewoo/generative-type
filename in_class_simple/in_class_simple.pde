import processing.pdf.*;

int blue = 200;
PFont font1;
String word = "Hello class!";

void setup() {
  beginRecord(PDF, "random-fonts.pdf");
  size(800,600);
  background(0, 0, blue);
  font1 = createFont("IndieFlower.ttf", 50);
  textFont(font1);
  textAlign(CENTER);
  text(word, width/2, height/2);
  endRecord();
}

void draw() {
  
}