void tactile(int x2, int y2, int w2, int h2) { //Start
  if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2) {
   fill(200); 
  } else {
    fill(255);
  }
} //========================================================

void tactile(int x, int y, int r) { //pause
 if (dist(x, y, mouseX, mouseY) < 40) {
   fill(200);
 } else {
   fill(255);
 }
}//=========================================================

void reset() { //===========================================
  
  //initialize paddle-----------------------------------------------
  px = width/2;
  py = height;
  pd = 100;
  
   //initialize ball-------------------------------------------------
  bx = width/2;
  by = height/2;
  bd = 20;
  
  //game initialization-----------------------------
  score = 0;
  lives = 3;
  
  //ball--------------------------------------------
   a = radians(450);
  vx = 6*cos(a);
  vy = 6*sin(a);
   k = sqrt((bx - px)*(bx - px) + (by - py)*(by - py))/64;
  
  //initialize brick--------------------------------
   brickw = 50;
  brickh = 20;
  n = 36;
  x = new int[n];
  y = new int[n];
  alive = new boolean [n];
     
  tempx = 100;
  tempy = 100;
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 70;
    if (tempx == 730) {
      tempx = 100;
      tempy = tempy + 50;
  }
    i = i+1;
  }
} //===========================================================
