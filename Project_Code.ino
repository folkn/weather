#include <Wire.h>
#include <math.h>
#include <String.h>

#include "Libraries/Adafruit_Sensor/Adafruit_Sensor.h"
#include "Libraries/DHT_sensor_library/DHT.h"
#include "Libraries/DHT_sensor_library/DHT_U.h"
#include "Libraries/Adafruit_BMP280_Library/Adafruit_BMP280.h"
//#include "Libraries/LiquidCrystal_I2C/LiquidCrystal_I2C.h"



static int DHTPIN = 2;
DHT dht(2, DHT11);

const int MPU=0x68;
uint16_t AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ;
double pitch,roll;

void setup() {
  Serial.begin(9600);
    
  Wire.begin();  //I2C

 // Serial2.begin(115200); 
  dht.begin();
  //wifiConn();

// bme.begin();

//MPU Begin
Wire.beginTransmission(MPU);
Wire.write(0x6B);
Wire.write(0);
Wire.endTransmission(true);

//LCD

}



//use struct?? for mpu
void loop() {
  delay(2000);
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  if (isnan(h) || isnan(t)) Serial.println("DHT Read Error");
  

  Wire.beginTransmission(MPU);
  Wire.write(0x3B);
  Wire.endTransmission(false);
  Wire.requestFrom(MPU,14,true);
  int AcXoff,AcYoff,AcZoff,GyXoff,GyYoff,GyZoff;
  int temp,toff;
  double tr,tx,tf;
  //Acceleration data correction
  AcXoff = -950;
  AcYoff = -300;
  AcZoff = 0;
  //Temperature correction
  toff = -1600;
  //Gyro correction
  GyXoff = 480;
  GyYoff = 170;
  GyZoff = 210;
//read accel data
AcX=(Wire.read()<<8|Wire.read()) + AcXoff;
AcY=(Wire.read()<<8|Wire.read()) + AcYoff;
AcZ=(Wire.read()<<8|Wire.read()) + AcYoff;

  temp=(Wire.read()<<8|Wire.read()) + toff;
  tx=temp;
  tr = tx/340 + 36.53;

  GyX=(Wire.read()<<8|Wire.read()) + GyXoff;
  GyY=(Wire.read()<<8|Wire.read()) + GyYoff;
  GyZ=(Wire.read()<<8|Wire.read()) + GyZoff;
  getAngle(AcX,AcY,AcZ);
  //send the data out the serial port
  Serial.println("P(BMP)\tT(BMP)\tT(DHT)\tT(MPU)\tHUM\tPitch\tRoll\tAx\tAy\tAz\tGx\tGy\tGz\tLDRs\t\t\tRain");
doBMP();
Serial.print(t);  Serial.print("\t");
 Serial.print(tr);Serial.print("\t");

  Serial.print(h);  Serial.print("%\t");

Serial.print(pitch);Serial.print("\t"); 
Serial.print(roll); Serial.print("\t"); 

 Serial.print(AcX);Serial.print("\t");
 Serial.print(AcY);Serial.print("\t");
 Serial.print(AcZ);Serial.print("\t");


 Serial.print(GyX);Serial.print("\t");
Serial.print(GyY);Serial.print("\t");
Serial.print(GyZ);Serial.print("\t");


 Serial.print(analogRead(A2));Serial.print("\t");
 Serial.print(analogRead(A3));Serial.print("\t");
 Serial.print(analogRead(A4));Serial.print("\t");
 Serial.println(analogRead(A1));
 
}
void getAngle(int Vx,int Vy,int Vz) {
  double x = Vx;
  double y = Vy;
  double z = Vz;
  //**loc gravity value
  pitch = atan(x/sqrt((y*y) + (z*z)));
  roll = atan(y/sqrt((x*x) + (z*z)));
  //convert radians into degrees
  pitch = pitch * (180.0/3.14);
  roll = roll * (180.0/3.14) ;
}



float computeHeatIndex(float temp, float humidity){
  //https://github.com/adafruit/DHT-sensor-library/issues/9
  //https://www.wpc.ncep.noaa.gov/html/heatindex_equation.shtml
  return -8.784695 +
1.61139411 * temp +
2.33854900 * humidity +
-0.14611605 * temp*humidity +
-0.01230809 * pow(temp, 2) +
-0.01642482 * pow(humidity, 2) +
0.00221173 * pow(temp, 2) * humidity +
0.00072546 * temp * pow(humidity, 2) +
-0.00000358 * pow(temp, 2) * pow(humidity, 2);

}
