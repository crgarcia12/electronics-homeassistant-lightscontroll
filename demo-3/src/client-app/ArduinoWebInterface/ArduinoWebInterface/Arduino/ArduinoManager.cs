using System;
using System.IO.Ports;
using System.Threading;

namespace ArduinoWebInterface.Arduino
{
    public class ArduinoManager
    {
        private static SerialPort serialPort;
        private static object serializerLock = new object();

        public ArduinoManager()
        {
            lock (serializerLock)
            {
                if (serialPort == null)
                {
                    serialPort = new SerialPort("COM3", 9600);
                    serialPort.DataBits = 8;
                    serialPort.StopBits = StopBits.One;
                    serialPort.Handshake = Handshake.None;
                    serialPort.Parity = Parity.None;
                }
            }
        }

        public void SendCommand(string command)
        {
            lock (serializerLock)
            {
                try
                {
                    serialPort.Open();

                    // Send command
                    command = '[' + command + ']';
                    serialPort.Write(command);

                    string expectedConfirmationMessage = "confirm:" + command;
                    bool gotConfirmation = false;
                    while(!gotConfirmation)
                    {
                        Thread.Sleep(500);

                        string confirmation = serialPort.ReadExisting();
                        gotConfirmation = true;
                    }
                }
                finally
                {
                    if (serialPort.IsOpen)
                    {
                        serialPort.Close();
                    }
                }
            }
        }

        public string SendQuery(string query)
        {
            lock (serializerLock)
            {
                try
                {

                    serialPort.Open();
                    serialPort.WriteLine(query);
                    return serialPort.ReadLine();

                }
                finally
                {
                    if (serialPort.IsOpen)
                    {
                        serialPort.Close();
                    }
                }
            }
        }
    }
}
