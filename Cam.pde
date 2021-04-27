/*
*/

public class CameraView { 
  float dist, dir, zdir, tx;

  CameraView (float inDir, float inZdir, float inDist, float inTx)
  {
    dist = inDist;
    dir  = inDir;
    zdir = inZdir;
    tx   = inTx;
  }
} 


//------------------------------------------//
// Initialization of WEB Camera and OpenCV  //
//------------------------------------------//
void initWebcam() {
  
}

//----------------------------------------//
// Initialization of Window and 3D Camera //
//----------------------------------------//
void initCamera() {

  dist=200;
  dir=0;

  size(800, 600, P3D);
  setCamera(90, -50, 140, -100, -5, 0);

  camIndex=0;
  camLimit = 9;

  cameraPath = new CameraView[camLimit];
  cameraPath[0] = new CameraView(-2, 0, 120, -8);     //zoom
  cameraPath[1] = new CameraView(-34, -15, 150, -8);  //süper zoomed
  cameraPath[2] = new CameraView(43, -19, 200, -30);  //kapıdan
  cameraPath[3] = new CameraView(-27, 19, 240, -171); //ogretmen
  cameraPath[4] = new CameraView(15, 6.5, 240, -117); //süper
  cameraPath[5] = new CameraView(38, -23, 250, -117); //biraz üst süper
  cameraPath[6] = new CameraView(-6, -33, 240, -141); //bunun üstü gözükmüyo
  cameraPath[7] = new CameraView( 2, 0, 370, -150);    //tam karşı
  cameraPath[8] = new CameraView( -50, -16, 424, -170);    //EnYeni En Son
}

//----------------------------------------//
// Setting 3D Camera variables            //
//----------------------------------------//
void setCamera(float a, float b, float c, float d, float e, float f) {
  fx=a; 
  fy=b; 
  fz=c; 
  tx=d; 
  ty=e; 
  tz=f;
}

//----------------------------------------//
// Updating 3rd person 3D Camera          //
//----------------------------------------//

void calculateCamera() {
  fx = sin(radians(dir));
  fz = cos(radians(dir));
  fy = tan(radians(zdir));

  float m=sqrt(sq(fx)+sq(fy)+sq(fz))/dist;
  fx/=m;
  fy/=m;
  fz/=m;

  fx+=tx;
  fy+=ty;
  fz+=tz;
}

//---------------------------------------------------//
// Updating the distance of camera with Mouse Wheel  //
//---------------------------------------------------//
void mouseWheel(MouseEvent event) {
  if (camAuto==false) {
    calcDist += event.getCount()*5;
    calcDist = max(calcDist, 100);
    moveCamera(calcDist, hedefdir, hedefzdir, hedeftx);
  }
}

//----------------------------------------//
// Moving 3rd person 3D Camera            //
//----------------------------------------//
void mouseDragged() {
  if (camAuto==false)
    if (!switchHeadMimic)
      if (mouseButton == RIGHT) 
      {
        float dx= (mxsave-mouseX);
        float dy= (mysave-mouseY);

        calcDir = dirsave + dx/2;
        calcZdir = zdirsave + dy/2;
        calcZdir = max(-89, min(89, calcZdir));

        moveCamera(hedefdist, calcDir, calcZdir, hedeftx);
      }
}

//-----------------------------------------//
// Need for moving 3rd person 3D Camera    //
//-----------------------------------------//
void mousePressed() {
  if (camAuto==false)
    if (mouseButton == RIGHT) 
    {
      mxsave=mouseX;
      mysave=mouseY;
      dirsave=dir;
    }
}

//----------------------------------------//
// Getting data from webcam               //
//----------------------------------------//

//----------------------------------------------//
// Updating 3D Camera according to user's head  //
//----------------------------------------------//
void updateCameraAccordingToWebcam() {
 
}

void updateCamera() {
  if (camAuto)
    camspeed = 65;
  else
    camspeed = 3;


  dir  += (hedefdir-dir)/camspeed;  
  zdir += (hedefzdir-zdir)/camspeed;
  tx   += (hedeftx-tx)/camspeed;
  dist += (hedefdist-dist)/camspeed;
  calculateCamera();

  autoDir  = dir  * int(switchFollowCam);
  autoZdir = zdir * int(switchFollowCam);
}

void updateCameraAutoMode() {

  if (abs(dir-hedefdir)<0.1) 
  {
    camIndex+=1;
    if (camIndex==camLimit) 
      camIndex=1;
   
    //gotoNextScreen();

    hedefdir  = cameraPath[camIndex].dir;
    hedefzdir = cameraPath[camIndex].zdir;
    hedefdist = cameraPath[camIndex].dist;
    hedeftx   = cameraPath[camIndex].tx;
  }
}

void choosePreDefinedCamera(int cc) {
  
  if (abs(dir-hedefdir)<0.3) 
  {
    //cc-=1;
    hedefdir  = cameraPath[cc].dir;
    hedefzdir = cameraPath[cc].zdir;
    hedefdist = cameraPath[cc].dist;
    hedeftx   = cameraPath[cc].tx;
  }
}


void moveCamera(float inDist, float inDir, float inZdir, float inTx)
{
  hedefdist = inDist;
  hedefdir  = inDir;
  hedefzdir = inZdir;
  hedeftx   = inTx;
}

//----------------------------------------//
// Updating 3rd person 3D Camera          //
//----------------------------------------//
void setWindowPosition(int xx, int yy) {
  if (!flag)
  {
    frame.setLocation(xx, yy);
    flag = true;
  }
}

