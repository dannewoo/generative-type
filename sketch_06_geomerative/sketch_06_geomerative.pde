import geomerative.*;
import processing.pdf.*;
boolean record;
String[] fonts = { "FreeSans.ttf" };

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;
RPoint[] t;
RPoint[] y;
RPoint[] p;
RPoint[] e;
float noiseScale = 0.02;

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
  String font = fonts[int(random(fonts.length))];
  print(font);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  //  Only works with TTF files
  grp = RG.getText("TYPE", font, 72, CENTER);

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
  noiseScale = noiseScale + .1;
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);
  
  // Draw the group of shapes
  noFill();
  //stroke(0,0,200,150);
  noStroke();
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();
  
  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(4);
  points = grp.getPoints();
  t = grp.children[0].getPoints();
  y = grp.children[1].getPoints();
  p = grp.children[2].getPoints();
  e = grp.children[3].getPoints();

  
  float n = noise(noiseScale) * mouseX;
  //float n = random(-1, 1) * mouseX;

  //noFill();
  //stroke(0,200,0);
  fill(255, 0, 0);
  beginShape();
  for(int i=0; i<t.length; i++){
    vertex(points[i].x += (n*random(-0.01,0.01)), points[i].y += (n*random(-0.01,0.01)));
  }
  endShape();
  beginShape();
  for(int i=t.length; i<t.length+y.length; i++){
    vertex(points[i].x += (n*random(-0.01,0.01)), points[i].y += (n*random(-0.01,0.01)));
  }
  endShape();
  beginShape();
  for(int i=t.length+y.length; i<t.length+y.length+p.length; i++){
    vertex(points[i].x += (n*random(-0.01,0.01)), points[i].y += (n*random(-0.01,0.01)));
  }
  endShape();
  beginShape();
  for(int i=t.length+y.length+p.length; i<t.length+y.length+p.length+e.length; i++){
    vertex(points[i].x += (n*random(-0.01,0.01)), points[i].y += (n*random(-0.01,0.01)));
  }
  endShape();

  //fill(100 + (n*random(-0.5,0.5)), 100 + (n*random(-0.5,0.5)), 100 + (n*random(-0.5,0.5)));
  //stroke(0);
  fill(0);
  noStroke();
  for(int i=0; i<points.length; i++){
    //ellipse(points[i].x += (n*random(-0.01,0.01)), points[i].y += (n*random(-0.01,0.01)),2,2);  
  }
  
  if (record) {
    endRecord();
  record = false;
  }

}

void mousePressed() {
  record = true;
}