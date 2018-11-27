int a;
void setup() {
  println("this program adds two ints.");
}

void draw() {
}

void keyPressed() {
  a = Character.digit(key, 10);
  println(a);
  
}
