import processing.pdf.*;

int blue = 200;
PFont font1;
String word = "Hello class!";
String[] words = {"Trump", "Sucks", "WHYYYYYY!"};
String[] fonts = {"IndieFlower.ttf", "OpenSans-BoldItalic.ttf", "Slabo27px-Regular.ttf"};

void setup() {
  beginRecord(PDF, "random-fonts.pdf");
  size(800,600);
  background(0, 0, blue);
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    font1 = createFont(fonts[int(random(fonts.length))], random(10, 30));
    textFont(font1);
    //if (i <= 50) {
    //  fill(0, 255, 0);
    //} else {
    //  fill(255, 0, 0);
    //}
    if (x <= width/2) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    textAlign(CENTER);
    //text(word, x, y);
    text(words[int(random(words.length))], x, y);
  }
  endRecord();
}

void draw() {
  
}