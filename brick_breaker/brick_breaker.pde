int paddle_x;
int paddle_y;
int paddle_w;
int paddle_h;

//int ball_x;
//int ball_y;
//int ball_size;
//int ball_r;

int x_speed;
int y_speed;

int x_direction = 1;
int y_direction = 1;

int paddle_move;

int brick_width;;
int brick_height;;
int starting_pos;
int count;
Brick[] bricks;

Ball ball;

void setup() {
  size(400, 400);
  
  paddle_w = 50;
  paddle_h = 10;
  paddle_x = width/2 - paddle_w/2;
  paddle_y = height - 20;
  
  //ball_x = width/2;
  //ball_y = 0;
  //ball_size = 25;
  //ball_r = ball_size/2;
  
  x_speed = 2;
  y_speed = 2;
  
  brick_width = 25;
  brick_height = brick_width/2;
  
  starting_pos = 100;
  
  paddle_move = 10;
  
  int wide_count = (width - (starting_pos*2)) / brick_width;
  println(wide_count);
  int high_count = 5;
  count = wide_count * high_count;
  bricks = new Brick[count];
  
  int index = 0;
  for (int y = 0; y < high_count; y++) {
    for (int x = 0; x < wide_count; x++) {
      bricks[index++] = new Brick(x*brick_width, 100, y*brick_height, 100);
    }
  }
  
  ball = new Ball(width/2 - 30, 0, 25, 0, 2, 1, 1);
  //ball = new Ball(width-20, 0, 25, -1, 2, 1, 1);
   
  for (Brick brick : bricks) {
    println(brick.x + brick.x_offset);
  }
}

void draw() {
  background(224);
  fill(255);
  line(width/2, 0, width/2, height);
  rect(paddle_x, paddle_y, paddle_w, paddle_h);
  //ellipse(ball_x, ball_y, ball_size, ball_size);
  intersect();
  //collideOffWalls();
  //move();
  
  ball.move();
  ball.display();
  
  for (Brick brick : bricks) {
    brick.display();
    brick.intersect(ball);
  }
  
}

void keyPressed() {
  if (keyCode == RIGHT) {
    paddle_x += paddle_move;
  } else if (keyCode == LEFT) {
    paddle_x -= paddle_move;
  }
}

void intersect() {
  if ((ball.y + ball.diameter/2 + ball.y_speed > paddle_y) && 
    (ball.x + ball.diameter/2 + ball.x_speed > paddle_x) && 
      (ball.x - ball.diameter/2 - ball.x_speed < paddle_x + paddle_w)) {
        println("hello");
    ball.y_direction *= -1;
  }
}

//void move() {
//  ball_x += x_speed * x_direction;
//  ball_y += y_speed * y_direction;
//}

//void collideOffWalls() {
//  if (ball_x > width || ball_x < 0) {
//    println(y_direction, x_direction);
//    x_direction *= -1;
//  } else if (ball_y < 0) {
//    y_direction *= -1;
//  }
//  if (ball_y > height - ball_r) {
//    // give ball a fixed location off bottom of screen
//    ball_y = height + 100;
//    ball_x = width/2;
//  }
//}



class Ball {
  float x, y;
  float diameter;
  float x_speed, y_speed;
  int x_direction, y_direction;
  
  Ball(float cx, float cy, float diam_temp, float x_speed_temp, float y_speed_temp, int x_dir_temp, int y_dir_temp) {
        x = cx;
        y = cy;
        diameter = diam_temp;
        x_speed = x_speed_temp;
        y_speed = y_speed_temp;
        x_direction = x_dir_temp;
        y_direction = y_dir_temp;
      }
      
  void move() {
    x = x + x_speed * x_direction;
    y = y + y_speed * y_direction;
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, diameter, diameter);
  }
}
