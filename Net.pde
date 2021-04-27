/*
*/
//----------------------------------------//
// Initialization of ETHERNET connection  //
//----------------------------------------//
void initNetwork(int port) 
{
  myClient = new Client(this, "127.0.0.1", port);
}


//----------------------------------------//
// Reading data from ETHERNET connection  //
//----------------------------------------//
void updateNetwork() 
{
  
  if (myClient.available() > 0) 
  { 
    dataIn = myClient.read(); 

    if (dataIn == 255) 
    {
      int mtr = myClient.read(); 
      int angle = myClient.read()-127;
      
      mtr = min(max(0,mtr),59);
      angle = min(max(-127, angle),127);
      
      //println("moveMotor( "+ mtr + "," + angle+");");
      motor[mtr][1]=radians(angle);
    }
  }
  
}
