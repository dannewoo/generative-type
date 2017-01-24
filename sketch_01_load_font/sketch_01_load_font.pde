// void setup
// size() and semi-colon
// background(r, g, b)
// variables
// PFont, createFont("font name", font size)
// textFont()
// text("string of words", x, y)
// fill(r, g, b)
// int and float
// global variables - width and height
// for loop
// random
// map color
// String
// Array String[] varName = {"Test"}
// print pdf library
// rotate, pushMatrix, popMatrix, translate (if we have time)

import processing.pdf.*;

PFont mono;
int x = 100;
String[] fonts = {"HelveticaNeueLTStd-Cn.otf", "Helveticrap.ttf"};
String[] words = {"Susan", "Calvin", "Danne", "Olivia"};
String name = "Name";

void setup() {
  beginRecord(PDF, "type.pdf"); 
  size(500, 500);
  background(0);
  for (int i = 0; i < 100; i++) {
    int w = int(random(width));
    int h = int(random(height));
    float s = (w/3) + 1;
    mono = createFont(fonts[int(random(fonts.length))], s);
    textFont(mono);
    //pushMatrix();
    //translate(w, h);
    //translate(200, 100);
    //rotate(PI/random(3));
    //if (w <= width - 100 &&  w >= 100) {
    //  fill(255, 0, 0);
    //} else {
    //  fill(0, 255, 0);      
    //}
    fill(map(w, 0, width, 0, 255), 0, 0);
    text(words[int(random(words.length))], w, h);
    //text(words[int(random(words.length))], 0, 0);
    //popMatrix();
  }
  endRecord();
}

//void draw() {
//  background(0);
//  text("word", x += 1, 100);
//}