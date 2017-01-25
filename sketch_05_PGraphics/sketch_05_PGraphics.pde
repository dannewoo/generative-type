int maxParticles = 100; // the maximum number of active particles
ArrayList <Particle> particles = new ArrayList <Particle> (); // the list of particles
int drawMode = 0; // cycle through the drawing modes by clicking the mouse
color BACKGROUND_COLOR = color(255);
color PGRAPHICS_COLOR = color(255, 165, 0);
float fc001;
PGraphics pg;
PFont font;

void setup() {
  fullScreen();
  //size(1280, 720, P2D);
  smooth(16); // higher smooth setting = higher quality rendering
  // create the offscreen PGraphics with the text 
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  font = createFont("comicbd.ttf", 300);
  pg.textFont(font);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text("TRUMP", pg.width/2, pg.height/2 - 50); 
  pg.endDraw();
  background(BACKGROUND_COLOR);
  image(pg, 0, 0); // draw text to the screen for drawMode 2
}

void draw() {
  fc001 = frameCount * 0.01;
  addRemoveParticles();
  // update and display each particle in the list
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
  image(pg, 0, 0); // draw text to the screen for drawMode 2
  particles.clear(); // remove all particles
}

void addRemoveParticles() {
  // remove particles with no life left
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
  // add particles until the maximum
  while (particles.size () < maxParticles) {
    particles.add(new Particle());
  }
}