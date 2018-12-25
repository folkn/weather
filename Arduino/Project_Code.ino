#include <Wire.h>
#include <math.h>
#include <String.h>

#include <SD.h>
#include <SPI.h>
#include "Libraries/PinChangeInt/PinChangeInt.h"
#include <LiquidCrystal_I2C.h>
#include <DS3232RTC.h>
#include <TimeLib.h>
#include "Libraries/Adafruit_Sensor/Adafruit_Sensor.h"
#include "Libraries/DHT_sensor_library/DHT.h"
#include "Libraries/DHT_sensor_library/DHT_U.h"
#include "Libraries/Adafruit_BMP280_Library/Adafruit_BMP280.h"
#include <LightDependentResistor.h>

#define SIGNAL_PATH_RESET  0x68
#define I2C_SLV0_ADDR      0x37
#define ACCEL_CONFIG       0x1C 
#define MOT_THR            0x1F  // Motion detection threshold bits [7:0]
#define MOT_DUR            0x20  // Duration counter threshold for motion interrupt generation, 1 kHz rate, LSB = 1 ms
#define MOT_DETECT_CTRL    0x69
#define INT_ENABLE         0x38
#define WHO_AM_I_MPU6050   0x75 // Should return 0x68
#define INT_STATUS 0x3A
//when nothing connected to AD0 than address is 0x68

//mpu 0x68 0x69(AD0=5V)
//bmp 0x76
//lcd 0x27
//RTC 57 5F 68
const int chipSelect = 53;
volatile boolean eq = 0;
float tShow, hShow, pShow, ldrShow, rainShow;
float PBMP, TBMP;
const int rainThres=700;

static int DHTPIN = 2;
DHT dht(2, DHT11);

LiquidCrystal_I2C lcd(0x27, 16, 2);
void lcdCustomCharsSetup(void);
void lcdWelcome(void);

const int MPU=0x69;
uint16_t AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ;
double pitch,roll;

//LightDependentResistor(int pin, unsigned long other_resistor, float mult_value, float pow_value);
LightDependentResistor ldrA(A2, 10000,LightDependentResistor::GL5528);
LightDependentResistor ldrB(A3, 10000,LightDependentResistor::GL5528);
LightDependentResistor ldrC(A4, 10000,LightDependentResistor::GL5528);


void setup() {
  Serial.begin(9600);
  Serial.println("Folk2 Weather Station - Debug");
  Wire.begin();  //I2C

  Serial2.begin(115200); 
  dht.begin();

//LCD
Serial.println("lcd begin");
  lcd.begin();
  lcdCustomCharsSetup();
  lcd.backlight();
  lcdWelcome();
  delay(1000);
  
// bme.begin();
//SD
  Serial.print("Initializing SD card...");

  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    while (1);
  }
  Serial.println("card initialized.");

//MPU Begin
Serial.println("MPU begin");
Wire.beginTransmission(MPU);
    writeByte( MPU, 0x6B, 0x00);
    writeByte( MPU, SIGNAL_PATH_RESET, 0x07);//Reset all internal signal paths in the MPU-6050 by writing 0x07 to register 0x68;
    writeByte( MPU, I2C_SLV0_ADDR, 0x20);//write register 0x37 to select how to use the interrupt pin. For an active high, push-pull signal that stays until register (decimal) 58 is read, write 0x20.
    writeByte( MPU, ACCEL_CONFIG, 0x01);//Write register 28 (==0x1C) to set the Digital High Pass Filter, bits 3:0. For example set it to 0x01 for 5Hz. (These 3 bits are grey in the data sheet, but they are used! Leaving them 0 means the filter always outputs 0.)
    writeByte( MPU, MOT_THR, 20);  //Write the desired Motion threshold to register 0x1F (For example, write decimal 20).  
    writeByte( MPU, MOT_DUR, 40 );  //Set motion detect duration to 1  ms; LSB is 1 ms @ 1 kHz rate  
    writeByte( MPU, MOT_DETECT_CTRL, 0x15); //to register 0x69, write the motion detection decrement and a few other settings (for example write 0x15 to set both free-fall and motion decrements to 1 and accelerometer start-up delay to 5ms total by adding 1ms. )   
    writeByte( MPU, INT_ENABLE, 0x40 ); //write register 0x38, bit 6 (0x40), to enable motion detection interrupt.     
    writeByte( MPU, 0x37, 160 ); // now INT pin is active low

Wire.endTransmission(true);



  wifiConn();
  Serial.println("time setup");
  timeSetup();
  Serial.println("int setup");
  interruptSetup();
}



//use struct?? for mpu
void loop() {
  lcdHome();
  delay(3000);
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  if (isnan(h) || isnan(t)) Serial.println("DHT Read Error");
  
Serial.print(eq==1?"EEEEE":"");
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
AcX=(Wire.read()<<8|Wire.read()) + AcXoff;  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)    
AcY=(Wire.read()<<8|Wire.read()) + AcYoff;// 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
AcZ=(Wire.read()<<8|Wire.read()) + AcYoff; // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)

  temp=(Wire.read()<<8|Wire.read()) + toff; // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  tx=temp;
  tr = tx/340 + 36.53;

  GyX=(Wire.read()<<8|Wire.read()) + GyXoff;// 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  GyY=(Wire.read()<<8|Wire.read()) + GyYoff;// 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  GyZ=(Wire.read()<<8|Wire.read()) + GyZoff; // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  getAngle(AcX,AcY,AcZ);
  doBMP();

//data processing
//PBMP  TBMP t(dht) tr(MPU)  h
//Threshold Filter(BPF)
  float allTemp[3] = {TBMP, t, tr};
  int tempValid[3] = {1, 1, 1};
  float tempSum=0;
  for(int i=0; i<3; i++){
    (allTemp[i]>60.0 || allTemp[i]<0.0)?tempValid[i]=1:tempValid[i]=0;
    tempSum += (allTemp[i] * float(tempValid[i]));
  }
  tShow = tempSum / (tempValid[0]+tempValid[1]+tempValid[2]);

  (PBMP > 2000 || PBMP < 200)? pShow=PBMP: pShow=0;
  
//TEMPORARY**
tShow=TBMP; hShow = h; ldrShow=ldrB.getCurrentLux(); rainShow = analogRead(A1);   pShow = PBMP;

//Package and send
lcdHome();Serial.print(eq==1?"EEEEE":"");
package(formatTime(), pShow, TBMP, t,  tr ,  tShow,  hShow, computeHeatIndex(tShow, hShow),  AcX,  AcY, AcZ, sqrt(AcX*AcX+AcY*AcY+AcZ*AcZ), ldrShow, analogRead(A1), "OK");  //add LAT LONG https://www.mathworks.com/help/thingspeak/writedata.html
Serial.println(et55sqrt(AcX*AcX+AcY*AcY+AcZ*AcZ));


  
  //send the data out the serial port
  Serial.println("Time\t\t\tP(BMP)\tT(BMP)\tT(DHT)\tT(MPU)\tTSHOW\tHUM\tPitch\tRoll\tAx\tAy\tAz\tGx\tGy\tGz\tLDRs\t\t\tRain");
Serial.print(formatTime() + "\t");
  Serial.print(pShow);
  Serial.print("\t");
  Serial.print(TBMP);
  Serial.print("\t");
Serial.print(t);  Serial.print("\t");
 Serial.print(tr);Serial.print("\t");
Serial.print(tShow);Serial.print("\t");
  Serial.print(h);  Serial.print("%\t");

Serial.print(pitch);Serial.print("\t"); 
Serial.print(roll); Serial.print("\t"); 

 Serial.print(AcX);Serial.print("\t");
 Serial.print(AcY);Serial.print("\t");
 Serial.print(AcZ);Serial.print("\t");


 Serial.print(GyX);Serial.print("\t");
Serial.print(GyY);Serial.print("\t");
Serial.print(GyZ);Serial.print("\t");


 Serial.print(ldrA.getCurrentLux());Serial.print("\t");
 Serial.print(ldrB.getCurrentLux());Serial.print("\t");
 Serial.print(ldrC.getCurrentLux());Serial.print("\t");
 Serial.println(analogRead(A1));
 if(eq==1) eq=0;
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
void Earthquake(){
  eq=1;
}
void writeByte(uint8_t address, uint8_t subAddress, uint8_t data)
{
  Wire.begin();
  Wire.beginTransmission(address);  // Initialize the Tx buffer
  Wire.write(subAddress);           // Put slave register address in Tx buffer
  Wire.write(data);                 // Put data in Tx buffer
  Wire.endTransmission();           // Send the Tx buffer


}
