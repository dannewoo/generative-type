PFont mono;
PVector[] loc = new PVector[100];
String word = "words";

void setup() {
  size(500, 500);
  background(0);
  mono = createFont("HelveticaNeueLTStd-Cn.otf", 40);
  textFont(mono);
  for (int i = 0; i < 100; i++) {
    loc[i] = new PVector(int(random(-textWidth(word), width)), int(random(height)));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < 100; i++) {
    if (loc[i].x >= width/2) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);      
    }
    if(loc[i].x > width) {
      text(word, loc[i].x = -textWidth(word), loc[i].y);
    } else {
      text(word, loc[i].x++, loc[i].y);
    }
  }
}