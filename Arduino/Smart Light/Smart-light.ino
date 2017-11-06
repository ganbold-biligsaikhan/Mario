#include <BitVoicer11.h>

BitVoicerSerial soundstatus = BitVoicerSerial();
int soundsensor=2;
int LED=3;
byte dataType = 4;


void setup()

{
  pinMode (soundsensor, INPUT);
  pinMode (LED,OUTPUT);
  serialEvent();
  }



  void serialEvent()
{
   
    soundsensor = soundstatus.getData();
    
     if (dataType == BV_INT){
      
     
    if (soundstatus.strData == "ON1"){
       digitalWrite(LED,HIGH);
       delay(50);    
  }

  if (soundstatus.strData == "OFF1")
  {
       digitalWrite(LED,HIGH);
       delay(50);    
  }


}
  else
{
  digitalWrite(LED,LOW);

}
}
void loop()
{

}

 
