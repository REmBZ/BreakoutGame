import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Breakout
//Andy Ren
//1-1
//10/27/2020

//sound variables--------------------------------------------------
Minim minim;
AudioPlayer paddle, wall,intro, fail, win, boop;

//gif background intro---------------------------------------------------
PImage[] gif;
int numberOfFrames;
int f;

//game background----------------------------------------------------
PImage retro;

//font-------------------------------------------------------------
PFont robusta;
PFont gamer;

//game variables---------------------------------------------------
int score;
int lives;

//color schemes----------------------------------------------------
color orange = #FD7F19;
color blue = #5ECDFF;
color pastel = #FCEEAF;
color red = #EA2014;
color green = #4F6F23;

//Brick variables---------------------------------------------------
int[] x;
int[] y;
boolean[] alive;
int brickw, brickh;
int n;
int tempx, tempy;

//game variables-----------------------------------------------------
float px, py, pd; //paddle
float bx, by, bd; //ball

//ball variables-----------------------------------------------------
float a, k; //angle
float vx, vy; //velocity

//keyboard variables-------------------------------------------------
boolean akey, dkey, leftkey, rightkey;

//timer--------------------------------------------------------------
int timer;

int mode;
final int INTRO  = 1;
final int GAME  = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

void setup() { //======================================================
  
  //minim---------------------------------------------------------
  minim = new Minim(this);
  paddle = minim.loadFile("leftpaddle.wav");
  wall = minim.loadFile("wall.wav");
  intro = minim.loadFile("intro.wav");
  fail = minim.loadFile("failure.wav");
  win =  minim.loadFile("win.wav");
  boop =  minim.loadFile("boop.wav");
  
  //size-----------------------------------------------------------
  size(770, 600, FX2D);
  mode = INTRO;
  
  //initialize image-----------------------------------------------
  retro = loadImage("retro.jpg");
  
  //initialize bricks----------------------------------------------
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
  
  //gif background--------------------------------------------------
    numberOfFrames = 120;
  gif = new PImage[numberOfFrames];
  
  String firstZero = "0";
  String secondZero = "0";
  
  int g = 0;
  while(g < numberOfFrames) {
    gif[g] = loadImage("frame_"+firstZero+secondZero+g+"_delay-0.07s.gif");
    g++;
    if (g == 10) firstZero = "";
    if (g == 100) secondZero = "";
  }
  
  //initialize paddle-----------------------------------------------
  px = width/2;
  py = height;
  pd = 100;
  
  //initialize ball-------------------------------------------------
  bx = width/2;
  by = height/2;
  bd = 20;
  
  a = radians(450);
  vx = 6*cos(a);
  vy = 6*sin(a);
  k = sqrt((bx - px)*(bx - px) + (by - py)*(by - py))/64;
  
  //initialize score and lives---------------------------------------
  score = 0;
  lives = 3;
  reset();
  
  //initialize keyboard vars-----------------------------------------
  akey = dkey = leftkey = rightkey = false;
  
  //initialize timer-------------------------------------------------
  timer = 20; 
} //======================================================================

void draw() { //==========================================================
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  }else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
} //=======================================================================
