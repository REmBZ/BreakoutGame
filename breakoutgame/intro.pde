void intro() { //============================================

  //Title-------------------------------------------
  image(gif[f], 0, 0, width, height);
  if (frameCount % 2 == 0); f++;
  if (f == numberOfFrames) f=0;
  
  //sound effects
  intro.play();

  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  textSize(150);
  fill(pastel);
  robusta = createFont("Robusta II Sans.ttf", 100);
  textFont(robusta);
  text("BREAKOUT", 400, 250);
  
  //start button--------------------------------------
  tactile(350, 375, 100, 75);
  rect(400, 425, 100, 50);
  fill(0);
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("START", 400, 425);
} //========================================================

void introClicks() { //=====================================
  if (mouseX > 350 && mouseX < 450 && mouseY > 375 && mouseY < 450) { //Start
    mode = GAME;
    intro.pause();
  }
} //=========================================================
