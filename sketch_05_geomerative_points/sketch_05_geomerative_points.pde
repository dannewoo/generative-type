import geomerative.*;
import processing.pdf.*;
boolean record;
String font = "FreeSans.ttf";

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RShape grp;
RPoint[] points;

void setup(){
  // Initilaize the sketch
  size(600,400);
  background(255);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder)
  //  Only works with TTF files
  grp = RG.getText("TYPE", font, 200, CENTER);

  beginRecord(PDF, "fileName.pdf"); 

  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  
  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizer(RG.ADAPTATIVE);
  //RG.setPolygonizerLength(4);
  points = grp.getPoints();
  
  noStroke();
  // Draw points as circles
  for(int i=0; i<points.length; i++){
    float random = random(2, 25);
    int c = int(random(255));
    fill(c, 0, 0, c);
    ellipse(points[i].x, points[i].y, random, random);  
  }
  
  endRecord();
}