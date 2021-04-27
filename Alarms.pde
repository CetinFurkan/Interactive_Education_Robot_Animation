void updateTimer() {
  if (isAlarmReady(ALARM_FIRSTMOVE))
    firstMove();
}

void initAlarms(int nn)
{
  numAlarm=nn;
  alarm = new int[numAlarm];
  for (int i=0; i<numAlarm; i++)
    alarm[i]=-1;
}

void updateAlarms()
{
  for (int i=0; i<numAlarm; i++)
  {
    if (alarm[i]>-1)
      alarm[i]-=1;
  }
}

boolean isAlarmDone(int aa)
{
  return (alarm[aa] == -1);
}

boolean isAlarmReady(int aa)
{
  return (alarm[aa] == 0);
}

void setAlarm(int aa, int val)
{
  if (val<0)
    alarm[aa] += (-val);
  else
    alarm[aa] = val;
}

int getAlarm(int aa)
{
  return alarm[aa];
}

void firstMove()
{
  
  setMouthMode(SMILING);
  
  moveMotorBody(0,0,0,0,0,-100,-80,0,-60, 99,5,  0,85,-100, 4,  
                          100,-80,0,-60, -99,5,  0,85,-100,-4);
  
  camAuto = false;

  tx=0; 
  ty=10; 
  tz=0;
  
  aiSleep(true);
  aiWakeUp(false);
  aiEyeLidAuto(false);
  aiFollowCam(false);
}

