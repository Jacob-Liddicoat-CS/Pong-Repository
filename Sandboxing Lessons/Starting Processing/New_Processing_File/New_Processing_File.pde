// Global variables
int ballX;
void setup() {
  size(500, 500);
}

void draw() {
  background(#03FF00); //Green
  ballX=ballX + 1;
  
  fill(0); //black
  ellipse(width/2, height/2+ballX, width/70, width/70); //ball is ratio of width
  //Pong table here is square but does not need to be
  //Thus take same key-variable for size of ball
}
