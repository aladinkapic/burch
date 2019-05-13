//Interrupts variables
#define FASTLED_ALLOW_INTERRUPTS 0
#define ANALOG_PIN_0 35
volatile int interruptCounter, timer_active = 0;
int totalInterruptCounter = 0, analog_value = 0;

/** Functions prototypes .. **/
void stopTimer();
void startTimer();

//Timer interrupt routine

hw_timer_t * timer = NULL;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;

void IRAM_ATTR onTimer(){
    portENTER_CRITICAL_ISR(&timerMux);
    interruptCounter++;
    portEXIT_CRITICAL_ISR(&timerMux);
}

void setup() {
  Serial.begin(230400);
}

void loop() {
  Serial.write("1");
  delay(500);
  Serial.write("1");
  delay(500);
}


void stopTimer() {
    if (timer != NULL) {
        timerAlarmDisable(timer);
        timerDetachInterrupt(timer);
        timerEnd(timer);
        timer = NULL;
    }
}


void startTimer(){
    timer = timerBegin(0, 80, true);
    timerAttachInterrupt(timer, &onTimer, true);
    timerAlarmWrite(timer, 10000, true);
    timerAlarmEnable(timer);
}
