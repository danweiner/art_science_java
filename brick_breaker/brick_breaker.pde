int rect_x;
int rect_y;
int rect_w;
int rect_h;

int ball_x;
int ball_y;
int ball_size;
int ball_r;

int x_speed;
int y_speed;

int paddle_move;

int unit = 25;
int count;
Brick[] bricks;

void setup() {
  size(400, 400);
  
  rect_w = 50;
  rect_h = 10;
  rect_x = width/2 - rect_w/2;
  rect_y = height - 20;
  
  ball_x = width/2;
  ball_y = 0;
  ball_size = 25;
  ball_r = ball_size/2;
  
  x_speed = 2;
  y_speed = 2;
  
  paddle_move = 10;
  
  int wideCount = width / unit;
  count = wideCount;
  bricks = new Brick[2];
  
  int index = 0;
  for (int x = 0; x < 2; x++) {
    bricks[index++] = new Brick(x*unit, unit/2, 50, unit);
  }
}

void draw() {
  background(224);
  fill(255);
  line(width/2, 0, width/2, height);
  rect(rect_x, rect_y, rect_w, rect_h);
  ellipse(ball_x, ball_y, ball_size, ball_size);
  intersect();
  move(x_speed, y_speed);
  collideOffWalls();
  
  for (Brick brick : bricks) {
    brick.display();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    rect_x += paddle_move;
  } else if (keyCode == LEFT) {
    rect_x -= paddle_move;
  }
}

void intersect() {
  if ((ball_y + ball_r + y_speed > rect_y) && (ball_x + ball_r + x_speed > rect_x) && 
      (ball_x - ball_r - x_speed < rect_x + rect_w)) {
    y_speed *= -1;
  }
}

void move(int x_s, int y_s) {
  ball_x += x_s;
  ball_y += y_s;
}

void collideOffWalls() {
  if (ball_x > width || ball_x < 0) {
    x_speed = x_speed * -1;
  } else if (ball_y < 0) {
    y_speed = y_speed * -1;
  }
  if (ball_y > height - ball_r) {
    ball_y = height + 100;
  }
}

class Brick {
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  
  // Constructor
  Brick(int xOffsetTemp, float xTemp, float yTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    //yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    unit = tempUnit;
  }
  
  void display() {
    fill(255, 0, 0);
    rect(xOffset + x, y, 25, 12);
  }
}
