import geomerative.*;
import processing.pdf.*;
boolean record;
String font = "FreeSans.ttf";

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RShape grp;
RPoint[] points;
float noiseScale = 0.02;
float offset = 0.05;
int r = 2;

void setup(){
  // Initilaize the sketch
  size(600,400);
  frameRate(24);

  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder)
  //  Only works with TTF files
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
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizer(RG.ADAPTATIVE);
  //RG.setPolygonizerLength(4);
  points = grp.getPoints();
  
  float n = noise(noiseScale) * mouseX;
  //float n = random(-1, 1) * mouseX;

  fill(0);
  noStroke();
  // Draw points as circles
  for(int i=0; i<points.length; i++){
    ellipse(points[i].x += (n*random(-offset,offset)), points[i].y += (n*random(-offset,offset)),r,r);  
  }
  
  // Outlines of type (WRONG WAY)
  //beginShape();
  //for(int i=0; i<points.length; i++){
  //  vertex(points[i].x += (n*random(-offset,offset)), points[i].y += (n*random(-offset,offset)),r,r);  
  //}
  //endShape();
  
  if (record) {
    endRecord();
  record = false;
  }

}

void mousePressed() {
  record = true;
}