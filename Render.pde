/*
*/
//-----------------------------------------//
// Drawing the body parts                  //
//-----------------------------------------//
public void drawModels() {
  // -- ENVIRONMENT
  drawEnvironment();

  // -- BODY
  pushMatrix();
  shape(modBel);

  rotateY(motor[TORSO_ROT][0]);
  shape(modBody1);

  translate(0, -6.25, 0);
  rotateX(motor[TORSO_BEND][0]);
  shape(modBody2);
  shape(modBodyCover);

  translate(0, -23.25, 0);
  rotateY(motor[HEAD_ROT][0]);
  shape(modNeck);

  translate(0, -6, 0);
  rotateX(motor[HEAD_VER][0]);
  translate(0, -3, 0);

  rotateZ(motor[HEAD_HOR][0]);   
  shape(modHead);
  drawMouth();


  scale(1.5, 1.5, 1.5);
  //EYES :)
  pushMatrix();
  translate(2.25, -1.4, 5.36);
  rotateX(motor[EYE_Y][0]);
  rotateY(motor[EYE_X][0]);
  shape(modEye);

  popMatrix();
  pushMatrix();
  translate(-2.25, -1.4, 5.36);
  rotateX(motor[EYE_Y][0]);
  rotateY(motor[EYE_X][0]);
  shape(modEye);

  popMatrix();

  //LEFT EYE LID
  pushMatrix();
  translate(-2.25, -1.4, 5.36);
  rotateX(motor[EYE_LID][0]*1.50);
  shape(modEyeLid);
  popMatrix();

  pushMatrix();
  translate(-2.25, -1.4, 5.36);
  rotateX(-PI*0.75-motor[EYE_LID][0]*0.25);
  shape(modEyeLid);
  popMatrix();

  //RIGHT EYE LID
  pushMatrix();
  translate(2.25, -1.4, 5.36);
  rotateX(motor[EYE_LID][0]*1.50);
  shape(modEyeLid);
  popMatrix();

  pushMatrix();
  translate(2.25, -1.4, 5.36);
  rotateX(-PI*0.75-motor[EYE_LID][0]*0.25);
  shape(modEyeLid);
  popMatrix();


  popMatrix();

  drawRightLeg();
  drawRightArm();

  drawLeftLeg();
  drawLeftArm();
}

void drawEnvironment()
{
  pushMatrix();
  translate(0, -22.25, 0);
  rotateX(PI*0.5);
  scale(boyut, boyut, boyut);
  shape(modRoom);

  popMatrix();
}

//--------------------------------------------//
// Initialization of OBJ files of body parts  //
//--------------------------------------------//
void initModels() {
  String pathModels = "Models/";

  modRoom =      loadShape(pathModels+"Room2.obj");

  modHead =       loadShape(pathModels+"HeadCubic.obj"); 
  modBel =        loadShape(pathModels+"Bel.obj"); 
  modBody1 =      loadShape(pathModels+"Body1.obj");
  modBody2 =      loadShape(pathModels+"Body2.obj");
  modBodyCover =  loadShape(pathModels+"BodyCover.obj");
  modNeck =       loadShape(pathModels+"Neck.obj");

  modLeftLeg1 =   loadShape(pathModels+"leftLeg1.obj");
  modLeftLeg2 =   loadShape(pathModels+"leftLeg2.obj");
  modLeftLeg3 =   loadShape(pathModels+"leftLeg3.obj");
  modLeftFoot =   loadShape(pathModels+"leftFoot.obj");

  modRightLeg1 =   loadShape(pathModels+"rightLeg1.obj");
  modRightLeg2 =   loadShape(pathModels+"rightLeg2.obj");
  modRightLeg3 =   loadShape(pathModels+"rightLeg3.obj");
  modRightFoot =   loadShape(pathModels+"rightFoot.obj");

  modRightArm1 =   loadShape(pathModels+"rightArm1.obj");
  modRightArm2 =   loadShape(pathModels+"rightArm2.obj");
  modRightArm3 =   loadShape(pathModels+"rightArm3.obj");
  modRightArm4 =   loadShape(pathModels+"rightArm4.obj");

  modLeftArm1 =   loadShape(pathModels+"leftArm1.obj");
  modLeftArm2 =   loadShape(pathModels+"leftArm2.obj");
  modLeftArm3 =   loadShape(pathModels+"leftArm3.obj");
  modLeftArm4 =   loadShape(pathModels+"leftArm4.obj"); 

  modLeftArm2Cover = loadShape(pathModels+"leftArm2Cover.obj"); 
  modLeftArm3Cover = loadShape(pathModels+"leftArm3Cover.obj"); 
  modLeftArm4Cover = loadShape(pathModels+"leftArm4Cover.obj"); 

  modLeftLeg2Cover = loadShape(pathModels+"leftLeg2Cover.obj"); 
  modLeftLeg3Cover = loadShape(pathModels+"leftLeg3Cover.obj"); 

  modRightArm2Cover = loadShape(pathModels+"rightArm2Cover.obj"); 
  modRightArm3Cover = loadShape(pathModels+"rightArm3Cover.obj"); 
  modRightArm4Cover = loadShape(pathModels+"rightArm4Cover.obj"); 

  modRightLeg2Cover = loadShape(pathModels+"rightLeg2Cover.obj"); 
  modRightLeg3Cover = loadShape(pathModels+"rightLeg3Cover.obj"); 

  modRightWrist = loadShape(pathModels+"rightWrist.obj"); 
  modRightPalm  = loadShape(pathModels+"rightPalm.obj"); 

  modLeftWrist = loadShape(pathModels+"leftWrist.obj"); 
  modLeftPalm  = loadShape(pathModels+"leftPalm.obj"); 

  modFinger1 =  loadShape(pathModels+"finger1.obj"); 
  modFinger2 =  loadShape(pathModels+"finger2.obj"); 
  modFinger3 =  loadShape(pathModels+"finger3.obj"); 

  modEye    =  loadShape(pathModels+"eye.obj"); 
  modEyeLid =  loadShape(pathModels+"eyeLid.obj");
}

void drawMouth() {

  noStroke();
  beginShape();
  if (mouthMode == SPEAKING)
    texture(mouthTextures[activeMouth]);
  else
    texture(mouthTextures[0]);

  vertex(-2, 2, 8.5, 20, 50);
  vertex(-2, 4, 8.3, 20, 110);
  vertex(2, 4, 8.3, 100, 110);
  vertex(2, 2, 8.5, 100, 50);
  endShape();

  if (alarm[2] == -1)
  {
    activeMouth = choose(12);
    alarm[2] = 5;
  }
  
  stepMouthSpeaking();
}

void setMouthMode(int mm)
{
  mouthMode = mm;
}

void setMouthSpeaking(int time)
{
    //NOTE: Negative values are VALID, since it means (Relative) change
    setAlarm(ALARM_SPEAKING, time); 
}
void stepMouthSpeaking()
{
  if (isAlarmDone(ALARM_SPEAKING))
  {
    setMouthMode(SMILING);
  } else 
  {
    setMouthMode(SPEAKING);
  }
}

void initMouthTextures()
{
  mouthTextures = new PImage[12];
  mouthTextures[0] = loadImage("data/mouth/mouthSmile.png");
  mouthTextures[1] = loadImage("data/mouth/mouth2.png");
  mouthTextures[2] = loadImage("data/mouth/mouth3.png");
  mouthTextures[3] = loadImage("data/mouth/mouth4.png");
  mouthTextures[4] = loadImage("data/mouth/mouth5.png");
  mouthTextures[5] = loadImage("data/mouth/mouth6.png");
  mouthTextures[6] = loadImage("data/mouth/mouth7.png");
  mouthTextures[7] = loadImage("data/mouth/mouth8.png");
  mouthTextures[8] = loadImage("data/mouth/mouth9.png");
  mouthTextures[9] = loadImage("data/mouth/mouth10.png");
  mouthTextures[10] = loadImage("data/mouth/mouth11.png");
  mouthTextures[11] = loadImage("data/mouth/mouth1.png");
}

