void playGame () {

  background(#E9FF03); //Yellow

  //Calcualting "next" ball position
  //Section necessary when calling functions so passing current arguements
  ballX += ballMoveX; //origonally x+1 operation
  ballY += ballMoveY; //origonally x+1 operation

  //Ball Movement within Pong Table
  if (ballX == 0+ballDiameter || ballX == width-ballDiameter) {
    ballMoveX= ballMoveX * (-1);
  }
  if (ballY == 0+ballDiameter || ballY == height-ballDiameter ) {
    ballMoveY = ballMoveY * (-1);
  }

  // Code to bounce off of a paddle
  //Player 1 Paddle Bounce
  if (ballX == paddle[0] && ballY >= player[1] & ballY <= player[1] + paddle[1]) {
    ballMoveX *= (-1); //Shorthand for previous x*-1
  }
  //Player 2 Paddle Bounce
  if (ballX == paddle[0] && ballY >= player[3] & ballY <= player[3] + paddle[1]) {
    ballMoveX *= (-1);
  }

  if (ballY == height || ballY == 0) {
    ballMoveY = ballMoveY * (-1);
  }

  ballSquish(); //Procedure to be called during playGame
  //Called when ball bounces (top, bottom, & paddles)

  //Draws the Ball
  fill(0); //Black
  ellipse(ballX, ballY, ballDiameter, ballDiameter);
  
  //Drawing Paddles
  fill(#FF00FF); //Purple
  rect(player[0], player[1], paddle[0], paddle[1]);
  rect(player[2], player[3], paddle[0], paddle[1]);
  fill(0); //Reseting to Black

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
}
