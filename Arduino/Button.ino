void buttonOne() {
  lcdTime();  
  Serial.println("Button");
}
void buttonTwo(){
  lcdHome();
   Serial.println("Button");
}
void buttonThree(){
  lcdSecond();
   Serial.println("Button");
}
void buttonFour(){
  lcdThird();
   Serial.println("Button");
}


void interruptSetup(){
  const int intPins[4] = {A8, A9, A10, A11}; 
  pinMode(intPins[0], INPUT);  
  pinMode(intPins[1], INPUT);
  pinMode(intPins[2], INPUT);
  pinMode(intPins[3], INPUT);
  pinMode(2, INPUT);
  interrupts();
  attachInterrupt(INT1, Earthquake, FALLING) ;                                  
 
  
}
