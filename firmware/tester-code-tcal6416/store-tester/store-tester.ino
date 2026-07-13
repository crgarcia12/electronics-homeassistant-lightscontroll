
///////////// IMPORTANT ////////////////
// To be able to deploy and get the Serial working you need to configure Arduino IDE as follow
//
// USB Mode: Hardware CDC and JTAG
// Upload mode: Hardware CDC / JTAG
// USB CDC on boot: enabled
// board: ESP32S3 DevModule

#include <Arduino.h>
#include "Wire.h"

#define STAUS_LED_PIN 1
#define I2C_SDA 42
#define I2C_SCL 41
#define TCAL6416_ADDR 0x20  // I2C address (0x20: ADDR pin = GND)

#define OUTPUT_ENABLED_PIN 16
#define TACL_INT_PIN 17

#define BUTTON_PIN 15
int button_push;
int store_moving;

//////////////////////////////2/////////
/// TCAL6416 SPECIFIC CONSTANTS
TwoWire *TW;
uint8_t i2caddr;
uint8_t i2cwidth;
uint16_t pinState;
uint16_t pinModes;
#define TCAREG_INPUT0 0x00
#define TCAREG_INPUT1 0x01
#define TCAREG_OUTPUT0 0x02
#define TCAREG_OUTPUT1 0x03
#define TCAREG_POLARITY0 0x04
#define TCAREG_POLARITY1 0x05
#define TCAREG_CONFIG0 0x06
#define TCAREG_CONFIG1 0x07
///////////////////////////////////////


/// interrupt from TCAL6416A
volatile bool interrupted = false;
void IRAM_ATTR isr() {
    interrupted = true;
}
/////////////////////////////////////////////////////
bool TCA6416A_begin(uint8_t addr_bit, TwoWire *theWire) {
	i2caddr = 0x20 | addr_bit;
  i2cwidth = 2;
	TW = theWire;
	TW->begin();

	/// Check if device is connected
	TW->beginTransmission((int)i2caddr);
	if (TW->endTransmission() != 0) {
		return false;
	}

	TCA6416A_port_read();
	TCA6416A_mode_read();

	return true;
}


void TCA6416A_pin_write(uint8_t pinNum, uint8_t level) {
	uint16_t mask = 1 << pinNum;

	if (level == HIGH) {
		pinState |= mask;
	} else {
		pinState &= ~mask;
	}

	TCA6416A_port_write(pinState);
}

void TCA6416A_pin_mode(uint8_t pinNum, int mode) {
	uint16_t mask = 1 << pinNum;

	if (mode == INPUT) {
		pinModes |= mask;
	} else {
		pinModes &= ~mask;
	}

	TCA6416A_mode_write(pinModes);
}

int TCA6416A_pin_read(uint8_t pinNum) {
	uint16_t mask = 1 << pinNum;

	TCA6416A_port_read();

	if ((pinState & mask) == mask) {
		return 1;
	} else {
		return 0;
	}
}

void TCA6416A_port_write(uint16_t i2cportval) {
	TW->beginTransmission((int)i2caddr);
	TW->write(TCAREG_OUTPUT0);

	TW->write(i2cportval & 0x00FF);
	TW->write(i2cportval >> 8 );

	TW->endTransmission();

	pinState = i2cportval;
}

uint16_t TCA6416A_port_read() {
	uint16_t tempInput;
	TW->beginTransmission((int)i2caddr);
	TW->write(TCAREG_INPUT0);
	TW->endTransmission();

	TW->requestFrom((int)i2caddr, (int)i2cwidth);

	tempInput = TW->read();
	tempInput |= TW->read() << 8;

	pinState = (pinState & ~pinModes) | (tempInput & pinModes);

	return pinState;
}

void TCA6416A_mode_write(uint16_t modes) {
	TW->beginTransmission((int)i2caddr);
	TW->write(TCAREG_CONFIG0);

	TW->write(modes & 0x00FF);
	TW->write(modes >> 8 );

	TW->endTransmission();

	pinModes = modes;
}

uint16_t TCA6416A_mode_read() {
	TW->beginTransmission((int)i2caddr);
	TW->write(TCAREG_CONFIG0);
	TW->endTransmission();

	TW->requestFrom((int)i2caddr, (int)i2cwidth);

	pinModes = TW->read();
	pinModes |= TW->read() << 8;

	return pinModes;
}


void setup() {
  Serial.begin(115200);
	Serial.println("---------------------------------------------------");
	Serial.println("STARTING");
	Serial.println("---------------------------------------------------");

	pinMode(STAUS_LED_PIN, OUTPUT);
	pinMode(BUTTON_PIN, INPUT);
	pinMode(OUTPUT_ENABLED_PIN, OUTPUT);
	digitalWrite(OUTPUT_ENABLED_PIN, LOW);

	for (int i = 0; i < 10; i ++)
	{
  	digitalWrite(STAUS_LED_PIN, LOW);
		delay(500);
		digitalWrite(STAUS_LED_PIN, HIGH);
		delay(500);
	}
  delay(1000);	

  // Resetting TCAL6416
	
  
  
  delay(1000);
  digitalWrite(OUTPUT_ENABLED_PIN, HIGH);

  Wire.begin(I2C_SDA, I2C_SCL);

  Serial.println("Connecting");
	while (!TCA6416A_begin(TCAL6416_ADDR, &Wire)) { // replace 0 with the address bit of your TCA6416A
    Serial.println("TCA6416A not found");
		delay(1000);
	}
  Serial.println("TCA6416A found");

	// Configure interrupt
	pinMode(TACL_INT_PIN, INPUT_PULLUP);
	attachInterrupt(TACL_INT_PIN, isr, FALLING);

	for (int i = 0; i < 8; i ++)
	{
		TCA6416A_pin_mode(i, INPUT);
		TCA6416A_pin_mode(i+8, OUTPUT);
	}
}

void loop() {

	if(interrupted)
	{
		Serial.println("INTERRUPTED");
		interrupted = false;
	}

	// Reading
	//Serial.print("Reading pins: ");
	for(int i = 0; i < 8; i++)
	{
  	int value = TCA6416A_pin_read(i);
  	//Serial.print(value);
	}
	//Serial.println("");

	// Writing
	int button = digitalRead(BUTTON_PIN);
  if (button == HIGH) {
    button_push ++;
  } else {
    button_push = 0;
  }
	Serial.print("Button push: ");
	Serial.println(button_push);

	if(button_push == 10)
	{
		store_moving = !store_moving;
		Serial.print("Store moving: ");
		Serial.println(store_moving);
	}

  digitalWrite(STAUS_LED_PIN, true);
	
	TCA6416A_pin_write(15, store_moving);

	//Serial.print("Writing output pins: ");
  //Serial.println(store_moving);

  delay(1000);
}
