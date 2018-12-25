String ssid = "folksters";
char wifipass[] = "12345678";
boolean resetWifi() ;
boolean wifiConn() { //AT command reference https://room-15.github.io/blog/2015/03/26/esp8266-at-command-reference/
  Serial2.setTimeout(10000);
  resetWifi();
  Serial.println("Connecting Wifi");
  lcdWifi(ssid);
  Serial2.println("AT+CWMODE=1"); //Set to Client(Station) Mode

  /*String connectCmd = "AT+CWJAP=\"";
  connectCmd += ssid;
  connectCmd += "\",\"";
  connectCmd += wifipass;
  connectCmd += "\"\r\n";
  Serial.println(connectCmd);
  Serial2.print(connectCmd);*/
  sendWifiCommand("AT+CWJAP=\""+ String(ssid) +"\",\""+ String(wifipass) +"\"",10,"WIFI CONNECTED");
    Serial2.println("AT+CWMODE?");
    Serial.println(Serial2.read());
}
boolean resetWifi() {
  Serial2.println("AT+RST");
  delay(1000);
  if (Serial2.find("ready")) {
    Serial.println("ESP01 Reset");
    return true;
  }
}
//https://medium.com/@cgrant/using-the-esp8266-wifi-module-with-arduino-uno-publishing-to-thingspeak-99fc77122e82
boolean sendWifiCommand(String command, int timeout, char response[]) {
  Serial.print("ESP CMD: " + command);
  Serial2.println(command);
  delay(timeout*1000);
  if (Serial2.find(response)) {
    Serial.println(response); return true;
  }
  else {
    Serial.println("CMD Fail");
    return false;
  }
}
