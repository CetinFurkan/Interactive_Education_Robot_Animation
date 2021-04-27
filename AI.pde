int rand(float a)
{
  return int(random(a));
}

int choose(int a)
{
  return int(random(9999)) % a;
}

void aiFollowCam(boolean state) { 
  switchFollowCam  = state;
}
void aiSleep(boolean state) { 
  switchSleep      = state;
}
void aiEyeLidAuto(boolean state) { 
  switchEyeLidAuto = state;
}
void aiWakeUp(boolean state) { 
  switchWakeUp     = state;
}
void aiHello(boolean state) { 
  switchHello     = state;
}
void aiNumbersDouble(boolean state) { 
  switchNumbersDouble     = state;
}
void aiHeadMimic(boolean state) { 
  switchHeadMimic  = state;
}
void aiHeadMimic(boolean state, int mode) {  
  headMimicMode    = mode ;

  if (switchHeadMimic == false)
    switchHeadMimic  = state;
}

void aiFollowCam()
{
  if (switchFollowCam)
  {
    moveMotor(EYE_X, hedefdir-degrees(motor[0][0]+motor[2][0]) );

    moveMotor(TORSO_ROT, dir*0.49-4 );

    if (switchHeadMimic == false)
    {
      moveMotor(HEAD_ROT, dir*0.5);
      moveMotor(HEAD_VER, -zdir-8);
    }

    moveMotor(HEAD_HOR, -dir*0.15);
  }
}

void aiEyeLidAuto()
{
  if (switchEyeLidAuto)
    {
      if (isAlarmDone(ALARM_EYELID))
      {
        moveMotor(EYE_LID, -30);
        setAlarm(ALARM_EYELID, 100+rand(200)  );
      }

      if (isMoving(EYE_LID)==false && getMotor(EYE_LID) == -30 )
        moveMotor(EYE_LID, 20);
    }
}



void aiSleep()
{
  if (switchSleep)
  {
    moveMotor(EYE_LID, 12);
    moveMotor(TORSO_ROT, 0);
    moveMotor(TORSO_BEND, 0);
    moveMotor(HEAD_ROT, 0);
    moveMotor(HEAD_VER, 0);
    moveMotor(HEAD_HOR, 0);

    moveArmsSymetric(100, -69, -5, -62, -100, 1);


    if (isArrived(HEAD_HOR, 0) && isArrived(TORSO_ROT, 0))
    { 
      setMotorSpeed(HEAD_VER, SLOWER_SPEED);//making speed slower
      setMotorSpeed(EYE_LID, SLOWER_SPEED); //making speed slower

      moveMotor(HEAD_VER, -20);
      moveMotor(EYE_LID, -30);

      switchSleep = false;
    }
  }
}

void aiWakeUp()
{
  if (switchWakeUp)
  {
    setMotorSpeed(HEAD_VER, SLOWER_SPEED);//making speed slower
    setMotorSpeed(EYE_LID, SLOWER_SPEED); //making speed slower
    moveMotor(EYE_LID, 12);


    if (isArrived(EYE_LID, 12))
    {
      moveMotor(HEAD_VER, 0);

      if (isArrived(HEAD_VER, 0))
      {
        setMotorSpeed(EYE_LID, FASTER_SPEED);  //restoring original value
        setMotorSpeed(HEAD_VER, DEFAULT_SPEED);  //restoring original value
        switchWakeUp = false;
      }
    }
  }
}


void aiHello()
{
  if (switchHello)
  {
    moveMotor(L_OMUZ_ROT, 36+autoZdir*0.8);
    moveMotor(L_OMUZ, -63);
    moveMotor(L_ELBOW_ROT, -4);
    moveMotor(L_ELBOW, -105);

    moveMotor(L_HAND_ROT, -33 + autoDir*0.5);
    moveMotor(L_HAND, 18 +autoZdir*0.8);

    setMouthSpeaking(15);

    if (isArrived(L_OMUZ_ROT) && isArrived(L_OMUZ) 
      && isArrived(L_ELBOW_ROT) && isArrived(L_ELBOW))
    { 

      moveMotor(L_OMUZ_ROT, 100);
      moveMotor(L_OMUZ, -69);
      moveMotor(L_ELBOW_ROT, -5);
      moveMotor(L_ELBOW, -62);

      moveMotor(L_HAND_ROT, -100);
      moveMotor(L_HAND, 1);

      //setMouthMode(SMILING);
      switchHello = false;
    }
  }
}


void aiNumbersDouble()
{
  if (switchNumbersDouble)
  {
    moveArmsSymetric(29, -90, 19, -63, -9, -66);

    switchNumbersDouble = false;
  }
}

void aiSetPosture(int pose)
{
  if (pose==STAND_NUMBERS)
    moveArmsSymetric(19, -80, 49, -40, -40, -90);  
  else //STAND_DEFAULT
  moveArmsSymetric(100, -80, 0, -60, -99, 0);
}

void aiHeadMimic() { 
  if (switchHeadMimic)
  {

    if (headMimicMode == MIMIC_DEF)/////////////////////////////////
    {
      aiEyeLidAuto(true);
      moveMotor(HEAD_ROT, 0);
      moveMotor(HEAD_VER, 0);
      moveMotor(HEAD_HOR, 0);
      if (isArrived(HEAD_ROT) && isArrived(HEAD_VER) )//FINISH
      {
        switchHeadMimic = false;
        setAlarm(ALARM_MIMIC, 0);
      }
    }

    if (headMimicMode == MIMIC_NO)/////////////////////////////////
    {
      if (isAlarmDone(ALARM_MIMIC))
      {
        moveMotor(HEAD_ROT, autoDir*0.5+11);

        setAlarm(ALARM_MIMIC, 993);
      }
      if (isArrived(HEAD_ROT, autoDir*0.5+11, true))
      {
        moveMotor(HEAD_ROT, autoDir*0.5-11);
        setMouthSpeaking(20);
      }
      if (isArrived(HEAD_ROT, autoDir*0.5-11, true))
        moveMotor(HEAD_ROT, autoDir*0.5+10);
      if (isArrived(HEAD_ROT, autoDir*0.5+10, true)) //FINISH
      {
        moveMotor(HEAD_ROT, autoDir*0.5);
        setAlarm(ALARM_MIMIC, 0);
        switchHeadMimic = false;
      }
    }

    if (headMimicMode == MIMIC_YES)/////////////////////////////////
    {
      if (isAlarmDone(ALARM_MIMIC))
      {
        moveMotor(HEAD_VER, -12);
        moveMotor(HEAD_ROT, autoDir*0.5);
        setAlarm(ALARM_MIMIC, 993);
      }

      if (isArrived(HEAD_VER, -12) )
      {
        moveMotor(HEAD_VER, -2);
        setMouthSpeaking(20);
      }
      if (isArrived(HEAD_VER, -2) )
        moveMotor(HEAD_VER, -11);
      if (isArrived(HEAD_VER, -11) ) //FINISH
      {
        moveMotor(HEAD_VER, 0);
        setAlarm(ALARM_MIMIC, 0);
        switchHeadMimic = false;
      }
      if (headMimicMode == MIMIC_SUPRISED)/////////////////////////////////
      {
        aiEyeLidAuto(false);
        moveMotor(EYE_LID, 25);
        moveMotor(EYE_X, 0);
        moveMotor(EYE_Y, 0);
      }
      if (headMimicMode == MIMIC_THINKING)/////////////////////////////////
      {
        aiEyeLidAuto(false);
        moveMotor(EYE_LID, 0);
        moveMotor(EYE_X, -20);
        moveMotor(EYE_Y, 20);
      }
    }
  }
}

