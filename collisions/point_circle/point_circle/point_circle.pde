// Point / Circle Collision

/*
Logic:
a^2 * b^2 = c^2

c = sqrt( (a*a) + (b*b) );

float distX = px - cx;
float distY = py - cy

Use Pythagorean Theorem
float distance = sqrt( (distX*distX) + (distY*distY) ); 
i.e.: point(10, 10), center(40,50) - distance = 50

Check for collision:
if (distance < r) return true;
*/

float px =      0;    // point position
float py =      0;

float cx =      300;  // circle center
float cy =      200;
float radius =  100;  // circle radius

void setup() {
  size(600, 400);
  noCursor();
  
  strokeWeight(5);
}

void draw() {
  background(255);
  
  // update point position to mouse coordinates
  px = mouseX;
  py = mouseY;
  
  // check for collision!
  boolean hit = pointCircle(px, py, cx, cy, radius);
  
  // draw circle
  // change color if hit
  if (hit) {
    fill(255, 150, 0);
  } else {
    fill(0, 150, 255);
  }
  
  noStroke();
  // default is ellipseMode(CENTER) which requires diameter
  ellipse(cx, cy, radius*2, radius*2);
  
  stroke(0);
  point(px, py);
}

boolean pointCircle(float px, float py, float cx, float cy, float r) {
  
  // get distance between point and circle's center
  // using Pythagorean Theorem as explained above
  
  // Could also use built in distance function
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );
  
  if (distance <= r) {
    return true;
  }
  return false;
}
