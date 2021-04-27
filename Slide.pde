/*

 */
void playLesson1(boolean state)
{
  if (state)
  if (isAlarmReady(ALARM_LESSON1))
  {
    performFrame(step);
    step+=1;
    println("Go to frame: " + step);
  }
  
}


void initScreens()
{
  scrLimit=8;
  sList = new PImage[scrLimit];
  sList[0] = loadImage("data/screens/sEmpty.png");
  sList[1] = loadImage("data/screens/s1Zoo.png");
  sList[2] = loadImage("data/screens/s2Lion.png");
  sList[3] = loadImage("data/screens/s3OneLion.png");
  sList[4] = loadImage("data/screens/s4Zebra.png");
  sList[5] = loadImage("data/screens/s5OneZebra.png");
  sList[6] = loadImage("data/screens/s6TwoZebra.png");
  sList[7] = loadImage("data/screens/s7TwoNumberZebra.png");
  scrIndex=0;
}

void setScreen(int a)
{
  if (a<scrLimit && a>-1)
    scrIndex = a;
}

void gotoNextScreen()
{
  scrIndex += 1;
  if (scrIndex == scrLimit )
    scrIndex = 0;
}


void drawScreen() {

  noStroke();
  scale(boyut, boyut, boyut);
  beginShape();
  texture(sList[scrIndex]);
  vertex(-58 , -90-6,    -93.5, 512, 0);
  vertex(-58 , 28-6,     -93.5, 512, 300);
  vertex(-253 +1.5, 28-6,    -93.5, 0, 300);
  vertex(-253 +1.5, -90-6,   -93.5, 0, 0);
  endShape();
}

void drawScreenSmall() {

  noStroke();
  scale(boyut, boyut, boyut);
  beginShape();
  texture(sList[scrIndex]);
  vertex(-58 -38.5, -90, -93.5, 512, 0);
  vertex(-58 -38.5, 28, -93.5,  512, 512);
  vertex(-253 +38.5, 28, -93.5,  0,  512);
  vertex(-253 +38.5, -90, -93.5, 0,  0);
  endShape();
}


