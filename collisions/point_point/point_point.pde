// Point / Point collision

// This program will draw two points.  One point will be gray and 
// controlled by the mouse.  When the gray point collides with the other
// point, the background will change color!

float px, py;          // point controlled by mouse
float targetX = 300;   // target point coordinates
float targetY = 200;

void setup() {
  size(600, 400);
  noCursor();
  
  strokeWeight(5); // thicker stroke = easier to see
}

void draw() {
  
  // update point position to mouse coordinates
  px = mouseX;
  py = mouseY;
  
  // check for collision!
  // if hit, make background orange; if not, make it white
  boolean colliding = pointPoint(px, py, targetX, targetY);
  
  if (colliding) {
    background(255, 150, 0); 
  }
  else {
    background(255);
  }
  
  // draw the points
  stroke(0, 150, 255);
  point(targetX, targetY);
  
  stroke(0, 150);
  point(px, py);
}

  // Pass in X/Y coordinates for both points as arguments
boolean pointPoint(float x1, float y1, float x2, float y2) {
  if (dist(x1, y1, x2, y2) < 5) {
    // points are in the same place: collision!
    return true;
    } 
    // not colliding
  return false;
}
