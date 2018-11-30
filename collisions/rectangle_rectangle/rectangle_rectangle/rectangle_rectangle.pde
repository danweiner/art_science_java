// Checking for collisions between Rectangle and Rectangle

/*
We have to check:
- Is the Right edge of r1 to the Right of the Left Edge of r2?
- Is the Left Edge of r1 to the Left of the Right Edge of r2?
- Is the Bottom Edge of r1 Below the Top Edge of r2?
- Is the Top Edge of r1 Above the Bottom Edge of r2?

- Right Edge of r1 vs Left Edge of r2
float r1RightEdge = r1x + r1w;
if (r1RightEdge >= r2x) {
  // right edge of r1 is past left edge of r2
}

- To check all four edges:
if (r1 + r1w >= r2x &&    // r1 right edge past r2 left
    r1x <= r2x + r2w &&    // r1 left edge past r2 right
    r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
    r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
    return true;
    }
    return false;
*/

float s1x = 0;    // square position (move with mouse)
float s1y = 0;
float s1w = 30;
float s1h = 30;

float s2x = 200;
float s2y = 100;
float s2w = 200;
float s2h = 200;

void setup() {
  size(600, 400);
  noStroke();
}

void draw() {
  background(255);
  
  // update square to mouse coordinated
  s1x = mouseX;
  s1y = mouseY;
  
  // check for collision
  // if hit, change rectangle color
  boolean hit = rectRect(s1x, s1y, s1w, s1h, s2x, s2y, s2w, s2h);
  
  if(hit) {
    fill(255, 150, 0);
  }
  else {
    fill(0, 150, 255);
  }
  rect(s2x, s2y, s2w, s2h);
  
  // draw the other square
  fill(0, 150);
  rect(s1x, s1y, s1w, s1h);
}

boolean rectRect(float r1x, float r1y, float r1w, float r1h, 
                  float r2x, float r2y, float r2w, float r2h) {
  // are the sides of one rect touching the other?
  
  if (r1x + r1w >= r2x &&
      r1x <= r2x + r2w &&
      r1y + r1h >= r2y &&
      r1y <= r2y + r2h) {
        return true;
      }
  return false;
}
