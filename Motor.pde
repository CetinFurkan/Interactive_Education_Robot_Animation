/*
*/
public class MotorFrame { 
  float[] data;

  MotorFrame ()
  {
    data = new float[60];
  }
} 


//----------------------------------------//
// Initialization of MOTOR array          //
//----------------------------------------//
void initMotor() {
  motor = new float[60][3];

  for (int i=0; i<60; i++)   
  {
    motor[i][0]=0.0;
    motor[i][1]=0.0;
    motor[i][2]=10.0;
  }

  //making the eye movement faster
  motor[5][2]=2.0;
  motor[6][2]=2.0;
  motor[7][2]=2.0;


  // 0-9 body + head

  // 10-19 left leg
  // 20-29 right leg

  // 30-39 left arm
  // 40-49 right arm

  // 50-54 left fingers
  // 55-59 right fingers

  // 0 for actual position
  // 1 for hedef position
  // 2 for ACTIVE speed value (divisor)
  
  
  // 4 for minlimit
  // 5 for maxlimit
  // 4
}

//----------------------------------------//
// Calculation and movement of MOTOR array//
//----------------------------------------//
void updateMotor() {

  for (int i=0; i<60; i++)
  {
    motor[i][0] += (motor[i][1] - motor[i][0]) / (motor[i][2]*speedScaler);
  }
}

void setMotorSpeedScalar(float aa){
 speedScaler = aa; 
}


void setMotorSpeed(int id, float hedef)
{
  motor[id][2] = hedef;
}

void moveMotor(int id, float hedef)
{
  motor[id][1] = radians(hedef);
}

float getMotor(int id)
{
  return degrees(motor[id][0]);
}

boolean isMoving(int id)
{
  return  !(abs(motor[id][1] - motor[id][0]) < 0.01) ;
}

boolean isArrived(int id)
{
  return  !isMoving(id) ;
}

boolean isArrived(int id, float hedef)
{
  return  ((abs(motor[id][1] - motor[id][0]) < 0.01) && (motor[id][1]==radians(hedef))) ;
}


boolean isArrived(int id, float hedef, boolean a)
{
  return  ((abs(motor[id][1] - motor[id][0]) < 0.01) && abs(motor[id][1] - radians(hedef))<0.01  ) ;
}

void moveArmsSymetric(int omuz, int omuzrot, int elbowrot, int elbow, int handrot, int hand)
{
  moveMotor(L_OMUZ_ROT, omuz);
  moveMotor(L_OMUZ, omuzrot);
  moveMotor(L_ELBOW_ROT, elbowrot);
  moveMotor(L_ELBOW, elbow);

  moveMotor(L_HAND_ROT, handrot);
  moveMotor(L_HAND, hand);


  moveMotor(R_OMUZ_ROT, -1*omuz);
  moveMotor(R_OMUZ, omuzrot);
  moveMotor(R_ELBOW_ROT, -1*elbowrot);
  moveMotor(R_ELBOW, elbow);

  moveMotor(R_HAND_ROT, -1*handrot);
  moveMotor(R_HAND, hand);
}


void moveMotorBody(int hh,int hv,int hr,   int tb,int tr,
int ra1,int ra2,int ra3,int ra4,   int rh1,int rh2,   int rl1,int rl2, int rl3, int rl4,        
int la1,int la2,int la3,int la4,   int lh1,int lh2,   int ll1,int ll2, int ll3, int ll4 )
{
  moveMotor(HEAD_HOR,hh);
  moveMotor(HEAD_VER,hv);
  moveMotor(HEAD_ROT,hr);
  
  moveMotor(TORSO_BEND,  tb);
  moveMotor(TORSO_ROT,   tr);
  
  moveMotor(R_OMUZ_ROT,  ra1);
  moveMotor(R_OMUZ,      ra2);
  moveMotor(R_ELBOW_ROT, ra3);
  moveMotor(R_ELBOW,     ra4);
  
  moveMotor(R_HAND_ROT,  rh1);
  moveMotor(R_HAND,      rh2);
  
  moveMotor(R_LEG_ROT,  rl1);
  moveMotor(R_LEG,      rl2);
  moveMotor(R_KNEE,     rl3);
  moveMotor(R_ANKLE,    rl4);
  
  
  moveMotor(L_OMUZ_ROT,  la1);
  moveMotor(L_OMUZ,      la2);
  moveMotor(L_ELBOW_ROT, la3);
  moveMotor(L_ELBOW,     la4);
  
  moveMotor(L_HAND_ROT,  lh1);
  moveMotor(L_HAND,      lh2);
  
  moveMotor(L_LEG_ROT,  ll1);
  moveMotor(L_LEG,      ll2);
  moveMotor(L_KNEE,     ll3);
  moveMotor(L_ANKLE,    ll4);

}
void setHands(int number1, int number2)
{
  setFingers(0,number1);
  setFingers(1,number2);
}

void setFingers(int side, int number)
{

  if (number==0) //all closed
  {
    for (int j=0; j<5; j++)
      moveMotor(50+j+side*5, 100);
      
  } else if (number==5) //all open
  {
    for (int j=0; j<5; j++)
      moveMotor(50+j+side*5, 0);
  } else 
  {
    for (int j=0; j<number; j++) //number = 1 2 3 4
      moveMotor(51+j+side*5, 0);
      
    for (int j=number; j<4; j++)
      moveMotor(51+j+side*5, 100);
      
    moveMotor(50+side*5, 100); 
  }
}

int getFingers(int side)
{
   int count = 0;
   
   for (int j=0; j<5; j++) 
      if (  isArrived(50+j+side*5   ,   0.0) == true   )
      count++;
      
      return count;    
}

