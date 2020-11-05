void game() { //===================================================
  image(retro, 0, 0, width, height);
  
  //scoreboard-----------------------------------------------
  textSize(30);
  fill(255);
  text("SCORE: " + score, 710, 30);
  text("LIvES: " + lives, 710, 60);
  
  if (lives == 0) {
    mode = GAMEOVER;
    fail.rewind();
  }
  if (score == 36) {
    mode = GAMEOVER;
    win.rewind();
  }
  
  //paddle---------------------------------------------------
  fill(255);
  stroke(0);
  circle(px, py, pd);
  fill(0, 0, 255);
  
  
  //move paddles---------------------------------------------
  if (akey == true) px = px - 5;
  if (dkey == true) px = px + 5;
  if (leftkey == true) px = px - 5;
  if (rightkey == true) px = px + 5;
  
  //ball-----------------------------------------------------
  fill(pastel);
  stroke(0);
  circle(bx, by, bd);
  
  //moving ball----------------------------------------------
  timer--;
  if (timer < 0) {
  bx = bx + vx;
  by = by + vy;
  }
  
  //limit bounce----------------------------------------------
  if (px < 75) {
    px = 75;
  }
  if (px > 695) {
    px = 695;
  }
  
   //losing----------------------------------------------------
  if (by > 600) {
    wall.rewind();
    wall.play();
    bx = width/2;
    by = height/2;
    timer = 100;
    lives--;
  }
  
    //ball bounce---------------------------------------------------
  if (dist(bx, by, px, py) <= bd/2 + pd/2) {
    paddle.rewind();
    paddle.play();
    vx = (bx - px)/k/2;
    vy = (by - py)/k/2;
  }
  if (bx < 10 || bx > width) {
    paddle.rewind();
    paddle.play();
   vx = vx * -1; 
  }
  if (by < 10 || by > height) {
    paddle.rewind();
    paddle.play();
   vy = vy * -1; 
  }
  
  //brick------------------------------------------------------
  int i = 0;
  while(i < n) {
    if (alive[i] == true) {
   manageBrick(i);
    }
    i = i+1;
  }
  
  //pause button------------------------------------------------
  tactile(30, 30, 35);
  strokeWeight(3);
  stroke(0);
  circle(30, 30, 45);
  
  fill(0);
  textSize(40);
  gamer = createFont("Gamer.ttf", 40);
  textFont(gamer);
  text("||", 30, 23);
} //===================================================================

void gameClicks() { //==================================================
  if (dist(mouseX, mouseY, 30, 30) < 20) { 
    mode = PAUSE;
  }
} //====================================================================

void manageBrick(int i) { //============================================
    
    if (y[i] == 100) fill(red);
    if (y[i] == 150) fill(green);
    if (y[i] == 200) fill(orange);
    if (y[i] == 250) fill(blue);
    rect(x[i], y[i], brickw, brickh);
    
    //brick collisions-----------------------------------------
    if (dist(bx, by, x[i], y[i]) <= bd/2 + brickw/2) { 
    boop.rewind();
    boop.play();
    vx = (bx - x[i])/k;
    vy = (by - y[i])/k;
    score++;
    alive[i] = false;
  }
} //===================================================================
