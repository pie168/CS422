/*import processing.sound.*;
SoundFile beepSound;
SoundFile byee;
SoundFile hello;
*/

Audio beepSound = new Audio();
Audio byee = new Audio();
Audio hello = new Audio();

int buttonHeight = 90;
int buttonWidth = 140;

int buttonCurve = 10;

int clickButtonHeight = 20;
int clickButtonWidth = 40;

int timerButtonSec = 0;
int timerButtonMin = 0;

int startX = 1100;
int startY = 400;

int tempX = 1100;
int tempY = 600;

int timerX = 1100;
int timerY = 500;

int boxWidth = 600;
int boxHeight = 200;

//Presets
int toastX = 30;
int toastY = 30;
int toastTimeMin = 5; //mins
int toastTimeSec = 30;
int toastTemp = 200;

boolean toastButton = false;

int warmX = 30;
int warmY = 130;
int warmTimeMin = 6;
int warmTimeSec = 15;
int warmTemp = 150;

int pizzaX = 30;
int pizzaY = 230;
int pizzaTimeMin = 15;
int pizzaTimeSec = 45;
int pizzaTemp = 400;

int gbX = 30;
int gbY = 330;
int gbTimeMin = 2;
int gbTimeSec = 10;
int gbTemp = 123;

PFont f;

boolean timerOn = false;
boolean timerMode = false;
boolean tempMode = false;
boolean presetMode = false;
boolean everythingOn = false;
boolean toastMode = false;
boolean golden = true;
boolean crispy = false;
boolean burnt = false;
boolean celsius = false;
boolean lockScreen = false;
boolean invis = false;
boolean muteOn = false;
boolean stop = false;
int sec, mins;

int sec1, sec2;
int hundreds,tens,ones = 0;

int timerSec = 0;
int timerMin = 0;
int currTemp = 0;

int reset = 0;



PImage lock,unlock, mute, unmute, incognito;

void loadSounds(){
  // beep soundfile shortened from http://soundbible.com/2158-Text-Message-Alert-5.html
  
  //Processing load sound
  //beepSound = new SoundFile(this, "Ding.mp3");
  //byee = new SoundFile(this,"Bye.mp3");
  //hello = new SoundFile(this,"hello.mp3");
  // processing.js load sound
  
  beepSound.setAttribute("src","Ding.mp3");
  byee.setAttribute("src","Bye.mp3");
  hello.setAttribute("src","hello.mp3");
  
}

void playBeep() {
  // play audio in processing or processing.js
  beepSound.play();
}

void playBye() {

  byee.play();
}
void playHello() {
  hello.play();
}

void setup(){

  size(1280, 800);
  loadSounds();
  f = createFont("Arial",24,true);
  
  lock = loadImage("lock.png", "png");
  unlock = loadImage("unlock.png", "png");
  mute = loadImage("mute.png", "png");
  unmute = loadImage("unmute.png", "png");
  incognito = loadImage("incognito.png", "png");
  
  incognito.loadPixels();
  mute.loadPixels();
  unmute.loadPixels();
  lock.loadPixels();
  unlock.loadPixels();

}

void draw(){
  
  incognito.resize(70,70);
  mute.resize(70,70);
  unmute.resize(70,70);
  lock.resize(70,70);
  unlock.resize(70,70);
  
  
  if(invis) {
    
  }
  else {
  
    fill(127,127,127);
    rect(tempX, tempY, buttonWidth, buttonHeight, buttonCurve);
    rect(timerX, timerY, buttonWidth, buttonHeight, buttonCurve);
    rect(startX, startY, buttonWidth, buttonHeight, buttonCurve);
    rect(1100, 700, buttonWidth, buttonHeight, buttonCurve);
    rect(1100, 300, buttonWidth, buttonHeight, buttonCurve);
    
    rect(toastX, toastY, buttonWidth, buttonHeight, buttonCurve);
    rect(warmX, warmY, buttonWidth, buttonHeight, buttonCurve);
    rect(pizzaX, pizzaY, buttonWidth, buttonHeight, buttonCurve);
    rect(gbX, gbY, buttonWidth, buttonHeight, buttonCurve);
    
    rect(650, 450, clickButtonWidth, clickButtonHeight, buttonCurve);
    rect(700, 450, clickButtonWidth, clickButtonHeight, buttonCurve);
    rect(750, 450, clickButtonWidth, clickButtonHeight, buttonCurve);
    
    rect(650, 725, clickButtonWidth, clickButtonHeight, buttonCurve);
    rect(700, 725, clickButtonWidth, clickButtonHeight, buttonCurve);
    rect(750, 725, clickButtonWidth, clickButtonHeight, buttonCurve);
  }
  
  if(invis) {
    fill(255,255,0);
    rect(920, 20, 70,70, buttonCurve);
    image(incognito,920,20);
  }
  else {
    fill(127,127,127);
    rect(920, 20, 70,70, buttonCurve);
    image(incognito,920,20);
  }
  
  
  if(muteOn){
    fill(255,255,0);
    rect(1000, 20, 70, 70, buttonCurve);
    image(mute, 1000,20);
  }
  else{
    fill(127,127,127);
    rect(1000, 20, 70, 70, buttonCurve);
    image(unmute,1000,20);
  }
  
  
  if(lockScreen){
    fill(255,255,0);
    rect(1080, 20, 70, 70, buttonCurve);
    image(lock, 1080,20);
  }
  else{
    fill(127,127,127);
    rect(1080, 20, 70, 70, buttonCurve);
    image(unlock,1080,20);
  }
  
  
  if(toastMode && everythingOn && !invis) {
    if(golden) {
      fill(255,255,0);
      rect(300, 50, buttonWidth, buttonHeight, buttonCurve);
      fill(220,220,220);
      rect(460, 50, buttonWidth, buttonHeight, buttonCurve);
      rect(620, 50, buttonWidth, buttonHeight, buttonCurve);
    }
    else if(crispy) {
      fill(255,255,0);
      rect(460, 50, buttonWidth, buttonHeight, buttonCurve);
      fill(220,220,220);
      rect(300, 50, buttonWidth, buttonHeight, buttonCurve);
      rect(620, 50, buttonWidth, buttonHeight, buttonCurve);
    }
    else if(burnt) {
      fill(255,255,0);
      rect(620, 50, buttonWidth, buttonHeight, buttonCurve);
      fill(220,220,220);
      rect(300, 50, buttonWidth, buttonHeight, buttonCurve);
      rect(460, 50, buttonWidth, buttonHeight, buttonCurve);
    }

    fill(0);
    textSize(29);
    text("Golden", 320, 120);
    text("Crispy", 480, 120);
    text("Burnt", 640, 120);
    
    
  }
  
  if(everythingOn){
    fill(0,204,0);
    rect(1170, 20, 70, 70, buttonCurve);
  }
  else{
    fill(127,127,127);
    rect(1170, 20, 70, 70, buttonCurve);
  }
  
  
  fill(0);
  textFont(f);
  textSize(36);
  text("Toast", 55, 85); 
  text("Warm", 55, 185);
  text("Pizza", 55, 285);
  textSize(30);
  text("Garlic\nBread", 55, 365);
  text("Temp", tempX+40, tempY+50);
  text("C°/F°", tempX+40, 750);
  text("Timer", timerX+40, timerY+50);
  text("Start", startX+40, startY+50);
  text("PWR", 1170, 70);
  text("STOP", 1140, 350); 
  
  fill(255,255,255);
  strokeWeight(4);
  rect(350, 500, boxWidth, boxHeight);
  
  textSize(100);
  fill(0);
  
  if(lockScreen) {
      
    
      if(timerOn && !stop)
      {
        countDownTimer();
      }
      else{
      }
  
  }
  else { 
    if(everythingOn){
    
      if(timerMode){
        setString();
        if(mins > 9) {
          text(mins + ":"+sec, 570,625);
        }
        else {
          text(mins + ":"+sec, 625, 625);
        }
        
      
      }
      else if(tempMode) {
        if(celsius){
        text("°C" , 800, 625);
        }
        else {
          text("°F", 800,625);
        }
        
        setString();
        text(currTemp, 625,625);
        
      }
      else if(presetMode) {
        if(celsius){
        text("°C" , 710, 650);
        }
        else {
          text("°F", 710,650);
        }
        
        text(mins + ":" + sec, 550, 580);
        text(currTemp , 550, 650);
        
        
      }
      
      if(timerOn && !stop)
      {
        countDownTimer();
      }
      else{
      }
    }
    else{
      
    }
  }
}

void setString() {

  String strSec = str(sec1) + str(sec2);
  sec = parseInt(strSec, 10);
  
  String strTemp = str(hundreds) + str(tens) + str(ones);
  currTemp = parseInt(strTemp, 10);
  
}

void resetTimer() {
  reset = millis()/1000;
}

void resetAll() {

  sec = 0;
  mins = 0;
  timerMin = 0;
}

void resetMode() {

  timerMode = false;
  tempMode = false;
  presetMode = false;
  celsius = false;
  
}

void convert() {

  if(celsius) {
      currTemp = floor(((currTemp-32)*5)/9);
    }
    else {
      currTemp = floor(((currTemp * 9) / 5) + 32);
    }
  
}

void countDownTimer() {
  
    timerSec = floor(sec - ((millis()/1000)-reset));
    timerMin = mins;
  if(timerSec <= 0 && timerMin > 0 && timerOn){

      sec = 59;
      //timerMin--;
      mins--;
      reset = millis()/1000;
  }
  
  textSize(70);
  fill(0);
  if(timerSec > 0 || timerMin > 0)
  {
    //05:05
    if(timerMin < 10 && timerSec < 10){
       text("0"+timerMin + ":" + "0"+timerSec, 550, 580);
       text(currTemp , 550, 650);
       
        
    }
    //05:55
    else if(timerMin < 10 && timerSec >= 10){
       text("0"+timerMin + ":" +timerSec, 550, 580);
       text(currTemp , 550, 650);
    }
    //55:05
    else if(timerMin > 10 && timerSec < 10) {
      text(timerMin + ":" + "0" + timerSec, 550, 580);
      text(currTemp , 550, 650);
    }
    else{
      text(timerMin + ":" + timerSec, 550, 580);
      text(currTemp , 550, 650);
    }
    
    if(celsius){
      text("°C" , 710, 650);
    }
    else {
      text("°F", 710,650);
    }
    
  }
  else if(timerSec == 0 && timerMin == 0 && timerOn)
  {
    if(muteOn) {
       text("DONE", 400,620); 
    }
    else {
      playBeep();
    }
    resetAll();
    timerOn = false;
  }
  else
  {
    /*
    text("ERROR", 400, 620);
    println("SEC: " + sec);
    println("MIN: " + timerMin);
    */
  }

}

void mousePressed() {
  if( (mouseX > toastX) && (mouseX < toastX + buttonWidth) && (mouseY > toastY) && (mouseY < toastY + buttonHeight)) {
      if(lockScreen) {
      
      }
      else{
        background(192,192,192);
        sec = toastTimeSec;
        mins = toastTimeMin;
        currTemp = toastTemp;
        toastMode = true;
        presetMode = true;
        tempMode = false;;
        timerMode = false;
        timerOn = false;
        fill(255,0,0);
        rect(toastX+140, toastY, 50, 50, buttonCurve);
        convert();
        resetTimer();
      }
  }
  else if((mouseX > warmX) && (mouseX < warmX + buttonWidth) && (mouseY > warmY) && (mouseY < warmY + buttonHeight)) {
      if(lockScreen){
      
      }
      else{
        resetTimer();
        background(192,192,192);
        sec = warmTimeSec;
        currTemp = warmTemp;
        mins = warmTimeMin;
        toastMode = false;
        presetMode = true;
        tempMode = false;;
        timerMode = false;
        timerOn = false;
        fill(255,0,0);
        rect(warmX+140, warmY, 50, 50, buttonCurve);
      }
  }
  else if((mouseX > pizzaX) && (mouseX < pizzaX + buttonWidth) && (mouseY > pizzaY) && (mouseY < pizzaY + buttonHeight)) {
      if(lockScreen) {
      
      }
      else {
        resetTimer();
        background(192,192,192);
        sec = pizzaTimeSec;
        currTemp = pizzaTemp;
        mins = warmTimeMin;
        toastMode = false;
        presetMode = true;
        tempMode = false;;
        timerMode = false;
        timerOn = false;
        fill(255,0,0);
        rect(pizzaX+140, pizzaY, 50, 50, buttonCurve);
      }
  }
  else if((mouseX > gbX) && (mouseX < gbX + buttonWidth) && (mouseY > gbY) && (mouseY < gbY + buttonHeight)) {
      if(lockScreen) {
      
      }
      else {
        resetTimer();
        background(192,192,192);
        sec = gbTimeSec;
        currTemp = gbTemp;
        mins = gbTimeMin;
        toastMode = false;
        presetMode = true;
        tempMode = false;;
        timerMode = false;
        timerOn = false;
        fill(255,0,0);
        rect(gbX+140, gbY, 50, 50, buttonCurve);
      }
      
  }
  else if((mouseX > tempX) && (mouseX < tempX + buttonWidth) && (mouseY > tempY) && (mouseY < tempY + buttonHeight)) {
    //println("TEMP");
    if(lockScreen) {
    
    }
    else {
      toastMode = false;
      tempMode = true;
      timerMode = false;
      presetMode = false;
      timerOn = false;
    }
  
  }
  else if((mouseX > timerX) && (mouseX < timerX + buttonWidth) && (mouseY > timerY) && (mouseY < timerY + buttonHeight)) {
    //println("TIMER");
    if(lockScreen) {
    
    }
    else {
      toastMode = false;
      tempMode=false;
      timerMode = true;
      presetMode = false;
      timerOn = false;
    }
    
  }
  //-1:--
  else if((mouseX > 650) && (mouseX < 650 + clickButtonWidth) && (mouseY > 450) && (mouseY <450 + clickButtonHeight)) {
    resetTimer();
    if(timerMode){
      
      mins++;
    }
    else if(tempMode){
      hundreds++;
    }
   
  }
  //--:1-
  else if((mouseX > 700) && (mouseX < 700 + clickButtonWidth) && (mouseY > 450) && (mouseY <450 + clickButtonHeight)) {
    resetTimer();
    if(timerMode){
      if(sec1 > 8) {
        sec1 = 0;
      }
      else
      {
        sec1++;
      }
    }
    else if(tempMode){
      if(tens > 8) {
        tens = 0;
      }
      else
      {
        tens++;
      }
    }
  }
  //--:-1
  else if((mouseX > 750) && (mouseX < 750 + clickButtonWidth) && (mouseY > 450) && (mouseY <450 + clickButtonHeight)) {
    resetTimer();
    if(timerMode) {
      if(sec2 > 8) {
        sec2 = 0;
      }
      else
      {
        sec2++;
      }
    }
    else if(tempMode) {
      if(ones > 8) {
        ones = 0;
      }
      else
      {
        ones++;
      }
    }

  }
  //BOTTOM SECTION
  //-1:--
  else if((mouseX > 650) && (mouseX < 650 + clickButtonWidth) && (mouseY > 725) && (mouseY <725 + clickButtonHeight)) {
    resetTimer();
    if(timerMode) {
      if(mins == 0){}
      else{
        mins--;
      }
    }
    else if(tempMode) {
      if(hundreds == 0) {}
      else {
        hundreds--;
      }
    
    }
  }
  //--:1-
  else if((mouseX > 700) && (mouseX < 700 + clickButtonWidth) && (mouseY > 725) && (mouseY <725 + clickButtonHeight)) {
    resetTimer();
    if(timerMode) {
      if(sec1 == 0){}
      else{
        sec1--;
      }
    }
    else if(tempMode) {
      if(tens == 0) {}
      else {
        tens--;
      }
    
    }
  }
  //--:-1
  else if((mouseX > 750) && (mouseX < 750 + clickButtonWidth) && (mouseY > 725) && (mouseY <725 + clickButtonHeight)) {
    resetTimer();
    if(timerMode) {
      if(sec2 == 0){}
      else{
        sec2--;
      }
    }
    else if(tempMode) {
      if(ones == 0) {}
      else {
        ones--;
      }
    
    }
  }
  //START
  else if((mouseX > startX) && (mouseX < startX + buttonWidth) && (mouseY > startY) && (mouseY < startY + buttonHeight)) {
  
    //println("START");
    resetMode();
    background(192,192,192);
    timerOn = true;
    toastMode = false;
    stop = false;
  }
  //POWER BUTTON
  else if((mouseX > 1170) && (mouseX < 1170 + 70) && (mouseY > 20) && (mouseY < 20 + 70)) {
    if(everythingOn) {
      everythingOn = false;
      if(muteOn) {
      
      }
      else {
        playBye();
      }
      
    }
    else{
      everythingOn = true;
      resetAll();
      if(muteOn){
      
      }
      else {
        playHello();
      }
    }
  }
  //GOLDEN
  else if((mouseX > 300) && (mouseX < 300 + buttonWidth) && (mouseY > 50) && (mouseY < 50 + buttonHeight)) {
    sec = 30;
    currTemp = 150;
    mins = 2;
    golden = true;
    crispy = false;
    burnt = false;
  }
  //CRISPY
  else if((mouseX > 460) && (mouseX < 460 + buttonWidth) && (mouseY > 50) && (mouseY < 50 + buttonHeight)) {
    sec = 30;
    currTemp = 150;
    mins = 5;
    golden = false;
    crispy = true;
    burnt = false;
  }
  //BURNT
  else if((mouseX > 620) && (mouseX < 620 + buttonWidth) && (mouseY > 50) && (mouseY < 50 + buttonHeight)) {
    sec = 10;
    currTemp = 999;
    mins = 50;
    golden = false;
    crispy = false;
    burnt = true;
  }
  else if((mouseX > 1100) && (mouseX < 1100 + buttonWidth) && (mouseY > 700) && (mouseY < 700 + buttonHeight)) {
    //println("TEMP");
    if(celsius) {
      currTemp = floor((((currTemp-32)*5)/9));
      celsius = false;
    }
    else {
      celsius = true;
      currTemp = floor(((currTemp * 9) / 5) + 32);
    }
    background(192,192,192);
    
  }
  //Lock
  else if((mouseX > 1080) && (mouseX < 1080 + 70) && (mouseY > 20) && (mouseY < 20 + 70)) {
    //println("LOCK");
    if(lockScreen) {
      lockScreen = false;    
    }
    else {
      lockScreen = true;
    }
  }
  //Mute
  else if((mouseX > 1000) && (mouseX < 1000 + 70) && (mouseY > 20) && (mouseY < 20 + 70)) {
    if(muteOn) {
      muteOn = false;    
    }
    else {
      muteOn = true;
    }
  }
  //Invis
  else if((mouseX > 920) && (mouseX < 920 + 70) && (mouseY > 20) && (mouseY < 20 + 70)) {
    if(invis) {
      invis = false;    
    }
    else {
      invis = true;
    }
    background(192,192,192);
  }
  //STOP
  else if((mouseX > 1100) && (mouseX < 1100 + 70) && (mouseY > 300) && (mouseY < 300 + 70)) {
    if(stop){
      stop = false;
    }
    else {
      stop = true;
    }
    resetMode();
    resetAll();
  }
  

}