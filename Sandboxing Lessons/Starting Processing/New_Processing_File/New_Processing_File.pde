// Global variables
int ballX, ballStartX, ballXMove;
int ballY, ballStartY, ballYMove;
void setup() {
  size(500, 500);
  ballStartX = width/2; //starting ball position
  ballStartY = height/2; //
  ballX = ballStartX;
  ballY = ballStartY;
  ballXMove = 1;
  ballYMove = 1;
}

void draw() {
  background(#03FF00); //Green
  if (ballX == 500 | ballY == 500) {
    if (ballX == 500) {
      ballXMove = ballXMove * (-1);
  }

  if (ballY == 500) {
    ballYMove = ballYMove + 1;
  }
  if (ballYMove == 500) {
    ballYMove = ballYMove * (-1);
  }
  }
  if (ballX <= 500) {
    ballX += ballXMove;
  }
  if (ballY <= 500) {
    ballY += ballYMove;
  }
  fill(0); //black
  ellipse(ballXMove+ballX, ballYMove+ballY, width/70, width/70); //ball is ratio of width
  //Pong table here is square but does not need to be
  //Thus take same key-variable for size of ball
  print ("ballX: " + ballX);
  println (", ballY: " +ballY);
}
