int rect_x;
int rect_y;
int rect_w;
int rect_h;

int ball_x;
int ball_y;
int ball_size;
int ball_r;

void setup() {
  size(400, 400);
  rect_w = 50;
  rect_h = 10;
  rect_x = width/2 - rect_w/2;
  rect_y = height - 20;
  
  ball_x = width/2;
  ball_y = height/2;
  ball_size = 25;
  ball_r = ball_size/2;
}

void draw() {
  background(224);
  line(width/2, 0, width/2, height);
  rect(rect_x, rect_y, rect_w, rect_h);
  ellipse(ball_x, ball_y, ball_size, ball_size);
  ball_y += 2;
  if (ball_y + ball_r > rect_y) {
    fill(255, 0, 0);
  }
  
}

void keyPressed() {
  if (keyCode == RIGHT) {
    rect_x += 5;
  } else if (keyCode == LEFT) {
    rect_x -= 5;
  }
}
