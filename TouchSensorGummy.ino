
int SENSOR_PIN = A0;
//Gbutton = 2;

int buttonValue = 0;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
}

void loop() {
  buttonValue = 0;
  if ( digitalRead (2) == LOW) {
    buttonValue=1;
  }
  else if ( digitalRead (3) == LOW) {
    buttonValue=2; 
  }
  else if ( digitalRead (4) == LOW) {
    buttonValue=3;
  }
  else if ( digitalRead (5) == LOW) {
    buttonValue=4; 
  }



  Serial.print(buttonValue);
  Serial.println();
  delay(5);
}


