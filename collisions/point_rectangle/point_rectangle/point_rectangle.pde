// Testing Collision between a Point and Rectangle

/* 
To see if a point is inside a square, we have to test:
- Is the X position of the point to the Right if the Left Edge?
- Is the X position of the Point to the Left of the Right Edge?
- Is the Y position of the point Below the Top Edge?
- Is the Y position of the point Above the Bottom Edge?

Testing the Left Edge

Defaule mode for rect() draws from the upper-left corner, the left-edge is at rx

- Left Edge Check
if(px >= rx) { 
  // to the right of the left edge
}

- Right Edge Check - X position = left edge plus width
float rightEdge = rx + rw;
if (px <= rightEdge) {
  // to the left of the right edge
}

- Use same logic for top and bottom

- The full if statement:
if (px >= rx &&
    px <= rx + rw &&
    py >= ry &&
    py <= ry + rh) {
      return true;
    }
    return false;
*/

float px = 0;    // point position (move with mouse)
float py = 0;

float sx = 200;  // square position
float sy = 100;
float sw = 200;
float sh = 200;

float r;
float b;

void setup() {
  size(600, 400);
  noCursor();
  
  strokeWeight(5);
}

void draw() {
  background(255);
  
  // update point to mouse coordinates
  px = mouseX;
  py = mouseY;
  
  // check for collision
  // if hit, change rectangle color
  boolean hit = pointRect(px, py, sx, sy, sw, sh);
  
  // Right and left sides
  if (px < sx) {
    r = map(px, 0, sx, 0, 255);
  } else if (px > sx+sw) {
    println("hello");
    r = map(px, width-(sx+sw), width, 255, 0);
  }
  
  if (py < sy) {
    b = map(py, 0, sy, 0, 150);
  } else if (py > sy+sh) {
    println("hello");
    b = map(py, width-(sy+sh), width, 150, 0);
  }
  println(r);
  
  
  if (hit) {
    fill(255, 150, 0);
  }
  else {
    fill(r, b, 0);
  }
  noStroke();
  rect(sx, sy, sw, sh);
  
  // draw the point
  stroke(0);
  point(px, py);
}

boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {
  
  // is the point inside the rectangle's bounds?
  if (px >= rx &&        // left edge
      px <= rx+rw &&    // right edge
      py >= ry &&       // below the top
      py <= ry+rh) {    // above the bottom
      return true;
  }
  return false;  
}
