void drawLeftLeg() {
  // -- LEFT LEG
  pushMatrix();
  translate(-7.25, 10.5, -1);
  rotateY(motor[20][0]);
    shape(modLeftLeg1);

  translate(0, 4.50, 0);
  rotateX(motor[21][0]);
    shape(modLeftLeg2);
    shape(modLeftLeg2Cover);

  translate(0, 23.75, 0);
  rotateX(motor[22][0]);
    shape(modLeftLeg3);
    shape(modLeftLeg3Cover);

  translate(0, 22.75, 0);
  rotateX(motor[23][0]);
    shape(modRightFoot);
    
  popMatrix();
}

void drawLeftArm() {

  // -- LEFT ARM
  pushMatrix();
  rotateY(motor[0][0]);
  translate(0, -6.25, 0);
  rotateX(motor[1][0]);

  translate(-10, -20+6.25, 0);
  rotateZ(-PI*0.5);
  rotateY(motor[40][0]);
    shape(modLeftArm1);

  translate( 0, -4.6, 0);
  rotateX(motor[41][0]);
    shape(modLeftArm2);
    shape(modLeftArm2Cover);

  translate(0, -11, 0);
  rotateY(motor[42][0]+PI*0.5);
    shape(modLeftArm3);
    shape(modLeftArm3Cover);

  translate(0, -10, 0);
  rotateX(motor[43][0]);
    shape(modLeftArm4);
    shape(modLeftArm4Cover);

  translate(0, -16.2, 0);
  rotateY(motor[44][0]);
    shape(modLeftWrist);

  translate(0, -2.4, 0);
  rotateX(motor[45][0]);
    shape(modLeftPalm);
    
    pushMatrix(); 
      drawFingerL1();
    popMatrix();
    pushMatrix(); 
      drawFingerL2();
    popMatrix();
    pushMatrix();  
      drawFingerL3();
    popMatrix();
    pushMatrix(); 
      drawFingerL4();
    popMatrix();
    pushMatrix(); 
      drawFingerL5();
    popMatrix(); 
    
  popMatrix();
}



void drawFingerL5()
{
  translate(3.9, -6.4, -0.2);
  rotateZ(PI*0.17);
  rotateX(motor[54][0]);
  scale(0.83,0.83,0.85);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[54][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[54][0]);
    shape(modFinger3); 
}

void drawFingerL4()
{
  translate(2.0, -7.2, -0.2);
  rotateZ(PI*0.08);
  rotateX(motor[53][0]);
  scale(0.92,0.90,0.92);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[53][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[53][0]);
    shape(modFinger3); 
}

void drawFingerL3()
{
  translate(0, -7.7, -0.2);
  rotateX(motor[52][0]);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[52][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[52][0]);
    shape(modFinger3); 
}

void drawFingerL2()
{
  translate(-2.0, -7.1, -0.2);
  rotateZ(-PI*0.08);
  rotateX(motor[51][0]);
  scale(0.90,0.86,0.90);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[51][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[51][0]);
    shape(modFinger3); 
}


void drawFingerL1()
{
  translate(-3.4, -3.65, -0.2);
  rotateZ(-PI*0.32);
  rotateX(motor[50][0]);
  scale(0.90,0.86,0.90);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[50][0]);
    shape(modFinger2);
}
