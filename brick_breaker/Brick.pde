class Brick {
  float x_offset;
  float y_offset;
  float x, y;
  int unit;
  color c;
  boolean brick_removed;
  
  // Constructor
  Brick(float x_offset_temp, float x_temp, float y_offset_temp, float y_temp, color c_temp) {
    x_offset = x_offset_temp;
    y_offset = y_offset_temp;
    x = x_temp;
    y = y_temp;
    c = c_temp;
    brick_removed = false;
  }
  
  void display() {
    fill(c);
    rect(x_offset + x, y_offset + y, 25, 12);
  }
  
  void reset() {
    x = 100;
    y = 100;
  }
  
  void intersect(Ball other) {
    // intersect top
    if (dist(other.x, other.y + other.diameter/2 + other.y_speed, other.x, y + y_offset) 
    < other.diameter/2 &&
    ((other.x > x + x_offset) && other.x < x + x_offset + 25)) {
      println("top", other.x, other.y + other.diameter/2 + other.y_speed, other.x, y + y_offset);
      other.y_direction *= -1;
      other.y = other.y + other.y_speed * other.y_direction;
      x = -100;
      y = -100;
      brick_removed = true;
      println(brick_removed);
    } 
    // right side
    else if (dist(other.x - other.diameter/2 - other.x_speed, other.y, x + x_offset + 25, other.y) 
    < other.diameter/2 && 
    (other.y > y + y_offset && other.y < y + y_offset + 12)) {
      println("right side", other.x - other.diameter/2 - other.x_speed, other.y, x + x_offset + 25, other.y);
      other.x_direction *= -1;
      other.x = other.x + other.x_speed * other.x_direction;
      x = -100;
      y = -100;
    }
    // left side
    else if (dist(other.x + other.diameter/2 + other.x_speed, other.y, x + x_offset, other.y) 
    < other.diameter/2 && 
    (other.y > y + y_offset && other.y < y + y_offset + 12)) {
      println("left side", other.x + other.diameter/2 + other.x_speed, other.y, x + x_offset, other.y);
      other.x_direction *= -1;
      other.x = other.x + other.x_speed * other.x_direction;
      x = -100;
      y = -100;
    }
    // bottom
    else if (dist(other.x, other.y - other.diameter/2 - other.y_speed, other.x, y + y_offset + 12) 
    < other.diameter/2 &&
    ((other.x > x + x_offset) && other.x < x + x_offset + 25)) {
      println("bottom", other.x, other.y - other.diameter/2 - other.y_speed, other.x, y + y_offset);
      other.y_direction *= -1;
      other.y = other.y + other.y_speed * other.y_direction;
      x = -100;
      y = -100;
    }
  }
}
  
