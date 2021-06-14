void setup() {
  Serial.begin(115200);
  pinMode(LEDB, OUTPUT);   // LEDB = blue, LEDG or LED_BUILTIN = green, LEDR = red 
}

void loop() {
  Serial.println("Serial print works on the M7 core only.");
  digitalWrite(LEDB, LOW);   // internal LED LOW = on
  delay(1000);               // wait for a second
  digitalWrite(LEDB, HIGH);  
  delay(3000);               
}

