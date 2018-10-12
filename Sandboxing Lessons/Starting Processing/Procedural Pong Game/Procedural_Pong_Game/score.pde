void score () {
  //Printing Score to the Canvas
  textSize(0.1*width);
  text(score[0], (width*1/5)-(0.1*width), height*1/5); //Printing to ration of screen, Player 1 is minusing width of font
  // Note: review of Character escape and this seems to "busy" on the screen
  text(score[1], width*4/5, height*1/5);
}
