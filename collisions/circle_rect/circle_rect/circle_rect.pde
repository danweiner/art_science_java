// Test for collision between a Circle and Rect

/* 
- Test which edge of the rect is closest to the circle
- See if there is a collision using the Pythagorean Theorem

- Create temp variable for square's closest X/Y edges
float testX = cx;
float testY = cy;

- Do the following tests:
- If the circle is to the Right of the square, check against the Right edge
- If the circle is to the Left of the square, check against the Left edge
- If the circle is Above the square, check against the Top edge
- If the circle is Below the square, check against the Bottom edge

- Here's the if statemnt:
if (cx < rx)         testX = rx;       // left edge
else if (cx > rx+rw) testX = rx + rw;  // right edge

if (cy < ry)         testY = ry;       // top edge
else if (cy > ry+rh) testY = ry+rh;    // bottom edge

- No curly braces needed if statement all on one line

float distX = cx - testX;
float disty = cy - testY;
float distance = sqrt( (distX*distX) + (distY*distY) );

- Compare this distance to circle radius
if (distance <= radius) {
  return true;
}
return false;

*/
