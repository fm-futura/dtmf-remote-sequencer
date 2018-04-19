#include<inttypes.h>

#define SWITCH_DELAY   (1*1000)
#define POWER_OK_DELAY (10*1000)
#define DTMF_TIMEOUT   (5*1000)

static const uint8_t RF_SENSE  = 2;
static const uint8_t DTMF_IRQ  = 3;

static const uint8_t DTMF_Q0   = 4;
static const uint8_t DTMF_Q1   = 5;
static const uint8_t DTMF_Q2   = 6;
static const uint8_t DTMF_Q3   = 7;

static const uint8_t RELAY_0   = 9;
static const uint8_t RELAY_1   = 10;
static const uint8_t RELAY_2   = 11;
static const uint8_t RELAY_3   = 12;

static const char *DTMF_TO_ASCII = "D1234567890*#ABC";

volatile enum STATE {
  IDLE,
  EXECUTE_ACTION,
  PARSING,
} state = IDLE;


volatile enum ACTIONS {
  RESET = 99,
  OFF   = 00, // Yeah, it's octal but things line up nicer.
  ON    = 11,
} action;

volatile bool powered = false;
volatile unsigned long next_dtmf_timeout = 0;


void process_key (char key);
void set_power_state(ACTIONS action);


void setup ()
{
  pinMode(DTMF_IRQ,  INPUT_PULLUP);
  pinMode(DTMF_Q0,   INPUT_PULLUP);
  pinMode(DTMF_Q1,   INPUT_PULLUP);
  pinMode(DTMF_Q2,   INPUT_PULLUP);
  pinMode(DTMF_Q3,   INPUT_PULLUP);
  pinMode(RF_SENSE,  INPUT_PULLUP);

  pinMode(RELAY_0,   OUTPUT);
  pinMode(RELAY_1,   OUTPUT);
  pinMode(RELAY_2,   OUTPUT);
  pinMode(RELAY_3,   OUTPUT);

  attachInterrupt(digitalPinToInterrupt(DTMF_IRQ), dtmf_irq, RISING);
  attachInterrupt(digitalPinToInterrupt(RF_SENSE), rf_irq,   RISING);

  state = EXECUTE_ACTION;
  set_power_state(ON);
  state = IDLE;
}


void loop ()
{
  if (state == EXECUTE_ACTION) {
    switch (action) {
      case ON:
      case OFF:
        set_power_state(action);
        delay(POWER_OK_DELAY);
        state = IDLE;
        break;

      case RESET:
        set_power_state(OFF);
        delay(POWER_OK_DELAY);
        set_power_state(ON);
        delay(POWER_OK_DELAY);
        state = IDLE;
        break;
    }
  }

  if (state == PARSING) {
    if (millis() > next_dtmf_timeout) {
      state = IDLE;
    }
  }
}


void dtmf_irq ()
{
  uint8_t idx = digitalRead(DTMF_Q0)
              + (digitalRead(DTMF_Q1) << 1)
              + (digitalRead(DTMF_Q2) << 2)
              + (digitalRead(DTMF_Q3) << 3);

  next_dtmf_timeout = millis() + DTMF_TIMEOUT;
  process_key(DTMF_TO_ASCII[idx]);
}

void rf_irq ()
{
  if (state != IDLE) {
    return;
  }
  state = EXECUTE_ACTION;
  action = RESET;
}


void process_key (char key)
{
  static char buffer[] = "xxx";
  static uint8_t idx = 0;

  switch (state) {
    case EXECUTE_ACTION:
      return;
      break;

    case IDLE:
      if (key == '*') {
        idx = 0;
        state = PARSING;
      }
      break;

    case PARSING:
      if (idx < 2) {
        if ((key >= '0') && (key <= '9')) {
          buffer[idx] = key;
          idx++;
        } else {
          state = IDLE;
          return;
        }
      } else {
        if (key != '#') {
          state = IDLE;
          return;
        }

        ACTIONS requested_action = (ACTIONS) (
          10 * (buffer[0] - '0')
          +    (buffer[1] - '0'));

        switch (requested_action) {
          case ON:
          case OFF:
          case RESET:
            action = requested_action;
            state = EXECUTE_ACTION;
            break;

          default:
            state = IDLE;
            break;
        }
      }
  }
}


void set_power_state(ACTIONS action) {
  bool next_power_state = (action == ON) ? true : false;

  digitalWrite(RELAY_0, next_power_state);
  delay(SWITCH_DELAY);
  digitalWrite(RELAY_1, next_power_state);
  delay(SWITCH_DELAY);
  digitalWrite(RELAY_2, next_power_state);
  delay(SWITCH_DELAY);
  digitalWrite(RELAY_3, next_power_state);
  delay(SWITCH_DELAY);

  powered = next_power_state;
}
