// Global variables
int ballX, ballPositionX;
int ballY, ballPositionY;
void setup() {
  size(500, 500);
  ballPositionX = width/2; //starting ball position
  ballPositionY = height/2; //
}

void draw() {
  background(#03FF00); //Green
  if (ballPositionX < 500) {
    ballX = ballX + 1;
  }
  if (ballPositionY < 500) {
    ballY = ballY + 1;
  }
  fill(0); //black
  ellipse(ballPositionX+ballX, ballPositionY+ballY, width/70, width/70); //ball is ratio of width
  //Pong table here is square but does not need to be
  //Thus take same key-variable for size of ball
}
