int rect_x;
int rect_y;
int rect_w;
int rect_h;

int ball_x;
int ball_y;
int ball_size;
int ball_r;

int speed;

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
}

void draw() {
  background(224);
  line(width/2, 0, width/2, height);
  rect(rect_x, rect_y, rect_w, rect_h);
  ellipse(ball_x, ball_y, ball_size, ball_size);
  intersect();
  move(3);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    rect_x += 5;
  } else if (keyCode == LEFT) {
    rect_x -= 5;
  }
}

void intersect() {
  boolean intersect_top = (ball_y + ball_r > rect_y) ;
  boolean intersect_sides = (ball_x + ball_r > rect_x) && 
                            (ball_x - ball_r < rect_x + rect_w);
  if (intersect_top && intersect_sides) {
    fill(255, 0, 0);
  }
}

void move(int s) {
  //ball_x += s;
  ball_y += s;
}
