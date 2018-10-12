// Global Variables (Note: any variables at the beginning of Tabs, before "void" are considered Global Variables)
Boolean start = false;
int ballX, ballY;
int ballStartX, ballStartY;
int ballDiameter;
int ballMoveX = 1, ballMoveY = 1;
int paddleWidthRatio;
int paddleHeightRatio = 10;
int [] paddle = {0, 0}; //Paddle width and height
int [] player = new int [4]; //Alternate way of initializing an Array, for paddles
//0: Player1_X, 1:Player1_Y, 2:Player2_X, 3:Player2_Y
// End Global Variables

//This File is the main file
//It calls each Procedure in either setup() or draw()
void setup() {
  size(500, 600);
  //Debug: square vs rectangle
  gameStart(); //arithemetic to calcaulte starting positions of paddles and ball
}

void draw() {
  //Code to change "Start" Boolean Variable to true & to Quit the Game
  startStop();

  if (start==true) { //Contains the entire Main File Code

    playGame(); //Also contains "ball squish" procedure, with change in frameRate
    // Also contains highlihgts for positive user feedback
    score(); //contains highlihgts for positive user feedback
  }
}
