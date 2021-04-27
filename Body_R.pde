void drawRightLeg(){
   // -- RIGHT LEG
  pushMatrix();
    translate(7.25, 10.5, -1);
    rotateY(motor[10][0]);
      shape(modRightLeg1);
  
    translate(0, 4.50, 0);
    rotateX(motor[11][0]);
      shape(modRightLeg2);
      shape(modRightLeg2Cover);

    translate(0, 23.75, 0);
    rotateX(motor[12][0]);
      shape(modRightLeg3);
      shape(modRightLeg3Cover);
    
    translate(0, 22.75, 0);
    rotateX(motor[13][0]);
      shape(modLeftFoot);
  popMatrix(); 
  
}


void drawRightArm(){
   // -- RIGHT ARM
  pushMatrix();
    rotateY(motor[0][0]);
    translate(0, -6.25, 0);
    rotateX(motor[1][0]);
  
    translate(10, -20+6.25, 0);
    rotateZ(PI*0.5);
    rotateY(motor[30][0]);
      shape(modRightArm1);
  
    translate( 0, -4.6, 0);
    rotateX(motor[31][0]);
      shape(modRightArm2);
      shape(modRightArm2Cover);
  
    translate(0, -11, 0);
    rotateY(motor[32][0]-PI*0.5);
      shape(modRightArm3);
      shape(modRightArm3Cover);
    
    translate(0, -10, 0);
    rotateX(motor[33][0]);
      shape(modRightArm4);
      shape(modRightArm4Cover);
      
    translate(0, -16.2, 0);
    rotateY(motor[34][0]);
      shape(modRightWrist);
   
    translate(0, -2.4, 0);
    rotateX(motor[35][0]);
      shape(modRightPalm);  
      
    pushMatrix(); 
      drawFingerR1();
    popMatrix();
    pushMatrix(); 
      drawFingerR2();
    popMatrix();
    pushMatrix();  
      drawFingerR3();
    popMatrix();
    pushMatrix(); 
      drawFingerR4();
    popMatrix();
    pushMatrix(); 
      drawFingerR5();
    popMatrix(); 
      
  popMatrix();
 
  
}



void drawFingerR5()
{
  translate(-3.9, -6.4, -0.2);
  rotateZ(-PI*0.17);
  rotateX(motor[59][0]);
  scale(0.83,0.83,0.85);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[59][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[59][0]);
    shape(modFinger3); 
}

void drawFingerR4()
{
  translate(-2.0, -7.2, -0.2);
  rotateZ(-PI*0.08);
  rotateX(motor[58][0]);
  scale(0.92,0.90,0.92);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[58][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[58][0]);
    shape(modFinger3); 
}

void drawFingerR3()
{
  translate(0, -7.7, -0.2);
  rotateX(motor[57][0]);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[57][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[57][0]);
    shape(modFinger3); 
}

void drawFingerR2()
{
  translate(2.0, -7.1, -0.2);
  rotateZ(PI*0.08);
  rotateX(motor[56][0]);
  scale(0.90,0.86,0.90);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[56][0]);
    shape(modFinger2);
  
  translate(0, -2, 0);
  rotateX(motor[56][0]);
    shape(modFinger3); 
}

void drawFingerR1()
{
  translate(3.4, -3.65, -0.2);
  rotateZ(PI*0.32);
  rotateX(motor[55][0]);
  scale(0.90,0.86,0.90);
    shape(modFinger1);
    
  translate(0, -2.5, 0);
  rotateX(motor[55][0]);
    shape(modFinger2);
}
