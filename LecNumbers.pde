
void performFrame(int frame)
{
  if (frame==0) {
    
    camAuto=true;
    aiSleep(false);
    aiWakeUp(true);
    aiEyeLidAuto(false);
    //aiEyeLidAuto(true);
    aiFollowCam(false);
    setHands(5, 5);
    choosePreDefinedCamera(1); 
    
    
    //-/ goNextFrame(90);
  } else if (frame==1) { //saying: Hi everyone
    aiHello(true);
    setFingers(0, 5);

    //-/ goNextFrame(120);
  } else if (frame==2) { //Left asking what to do
    
    
    moveMotorBody(0, 0, -13, 4, -17, -41, -73, 13, -69, 127, -59, -6, 85, -100, 4, 39, -72, -22, -66, -114, -60, -2, 85, -100, -4);
    
    setMouthSpeaking(55);
    //-/ goNextFrame(130);
  } else if (frame==3) { //turns right and asking what to do
   
    
    moveMotorBody(0, 0, 13, 4, 0, -35, -73, 13, -69, 109, -55, -5, 85, -93, 7, 35, -72, -22, -66, -108, -60, 2, 85, -97, -4);
    setMouthSpeaking(8);

    //-/ goNextFrame(90);
  } else if (frame==4) { //thinking with putting his hand on head
    
    choosePreDefinedCamera(1); // tam karşı(5); // tam karşı
    
    setMotorSpeedScalar(2.8);
    moveMotorBody(13, 0, -13, 4, 0, -64, -60, -55, -69, 105, -20, -5, 85, -93, 7, -51, -58, 53, -99, -127, -35, 2, 85, -97, -4);

    aiEyeLidAuto(false);
    moveMotor(EYE_LID, 18); 
    moveMotor(EYE_X, -20);
    moveMotor(EYE_Y, 20);

    setHands(5, 0);
    setMouthSpeaking(55);
    //-/ goNextFrame(150);
  } else if (frame==5)//Turned righter, thinking with putting his hand on head
  {
    moveMotorBody(17, 13, -13, 0, 0, -69, -66, -48, -36, 83, 10, -5, 85, -93, 7, -41, -56, 50, -103, -127, -35, 2, 85, -97, -4);

    moveMotor(EYE_LID, 18); 
    moveMotor(EYE_X, 20);
    moveMotor(EYE_Y, 20); 

    setHands(5, 0);
    //-/ goNextFrame(130);
  } else if (frame==6)//Aha, Found!
  {
    choosePreDefinedCamera(0); // zoom
   
    
    setMotorSpeedScalar(0.9);
    moveMotorBody(0, 0, -13, 0, -9, -76, -63, 48, -51, 83, 10, -6, 85, -83, 7, 4, -33, -2, -82, -75, 3, 2, 85, -89, -4);

    moveMotor(EYE_LID, 30);
    moveMotor(EYE_X, 0);
    moveMotor(EYE_Y, 0);

    setHands(5, 1);
    setMouthSpeaking(25);
    //-/ goNextFrame(90);
  } else if (frame==7)  //Saying the idea! Whispering
  {
    setMotorSpeedScalar(1);
    moveMotorBody(0, 26, -13, -21, -9, 0, -65, -41, -114, 87, -35, -6, 85, -98, -6, -2, -64, 35, -112, -81, -16, 2, 85, -100, -20);   
    moveMotor(EYE_LID, 30);
    moveMotor(EYE_Y, 0);
    setHands(5, 5);
    setMouthSpeaking(40);
    //-/ goNextFrame(120);
  } else if (frame==8)   //Says again the topic
  { 
    moveMotorBody(4, 0, 0, 0, -17, -42, -65, 38, -117, 87, 8, -6, 85, -86, -6, 49, -58, -54, -113, -63, 13, 2, 85, -81, -19);
    aiEyeLidAuto(true);
    aiHeadMimic(true, MIMIC_YES);    
    setHands(5, 5);
    setMouthSpeaking(125);
    //-/ goNextFrame(180);
  } else if (frame==9)  //turn to screen first time
  {      
    choosePreDefinedCamera(5); // KAPI TARAFINDAN
    gotoNextScreen();
    
    
    moveMotorBody(9, 13, -39, 4, -60, 38, -36, -59, -29, 127, -21, -24, 85, -86, -6, 100, -64, -2, -58, -63, 13, -5, 85, -81, -19);
    setHands(1, 0);
    setMouthSpeaking(45);
    //-/ goNextFrame(120);
  } else if (frame==10)   // turns clasrrom and says: "This is a zoo"
  {      
    moveMotorBody(0, -4, 26, 4, -34, 22, -36, -59, -29, 127, -21, -19, 85, -86, -6, 84, -64, -2, -46, -63, 13, -3, 85, -81, -19);
    setHands(1, 5);

    aiEyeLidAuto(false);
    moveMotor(EYE_LID, 30);
    moveMotor(EYE_X, 0);
    moveMotor(EYE_Y, 0);

    setMouthSpeaking(95);
    //-/ goNextFrame(150);
  } else if (frame==11)   //turn to screen second time and says: "There are many animal there"
  {      
    choosePreDefinedCamera(3); //
    
    moveMotorBody(9, 13, -39, 4, -60, 38, -36, -59, -29, 127, -21, -24, 85, -86, -6, 100, -64, -2, -58, -63, 13, -5, 85, -81, -19);
    setHands(5, 0);

    aiEyeLidAuto(true);

    setMouthSpeaking(145);
    //-/ goNextFrame(180);
  } else if (frame==12)   //Listening
  {      
    
    moveMotorBody(-9, 17, 13, -13, -43, -48, -71, -60, -23, 116, 16, -24, 85, -86, -6, 88, 9, -100, -127, -63, 13, -5, 85, -81, -19);
    setHands(0, 4);

    //playSound( LION.WAV );
    setMouthSpeaking(75);
    //-/ goNextFrame(180);
  } else if (frame==13)   //Asks: "What is this?"
  {      
    moveMotorBody(0, 0, 13, -4, -26, -75, -80, 31, -62, 121, -42, -24, 85, -86, -6, 100, -37, -74, -94, -109, -64, -5, 85, -81, -19);
    setHands(5, 5);

    setMouthSpeaking(95);
    //-/ goNextFrame(170);
  } else if (frame==14)   //turns to SCREEN and shows the LION
  {      
    
    gotoNextScreen();

    moveMotorBody(9, 13, -39, 4, -60, 38, -36, -59, -29, 127, -21, -24, 85, -86, -6, 100, -64, -2, -58, -63, 13, -5, 85, -81, -19);
    setHands(1, 5);

    setMouthSpeaking(105);
    //-/ goNextFrame(160);
  } else if (frame==15)   //turns to CLASS and shows the ONE
  {      
    gotoNextScreen();

    moveMotorBody(0, 0, 0, 4, -17, 10, -53, -65, -40, 79, -58, -24, 85, -86, -6, 100, -64, -2, -58, -63, 13, -5, 85, -81, -19);
    setHands(1, 0);

    setMouthSpeaking(75);
    //-/ goNextFrame(190);
  } else if (frame==16)   //turns to SCREEN and shows the ZOO
  {      
    choosePreDefinedCamera(3); // OGRETMEN MASASI
    setScreen(1); // ZOO AGAİN

    moveMotorBody(9, 13, -39, 4, -60, 38, -36, -59, -29, 127, -21, -24, 85, -86, -6, 100, -64, -2, -58, -63, 13, -5, 85, -81, -19);
    setHands(5, 0);

    setMouthSpeaking(95);
    //-/ goNextFrame(170);
  } else if (frame==17)   //turns to SCREEN and shows the ZEBRA
  {      
    setScreen(4); // return to ZEBRA slide as usual
    
    setMouthSpeaking(75);
    //-/ goNextFrame(140);
  } else if (frame==18)   //turns to CLASS and shows the ONE ZEBRA
  {      
    
    gotoNextScreen();

    moveMotorBody(0, 0, 0, 4, -17, 10, -53, -65, -40, 79, -58, -24, 85, -86, -6, 100, -64, -2, -58, -63, 13, -5, 85, -81, -19);
    setHands(1, 0);

    setMouthSpeaking(50);
    //-/ goNextFrame(90);
  }else if (frame==19)   //turns to CLASS and shows the TWO ZEBRA
  {      
    gotoNextScreen();
    
    setHands(2, 0);

    setMouthSpeaking(50);
    //-/ goNextFrame(100);
  } else if (frame==20)   //turns to SCREEN and shows the ZEBRA
  {      
    setMouthSpeaking(50);
    gotoNextScreen(); // return to TWO NUMBER AND TWO ZEBRA slide as usual
    //-/ goNextFrame(130);
  }else if (frame==21)   //While turned to class, he shows ONE LION
  {      
    
    setScreen(3); // show ONE LION slide 
    setHands(1, 0);

    setMouthSpeaking(50);
    //-/ goNextFrame(80);
  }else if (frame==22)   //While turned to class, he shows TWO ZEBRA
  {      
    setScreen(7); // show TWO ZEBRA slide 
    setHands(2, 0);

    setMouthSpeaking(50);
    //-/ goNextFrame(80);
    //camAuto=false;
  }
  else if (frame==23)   //just ending camera
  {      
    choosePreDefinedCamera(8);
  }
  
}

void goNextFrame(int a)
{
  setAlarm(ALARM_LESSON1, a);
}

