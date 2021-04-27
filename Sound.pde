void initSound()
{
  minim = new Minim(this); println("Error initialized");
  sound = new AudioSample[16];
  println("Array initialized");
  sound[0] =  minim.loadSample( "Sounds/Zero.mp3", 512 ); 
  sound[1] =  minim.loadSample( "Sounds/One.mp3", 512 );   
  sound[2] =  minim.loadSample( "Sounds/Two.mp3", 512 );
  sound[3] =  minim.loadSample( "Sounds/Three.mp3", 512 );
  sound[4] =  minim.loadSample( "Sounds/Four.mp3", 512 );
  sound[5] =  minim.loadSample( "Sounds/Five.mp3", 512 );
  sound[6] =  minim.loadSample( "Sounds/Six.mp3", 512 );
  sound[7] =  minim.loadSample( "Sounds/Seven.mp3", 512 );
  sound[8] =  minim.loadSample( "Sounds/Eight.mp3", 512 );
  sound[9] =  minim.loadSample( "Sounds/Nine.mp3", 512 );
  sound[10] =  minim.loadSample( "Sounds/Ten.mp3", 512 );
  sound[11] =  minim.loadSample( "Sounds/Wiki.mp3", 1212 );
  sound[12] =  minim.loadSample( "Sounds/Yes.mp3", 512 );
  sound[13] =  minim.loadSample( "Sounds/No.mp3", 512 );
  sound[14] =  minim.loadSample( "Sounds/Plus.mp3", 512 );
  sound[15] =  minim.loadSample( "Sounds/Hello.mp3", 512 );
}

void playSound(int a)
{
  sound[a].trigger();
}
