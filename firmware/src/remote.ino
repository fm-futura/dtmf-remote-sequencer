#include<inttypes.h>

#define SWITCH_DELAY   (1*1000)
#define POWER_OK_DELAY (30*1000)
#define DTMF_TIMEOUT   (5*1000)
#define RF_LOST_TIMEOUT (5*1000)
#define RF_LOST_RESET_DELAY ((long)60*1000)
#define RF_MAX_AUTO_RESET (3)
#define KEY_SCAN_INTERVAL (100)

// These are active low.
static const uint8_t KEY_ON    = A0;
static const uint8_t KEY_OFF   = A1;

// RF_SENSE is active low.
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
volatile bool rf_lost = false;
volatile unsigned long last_dtmf_time = 0;
volatile unsigned long last_key_scan_time = 0;
volatile unsigned long rf_lost_time = 0;
volatile unsigned long rf_reset_count = 0;


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

  pinMode(KEY_ON,    INPUT_PULLUP);
  pinMode(KEY_OFF,   INPUT_PULLUP);

  pinMode(RELAY_0,   OUTPUT);
  pinMode(RELAY_1,   OUTPUT);
  pinMode(RELAY_2,   OUTPUT);
  pinMode(RELAY_3,   OUTPUT);

  attachInterrupt(digitalPinToInterrupt(DTMF_IRQ), dtmf_irq, RISING);

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
        if (rf_lost) {
          delay(RF_LOST_RESET_DELAY);
        }
        set_power_state(ON);
        delay(POWER_OK_DELAY);
        state = IDLE;
        break;
    }
  }

  if (state == PARSING) {
    if ((millis() - last_dtmf_time) > DTMF_TIMEOUT) {
      state = IDLE;
    }
  }

  if (state == IDLE) {
    if ((millis() - last_key_scan_time) > KEY_SCAN_INTERVAL) {
      last_key_scan_time = millis();
      if (!digitalRead(KEY_OFF) && powered) {
        noInterrupts();
        rf_reset_count = 0;
        state = EXECUTE_ACTION;
        action = OFF;
        interrupts();
        return;
      }
      if (!digitalRead(KEY_ON) && !(powered)) {
        noInterrupts();
        rf_reset_count = 0;
        state = EXECUTE_ACTION;
        action = ON;
        interrupts();
        return;
      }
    }

    rf_lost = digitalRead(RF_SENSE) && powered;
    if (!rf_lost) {
      rf_lost_time = 0;
    } else {

      if (!rf_lost_time) {
        rf_lost_time = millis();
      }

      if ((millis() - rf_lost_time) > RF_LOST_TIMEOUT) {
        noInterrupts();
          if (rf_reset_count < RF_MAX_AUTO_RESET) {
            rf_reset_count += 1;
            action = RESET;
          } else {
            action = OFF;
          }
        state = EXECUTE_ACTION;
        interrupts();
        return;
      }
    }
  }
}


void dtmf_irq ()
{
  uint8_t idx = digitalRead(DTMF_Q0)
              + (digitalRead(DTMF_Q1) << 1)
              + (digitalRead(DTMF_Q2) << 2)
              + (digitalRead(DTMF_Q3) << 3);

  last_dtmf_time = millis();
  process_key(DTMF_TO_ASCII[idx]);
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
            rf_reset_count = 0;
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
