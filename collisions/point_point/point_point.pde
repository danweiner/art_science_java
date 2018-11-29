// Point / Point collision
// Check to see if their X and Y coordinates are the same

// Pass in X/Y coordinates for both points as arguments
boolean pointPoint(float x1, float y1, float x2, float y2) {
  if (x1 == x2 && y1 == y2) {
    // points are in the same place: collision!
    return true;
  } 
  // not colliding
  return false;
}
