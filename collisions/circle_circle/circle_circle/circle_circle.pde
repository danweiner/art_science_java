// Tests Circle / Circle Collision

// Uses the same Pythagorean Theorem from Point/Circle to test if
// the two circles are colliding

/*
float distX = c1x - c2x;
float distY = c1y - c2y;
float distance = sqrt( (distX*distX) + (distY*distY) );

To check if they are colliding, we see if the distace betwween them is
less than the sum of their radii

if (distance <= c1r + c2r) {
  return true;
}
return false;
*/

float c1x = 0;    // circle 1 position (controlled by mouse)
float c1y = 0;
float c1r = 30;

float c2x = 300;
float c2y = 200;
float c2r = 100;

void setup() {
  size(600, 400);
  noStroke();
}

void draw() {
  background(255);
  
  // update position to mouse coordinates
  c1x = mouseX;
  c1y = mouseY;
  
  // check for collision
  // if hit, change color
  boolean hit = circleCircle(c1x, c1y, c1r, c2x, c2y, c2r);
  
  if (hit) {
    fill(255, 150, 0);
  }
  else {
    fill(0, 150, 255);
  }
  ellipse(c2x, c2y, c2r*2, c2r*2);
  
  // other circle, controlled by mouse
  fill(0, 150);
  ellipse(c1x, c1y, c1r*2, c1r*2);
}

boolean circleCircle(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {
  
  // get the distance between the circles' centers
  // use the Pythagorean Theorem to compute the distance
  //float distX = c1x - c2x;
  //float distY = c1y - c2y;
  //float distance = sqrt( (distX*distX) + (distY*distY) );
  float distance = dist(c1x, c1y, c2x, c2y);
  
  if (distance <= c1r+c2r) {
    return true;
  }
  return false;
}
