using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArduinoCommunicationClient.Arduino
{
    class Buzzel
    {
        private readonly ArduinoController arduinoController;
        private readonly string name;

        private bool state = false;

        public Buzzel(string name, ArduinoController arduinoController)
        {
            this.arduinoController = arduinoController;
            this.name = name;
        }
        public void TurnOf()
        {
            this.arduinoController.SendCommand($"{name}0");
        }

        public void Play(int frecuency)
        {
            this.arduinoController.SendCommand($"{name}1{frecuency}");
        }
    }
}
