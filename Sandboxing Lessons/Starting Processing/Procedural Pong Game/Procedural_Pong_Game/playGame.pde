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


  ballSquish(); //Procedure to be called during playGame
  //Called when ball bounces (top, bottom, & paddles)

  //Draws the Ball
  fill(0); //Black
  ellipse(ballX, ballY, ballDiameter, ballDiameter);
}
