byte squaredChar[] = {B11100,
  B00100,
  B11100,
  B10000,
  B11100,
  B00000,
  B00000,
  B00000
};
byte rainChar[] = {
  B01110,
  B10001,
  B10001,
  B01110,
  B00000,
  B01010,
  B00000,
  B01010
};
byte degChar[] = {
  B01110,
  B01010,
  B01110,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000
};

volatile int menu[3] = {1, 0, 0};

void lcdCustomCharsSetup(){
  lcd.createChar(0, squaredChar);
  lcd.createChar(1, rainChar);
  lcd.createChar(2, degChar);
}



void lcdWelcome(){
  lcd.setCursor(0,0);
  lcd.print("Folk");
  lcd.setCursor(4,0); lcd.write(byte(0));
  lcd.setCursor(15,0); lcd.write(1);
  lcd.setCursor(0,1);   lcd.print("Weather Station");
}
void lcdTime(){
  lcd.clear();
  lcd.setCursor(0,0);
}
void lcdHome(){ 
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("T");
  lcd.setCursor(1,0); lcd.print(String(tShow,1));
  lcd.setCursor(5,0); lcd.write(2);
  lcd.setCursor(6,0); lcd.print("C H");
  lcd.setCursor(10,0); lcd.print(String(hShow,0));
  lcd.setCursor(12,0); lcd.print("% ");
  lcd.setCursor(15,0);  rainShow<float(rainThres)?lcd.write(1):lcd.print(" ");
  
  lcd.setCursor(0,1);  lcd.print("P");
  lcd.setCursor(1,1); lcd.print(String(pShow,1)) ;
  lcd.setCursor(7,1); lcd.print(" LUX");
  lcd.setCursor(11,1); lcd.print(String(ldrShow));
  
}
void lcdSecond(){ //RAW
    lcd.clear();
  lcd.setCursor(0,0);
}
void lcdThird(){ //RAW
    lcd.clear();
  lcd.setCursor(0,0);
}

void lcdWifi(String ap){ //0 1 0
  lcd.clear();
  lcd.print("CONNECTING WIFI");
  lcd.setCursor(0,1);
  lcd.print(ap);
}



/*
 * void LCDChange(int first, int second, int third){
  switch (first){
    case 0:
      switch(second){
        case 1:
        lcdWifi();
        break;
      }

    break;
    case 1:
      switch(second){
        case 0:
        lcdHome();
        break;
      }

    break;
    case 2:
    break;
  }
}
 */
