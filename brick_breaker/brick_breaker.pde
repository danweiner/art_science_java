int rect_x;
int rect_y;
int rect_w;
int rect_h;

void setup() {
  size(400, 400);
  rect_w = 50;
  rect_h = 10;
  rect_x = width/2 - rect_w/2;
  rect_y = height - 20;
}

void draw() {
  background(224);
  line(width/2, 0, width/2, height);
  rect(rect_x, rect_y, rect_w, rect_h);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    rect_x += 5;
  } else if (keyCode == LEFT) {
    rect_x -= 5;
  }
}
