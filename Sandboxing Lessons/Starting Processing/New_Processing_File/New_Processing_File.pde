// Global variables
int ballX, ballStartX;
int ballY, ballStartY;
int ballDiameter;
float ballMoveX = 1.0;
float ballMoveY = 1.0;

void setup() {
  size(500, 500);
  ballStartX = width/2; //Start Ball at Centre
  ballStartY = height/2;
  ballX = ballStartX;
  ballY = ballStartY;
  ballDiameter= width/70;
}

void draw() {
  background(#03FF00); //Green
  if (ballX == width | ballX == 0| ballY == height | ballY ==0) {
    if (ballX == width | ballX == 0) {
      ballMoveX = ballMoveX * (-1);
  }

  if (ballY == height - ballDiameter/2 | ballY == 0 + ballDiameter/2) {
    ballMoveY = ballMoveY * (-1);
   }
  }
  if (ballX <= width && ballX >=0) {
    ballX += ballMoveX;
  }
  if (ballY <= height && ballY >= 0) {
    ballY += ballMoveY;
  }
  fill(0); //black
  ellipse(ballX, ballY, ballDiameter, ballDiameter); //ball is ratio of width
  //Thus take same key-variable for size of ball
  print ("ballX: " + ballX);
  println (", ballY: " +ballY);
}
