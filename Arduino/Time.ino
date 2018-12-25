
void timeSetup(){
      setSyncProvider(RTC.get);   // the function to get the time from the RTC
    if(timeStatus() != timeSet)        Serial.println("RTC-FAIL");
      else    Serial.println("RTC-OK");
}



String formatTime(){
  time_t t = now();
  String format = String(year(t)) + "-" + String(month(t)) + "-" + String(day(t)) + " " + String(hour(t)) + ":";

  if(minute(t) < 10) {format+="0";}
  format += String(minute(t))+":";
  if(second(t) < 10) {format+="0";}
  format += String(second(t));
  return format;
}
