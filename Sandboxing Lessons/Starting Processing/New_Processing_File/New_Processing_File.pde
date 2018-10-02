// Global variables
int ballX, ballY;
int ballStartX, ballStartY;
int ballDiameter;
int ballMoveX = 1, ballMoveY = 1;
int paddleWidthRatio;
int paddleHeightRatio = 10;
int [] paddle = {0, 0};
int [] player = new int [4];
// End Global Variables

void setup() {
  size(500, 600);
  ballStartX = width/2; //Start Ball at Centre
  ballStartY = height/2;
  ballX = ballStartX;
  ballY = ballStartY;
  ballDiameter= width/70;
  
  paddleWidthRatio = ballDiameter/2;
  paddle[0] = paddleWidthRatio;
  paddle[1] = height/paddleHeightRatio; 
  player[0] = 0;
  player[1] = height/2 - height/paddleHeightRatio/2;
  int section = width / paddleWidthRatio;
  player[2] = width*(section-1)/section;
  player[3] = height/2;
}

void draw() {
  background(#03FF00); //Green
  //Calculating "next" ball position
  ballX += ballMoveX;
  ballY += ballMoveY;
  
  //Ball Movement within Pong Table
  if (ballX == width || ballX == 0) {
    ballMoveX = ballMoveX * (-1);
  }
  if (ballY == height || ballY == 0) {
    ballMoveY = ballMoveY * (-1);
  }
  
  //Printing Ball
  fill(0); //black
  ellipse(ballX, ballY, ballDiameter, ballDiameter);
  
  //Code to Move Paddles
  //Player 1 Movement
  if (keyPressed == true & key == CODED) { //alternate is void keyPressed(){}, always contains the most recent keyboard key stroke
    if (keyCode == UP) { //KeyCode is used for UP, DOWN, LEFT, and RIGHT; and ALT, CONTROL, and SHIFT
      if (player[1] >= 5) { //Easier to use && instead of nesting IF Statements
        player[1] -= 5; //Review incrementation other than -1
      }
      if (player[1] < 0) { //Catch any subtraction equalling less than zero
        player[1] = 0;
      }
    }
    
     if (keyCode == DOWN) {
      if (player[1] + paddle[1] <= height) {
        player[1] += 5; //Review incrementation other than +1
      }
      if (player[1] + paddle[1] > height) {
        player[1] = height - paddle[1] - 1; //Cannot add "player[1] + paddle[1]" in an assignment; thus, algebra needed
        //Note: the "-1" shows the black border of the paddle at the bottom, which looks more aesthetic
        //Note: the height is actaully -1 pixel because of the border
      }
    }
  } //End of keyPressed
  
  //Player 2 Movement
  player[3] = ballY - paddle[1]/2;
  if (player[3] <= 0) {
    player[3] = 0;
  }
  if (player[3] >= height - paddle[1]){
    player[3] = height - paddle[1] - 1;
  }
  
  
}
