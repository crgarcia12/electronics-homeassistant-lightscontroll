using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArduinoCommunicationClient.Arduino
{
    public class Motor
    {
        private readonly ArduinoController arduinoController;
        private readonly string name;

        public Motor(string name, ArduinoController arduinoController)
        {
            this.arduinoController = arduinoController;
            this.name = name;
        }

        public void Turn(int angle)
        {
            arduinoController.SendCommand($"{name}1{angle};");
        }
    }
}
