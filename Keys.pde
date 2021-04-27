//----------------------------------------//
// Control of keyboard functions          //
//----------------------------------------//
void keyPressed() {

 

  if (key=='q') 
  {
    camAuto=!camAuto;

    if (camAuto == false)
    {
      aiEyeLidAuto(true);
      aiFollowCam(true);
      tx=0; 
      ty=10; 
      tz=0;
    }
  }

  if (key=='s') 
  {
    setHands(5,5);
    aiHeadMimic(true, MIMIC_DEF);
    aiSleep(true);
    aiWakeUp(false);
    aiEyeLidAuto(false);
    aiFollowCam(false);
    
  } 
  if (key=='w') 
  {
    setHands(5,5);
    aiSleep(false);
    aiWakeUp(true);
    aiEyeLidAuto(false);
    aiFollowCam(false);
  }
  if (key=='h') 
  {
    setHands(5,5);
    aiHello(true);
    playSound(15);
  }
  if (key=='r') 
  {
    step=0;
    setAlarm(ALARM_FIRSTMOVE, 5);
    setAlarm(ALARM_LESSON1 ,120);
  }
  if (key=='a') 
  {
    setHands(5,5);
    aiSleep(false);
    aiWakeUp(false);
    aiEyeLidAuto(true);
    aiFollowCam(true);
  }

  if (key=='n') 
  {
    aiNumbersDouble(true);
  } 
  
  if (key=='d') 
  {
    setHands(5,5);
    aiSetPosture(STAND_DEFAULT);
    aiHeadMimic(true, MIMIC_DEF);
  }
  
  if (key=='k') 
  {
    setMouthSpeaking(20);
  }
  
  if (key=='z') 
  {
     setAlarm(ALARM_LESSON1, 1);
  }
  
    if (key=='y') 
  {
    aiHeadMimic(true, MIMIC_YES);
    playSound(12);
  }
    if (key=='u') 
  {
    aiHeadMimic(true, MIMIC_NO);
    playSound(13);
  }
  
  if (key=='j') 
  {
    setHands(5,5);
    setMouthSpeaking(80);
    moveMotorBody(0,0,0,0,0,-100,-80,0,-60,99,5,0,85,-100,4,65,-64,61,-127,-127,5,0,85,-100,-4);
    playSound(11);
  }
  
  
      if (key=='l') 
      {
        setMouthSpeaking(40);
        playSound(getFingers(0));
      }
      if (key=='ş') 
      {
        setMouthSpeaking(40);
        playSound(14);
      }
      if (key=='i') 
      {
        setMouthSpeaking(40);
        playSound(getFingers(1));
      }
      
  
  
  if (key=='g') 
  {
    gotoNextScreen();
  }
  
  if (key=='p') 
  {
    println("Dir: "+ dir +"Zdir: "+zdir+ "dist: "+ dist + "Tx: "+ tx);
  }
   
  
  
  
}
