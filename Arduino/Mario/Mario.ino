const int SiGnalWindow = 50; 
unsigned int SiGnal;
int soundSensor=2;
int LED=3;
char val;
 
void setup() 
{
   Serial.begin(9600);
   pinMode(soundSensor,INPUT);
   pinMode(LED,OUTPUT);
}
 
 
void loop() 
{
  
   
   unsigned long startMillis= millis(); 
   unsigned int peakToPeak = 0;   
 
   unsigned int signalMax = 0;
   unsigned int signalMin = 1024;
 
   // collect data for 50 mS
   while (millis() - startMillis < SiGnalWindow)
   {
      SiGnal = analogRead(0);
      if (SiGnal < 1024) 
      {
         if (SiGnal > signalMax)
         {
            signalMax = SiGnal; 
         }
         else if (SiGnal < signalMin)
         {
            signalMin = SiGnal;  
         }
      }
   }
   peakToPeak = signalMax - signalMin; 
   double volts = (peakToPeak * 5.0) / 1024;  
   Serial.println(volts);


}
