import geomerative.*;
import processing.pdf.*;
boolean record;
String font = "FreeSans.ttf";

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RShape grp;
float noiseScale = 0.02;

void setup(){
  // Initilaize the sketch
  size(600,400);
  frameRate(24);

  // Choice of colors
  background(255);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  // Load the font file we want to use (the file must be in the data folder in the sketch floder), 
  // with the size 60 and the alignment CENTER Only works with TTF files
  grp = RG.getText("TYPE", font, 200, CENTER);

  // Enable smoothing
  smooth();
}

void draw(){
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }

  // Clean frame
  background(255);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  
  // Get the points on the curve's shape  
  //RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizerLength(100);
  
  float n = noise(noiseScale) * mouseX;
  //float n = random(-1, 1) * mouseX;

  noStroke();
  fill(255, 0, 0);
  for (int i = 0; i < grp.children.length; i++) {
    beginShape();
    RPoint[] letter = grp.children[i].getPoints();
    for(int j = 0; j < letter.length; j++){
      curveVertex(letter[j].x += (n*random(-0.01,0.01)), letter[j].y += (n*random(-0.01,0.01)));
    }
    endShape();
  }
  
  if (record) {
    endRecord();
    record = false;
  }

}

void mousePressed() {
  record = true;
}