void gameover() { //=============================================
  image(gif[f], 0, 0, width, height);
  if (frameCount % 2 == 0); f++;
  if (f == numberOfFrames) f=0;
  
  //lose screen------------------------------------------
  if (lives == 0) {
    fail.play();
   fill(255, 0, 0);
   textAlign(CENTER, CENTER);
   textSize(150);
  textFont(robusta);
   text("GAMEOVER", 400, 300);
  }
  
  //win screen--------------------------------------------
  if (score == 36) {  
    win.play();
   fill(0, 255, 0);
   textAlign(CENTER, CENTER);
   textSize(150);
   textFont(robusta);
   text("YOU WIN", 400, 300);
  }
} //============================================================

void gameoverClicks() { //======================================
  mode = INTRO;
  intro.rewind();
  reset();
  
} //============================================================
