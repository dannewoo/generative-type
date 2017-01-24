PFont mono;
// PVector is a object that stores an x, y and z value
PVector[] loc = new PVector[100];
String word = "words";

void setup() {
  size(500, 500);
  background(0);
  // Load the font using the createFont function
  mono = createFont("HelveticaNeueLTStd-Cn.otf", 40);
  textFont(mono);
  // Loop 100 times and store a random x and y location to the PVector array
  for (int i = 0; i < 100; i++) {
    loc[i] = new PVector(int(random(-textWidth(word), width)), int(random(height)));
  }
}

void draw() {
  // Draw the background every frame to cover up the previous frame
  background(0);
  // Loop through the array of x and y values and use those for the placement of each word.
  for (int i = 0; i < loc.length; i++) {
    // If the x location of the word passes the middle of the canvas it changes color
    if (loc[i].x >= width/2) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);      
    }
    if(loc[i].x > width) {
      // If the word goes off the screen then reset the x location 
      // to start from the left again.
      text(word, loc[i].x = -textWidth(word), loc[i].y);
    } else {
      // Move the x location of the word from its current location 
      // 2 pixels to the right every frame. += means take current value and add to it.
      text(word, loc[i].x += 2, loc[i].y);
    }
  }
}