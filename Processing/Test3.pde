Animation animation1, animation2;
import processing.serial.*;
import gifAnimation.*;

Serial myPort;    // The serial port
String inString;  // Input string from serial port
int lf = 10;   
int A=0;// ASCII linefeed
int gameScreen=0;
float FORWARD=450;
int yastmelhii=0;

PImage mariostop;
PImage mariojump;
PImage Monster;
PImage bg;
PImage INTRO;
PImage princess;
PImage turtle;

float xpos=10;
float ypos=20;
float drag = 30.0;
int zogs=0;
int SPEED=40;
float Uragshaa=80;


float x, y;
float dim = 120.0;
float dim1 = 120.0;

int Davtalt=3;


void setup() {
  size(820, 500);
  printArray(Serial.list());                        // Open the port:
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil(lf);
 
 
  
  mariojump = loadImage("Mario-jump.gif");
  Monster=loadImage("Monster.gif");
  bg = loadImage("back.jpg");
  INTRO=loadImage("INTRO.jpg");
  animation1 = new Animation("mario_running_", 3);
  animation2=  new Animation("Monster_", 9);
  princess=loadImage("Help1.gif");
  turtle=loadImage("turtle.png");
  
  ypos = height * 0.25;

  
}

void draw() {
  
  
   if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  }
}

//INTRO yvlaa 

void initScreen() {
 background(INTRO);

 }


///TOGLOOM EHLEV


void gameScreen() {

  background(bg);
  text("SounD SenSoR Received: " + inString, 150,20);
             
       //Princess Here     
     image(princess,650,330);
     
   
     //MONSTER HEseg
     animation2.display(510,320);
     
 
      
 //ZOgsolt Shalgah 
  
   if(zogs==0)
   {  
 
    animation1.display(Uragshaa,340);   
      
   Uragshaa = Uragshaa + 10;
  if (Uragshaa > width - dim1) {
    Uragshaa = dim1;
  } 
  
  translate(Uragshaa, height/2+dim1/2);
  translate(Uragshaa, dim1);
   
 
 }
     
  else
   {
   
     text("你好 BG...",350,180,200);
    
     image(mariojump,Uragshaa+10,190);
     Uragshaa = Uragshaa + 5;
      if (Uragshaa > width - dim1) {
    Uragshaa = dim1;
  } 
  
  translate(Uragshaa, height/2+dim1/2);
  translate(Uragshaa, dim1);
     
    
   }
     
         yastmelhii(); 
 

  

}



void yastmelhii(){
      //TURTLE YVSAAAA    
   
   image(turtle,FORWARD,385);
   FORWARD = FORWARD - SPEED;
  if (FORWARD > width - dim) {
    FORWARD = dim;
  } 
  
  translate(FORWARD, height/2+dim/2);
  translate(FORWARD, dim);
  
  if(FORWARD<10)
  {
  dim = 120.0;
  FORWARD=450;
  SPEED=SPEED++;
  }

}
//INTRO YVLAAA
 public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
  

}


//TOgloom Ehlev

void startGame() {
  gameScreen=1;
    
}


//SERAILIIN UTGA BARIV

void serialEvent(Serial arduino) {
   inString = arduino.readString();
   
   if(inString!=null)
   {
   inString=trim(inString);
   println(inString);
   
  if(trim(inString).equals("0.00"))
  {
  //ZOGSOOOROI PUNKTSI YMOOOO
  zogs=0; 
  println("STOP");
  }
  else{
  
 zogs=1; 
  println("JUMP");
   }
}}