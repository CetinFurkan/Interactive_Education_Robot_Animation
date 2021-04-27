/*
  KNOWN BUGS:
 -  
 -
 
 */
final int MIMIC_DEF = 0;
final int MIMIC_NO  = 1;
final int MIMIC_YES = 2;
final int MIMIC_SUPRISED = 3;
final int MIMIC_THINKING = 4;

final int STAND_DEFAULT = 1;
final int STAND_NUMBERS = 2;

final float DEFAULT_SPEED= 10.0;
final float FASTER_SPEED = 2.0;
final float SLOWER_SPEED = 16.0;

public static final int HEAD_HOR = 4;
public static final int HEAD_VER = 3;
public static final int HEAD_ROT = 2;

public static final int TORSO_BEND = 1;
public static final int TORSO_ROT  = 0;

public static final int EYE_LID = 7;
public static final int EYE_X   = 6;
public static final int EYE_Y   = 5;

public static final int R_OMUZ_ROT  = 40;
public static final int R_OMUZ      = 41;
public static final int R_ELBOW_ROT = 42;
public static final int R_ELBOW     = 43;

public static final int L_OMUZ_ROT  = 30;
public static final int L_OMUZ      = 31;
public static final int L_ELBOW_ROT = 32;
public static final int L_ELBOW     = 33;

public static final int L_HAND_ROT  = 34;
public static final int L_HAND      = 35;
public static final int R_HAND_ROT  = 44;
public static final int R_HAND      = 45;

public static final int L_LEG_ROT   = 10;
public static final int L_LEG       = 11;
public static final int L_KNEE      = 12;
public static final int L_ANKLE     = 13;

public static final int R_LEG_ROT   = 20;
public static final int R_LEG       = 21;
public static final int R_KNEE      = 22;
public static final int R_ANKLE     = 23;

int step=0;

import java.awt.*;

import ddf.minim.*;
Minim minim;
AudioSample[] sound;


import processing.net.*; 
Client myClient; 
int dataIn;

PImage[] sList;
int scrIndex, scrLimit;
float boyut = 1.3;

PShape modRoom;
PShape modHead, modBel, modBody1, modBody2, modBodyCover, modNeck;

PShape modLeftLeg1, modLeftLeg2, modLeftLeg3, modLeftFoot;
PShape modRightLeg1, modRightLeg2, modRightLeg3, modRightFoot;

PShape modRightLeg2Cover, modRightLeg3Cover;
PShape modLeftLeg2Cover, modLeftLeg3Cover ;

PShape modRightArm1, modRightArm2, modRightArm3, modRightArm4;
PShape modLeftArm1, modLeftArm2, modLeftArm3, modLeftArm4;

PShape modRightArm2Cover, modRightArm3Cover, modRightArm4Cover;
PShape modLeftArm2Cover, modLeftArm3Cover, modLeftArm4Cover;

PShape modRightWrist, modRightPalm;
PShape modLeftWrist, modLeftPalm ;
PShape modFinger1, modFinger2, modFinger3;
PShape modEye, modEyeLid;


//timer related
int[] alarm;
int numAlarm;

final int ALARM_EYELID     = 0;
final int ALARM_FIRSTMOVE  = 1;
final int ALARM_MOUTH      = 2;
final int ALARM_SPEAKING   = 3;
final int ALARM_MIMIC      = 4;
final int ALARM_LESSON1    = 5;

//motor related
float[][] motor;
float speedScaler=1.0;


// mouth related
PImage mouthTextures[];
int activeMouth;
int mouthMode;
final int SPEAKING = 1;
final int SMILING  = 0;

//camera related
float fx, fy, fz, tx, ty, tz;
float dir, zdir, mxsave, mysave, dirsave, zdirsave, dist, camspeed;
int   camIndex, camLimit;
float hedefdir, hedefzdir, hedeftx, hedefdist;
float calcDist, calcDir, calcZdir;
CameraView[] cameraPath;
boolean flag = false;
boolean camView=false;
boolean camAuto=true;
float autoDir, autoZdir;

//AI related
boolean switchEyeLidAuto, switchSleep, switchFollowCam, switchWakeUp;
boolean switchHello, switchNumbersDouble, switchHeadMimic;
int headMimicMode;

public void setup() {
  initMotor();
  initCamera();

  initModels();
  initMouthTextures();
  initScreens();

  initWebcam();
  initNetwork(4444);
  initAlarms(8);
  initSound();

  aiSleep(false);
  aiWakeUp(false);
  aiEyeLidAuto(false);
  aiFollowCam(false);
  aiHello(false);
  aiNumbersDouble(false);
  aiHeadMimic(false);
  
  moveCamera(150, hedefdir, hedefzdir, hedeftx);
  setAlarm(ALARM_FIRSTMOVE, 5);
  setAlarm(ALARM_LESSON1 ,120);
}

public void draw() {

  setWindowPosition(0, 0);

  if (camView) 
    updateCameraAccordingToWebcam();

  //if (camAuto)
    //updateCameraAutoMode();

  aiEyeLidAuto();
  aiFollowCam();
  aiSleep();
  aiWakeUp();
  aiHello();
  aiNumbersDouble();
  aiHeadMimic();
  
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
  cameraZ/10.0, cameraZ*10.0);
  camera(fx, fy, fz, tx, ty, tz, 0.0, 1.0, 0.0);
  { 
    lights();
    background(0);

    drawModels();
    noLights();
    drawScreen();
  }

  updateNetwork();
  updateMotor();
  updateCamera();
  updateAlarms();
  updateTimer();
  

  playLesson1(false);
}

