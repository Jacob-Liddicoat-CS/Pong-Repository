// Global Variables
int ballX, ballY;
int ballStartX, ballStartY;
int ballDiameter;
int ballMoveX = 1, ballMoveY = 1;
int [] score = {0, 0};
int number;
int counter;
int paddleWidthRatio; //Variable is being repeated in setup() figuring good width of paddle, half of ballDiameter
//Reason: do not bounce of the edge of the paddle
int paddleHeightRatio = 10;
int [] paddle = {0, 0}; //Paddle width and height
int [] player = new int [4]; //Alternate way of initializing an Array, for paddles
//0: Player1_X, 1:Player1_Y, 2:Player2_X, 3:Player2_Y
// End Global Variables

void setup() {
  size(500, 600);
  ballStartX = width/2;
  ballStartY = height/2;
  ballX = ballStartX;
  ballY = ballStartY;
  ballDiameter = width/70; //must pick one dimension for both ellipse diameters, for a circle

  paddleWidthRatio = ballDiameter/2;
  paddle[0] = paddleWidthRatio; 
  paddle[1] = height/paddleHeightRatio; 
  player[0] = 0;
  player[1] = height/2 - height/paddleHeightRatio/2; //middle minus half the paddle to find the paddle's center
  int section = width / paddleWidthRatio; // Local Variable: calculate the divisions of the paddle and draw in the last one
  player[2] = width*(section-1)/section; // *(paddlewidthRatio-1)/paddlewidthRatio
  player[3] = height/2;

  //Randomizes the ball
  ballMoveX = int (random (-2, 2));
  while (ballMoveX == 0) {
    ballMoveX = int (random (-2, 2));
  }
  ballMoveY = int (random (-2, 2));
  while (ballMoveY == 0) {
    ballMoveY = int (random (-2, 2));
  }
}

void draw() {
  background(#E9FF03); //Yellow

  //Calcualting "next" ball position
  //Section necessary when calling functions so passing current arguements
  ballX += ballMoveX; //origonally x+1 operation
  ballY += ballMoveY; //origonally x+1 operation

  // Code to bounce off of paddles
  if (ballX == paddle[0]+(ballDiameter/2) && ballY >= player[1] & ballY <= player[1] + paddle[1]) {
    ballMoveX *= (-1); //Shorthand for previous x*-1
  }
  if (ballX == player[2]-(ballDiameter/2) && ballY >= player[3] & ballY <= player[3] + paddle[1]) {
    ballMoveX *= (-1); //Shorthand for previous x*-1
  }

  // Code to Bounce off Floor and Ceiling
  if (ballY == 0+(ballDiameter/2) || ballY == height-(ballDiameter/2) ) {
    ballMoveY = ballMoveY * (-1);
  }

  //Ball Movement within Pong Table after scoring
  if (ballX == 0+(ballDiameter/2) || ballX == width-(ballDiameter/2)) { //Score for Player 2, note the index
    if (ballX == 0+(ballDiameter/2)) { //Player 2 Score
      score[1] += 1;
    }
    if (ballX == width-(ballDiameter/2)) { //Player 1 Score
      score[0] += 1;
    }

    //Resetting the Ball Position
    ballX = ballStartX;
    ballY = ballStartY;

    //Resetting the ARROW Controlled Paddle to the center
    player[1] = height/2 - height/paddleHeightRatio/2;
  }

  //Printing Ball
  fill(0); //Black
  ellipse(ballX, ballY, ballDiameter, ballDiameter);

  //Code to Move Paddles, keyboard and mouseX&Y key variables
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
  if (player[3] >= height - paddle[1]) {
    player[3] = height - paddle[1] - 1;
  }

  //Drawing Paddles
  fill(#FF00FF); //Purple
  rect(player[0], player[1], paddle[0], paddle[1]);
  rect(player[2], player[3], paddle[0], paddle[1]);
  fill(0); //Reseting to Black

  //Printing Score to the Canvas
  textSize(0.1*width);
  text(score[0], (width*1/5)-(0.1*width), height*1/5); //Printing to ration of screen, Player 1 is minusing width of font
  // Note: review of Character escape and this seems to "busy" on the screen
  text(score[1], width*4/5, height*1/5);

  //Debugging Ball Position
  //print ("Ball X-Value: " + ballX);
  //println (", Ball Y-Value: " + ballY);
}
