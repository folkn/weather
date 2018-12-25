unsigned long tsChannel = 631996;
String tsAPIKey = "4AWKDA8ZLHW07BCW";
boolean sendWifiCommand(String command, int timeout, char response);
void package(String clk, float P, float TBmp, float TDht, float TMpu , float Temp, float H, float HI, float Ax, float Ay, float Az, float A, float LDR, float rain, char myStatus) { //add LAT LONG https://www.mathworks.com/help/thingspeak/writedata.html
 //Dont forget time, location, etc
  
  //Packaging for ThingSpeak  https://community.thingspeak.com/documentation%20.../api/
  String TSData = "GET /update?api_key=" + tsAPIKey + "&field1=" + String(Temp) + "&field2=" + String(P) + "&field3=" + String(H) + "&field4=" + String(LDR) + "&field5=" + String(A) + "&field6=" + String(rain) + "&field8=" + String(HI) + "&status=" + String(myStatus);
  Serial.println("TSDATA=" + TSData);
  TSPublish(TSData);

  

  //Packaging for SD Card Logging
  String SDData = String(clk) + ","+String(P) + "," + String(TBmp) + "," + String(TDht) + "," + String(TMpu) + "," + String(Temp)+ "," + String(H)+ "," + String(HI)+ "," + String(Ax)+ "," + String(Ay)+ "," + String(Az)+ "," + String(A)+ "," + String(LDR)+ "," + String(rain)+"\n";
  SDLog(SDData);
}
//data processing https://community.thingspeak.com/tutorials/arduino/send-data-to-thingspeak-with-arduino/

void TSPublish(String data) { /////https://medium.com/@cgrant/using-the-esp8266-wifi-module-with-arduino-uno-publishing-to-thingspeak-99fc77122e82
  const String HOST = "api.thingspeak.com";
  const String PORT = "80";

  sendWifiCommand("AT+CIPMUX=1", 3, "OK"); //Enable multiplex connections
  sendWifiCommand("AT+CIPSTART=0,\"TCP\",\"" + HOST + "\"," + PORT, 3, "OK"); //establish connection id=0 as TCP connect to TS
  
  sendWifiCommand("AT+CIPSEND=0," + String(data.length() + 4), 2, ">"); //Sends number of bytes to send
   Serial2.println(data); delay(500); //Send Data
  sendWifiCommand("AT+CIPCLOSE=0", 2, "OK"); //Close connection
}

void SDLog(String data){
 File dataFile = SD.open("datalog.txt", FILE_WRITE);
   if (dataFile) {
    dataFile.println(data);
    dataFile.close();
   } else 
    Serial.println("error opening datalog.txt");
}
