using System;
using System.IO.Ports;


namespace ArduinoCommunicationClient
{
    public class ArduinoController
    {
        private readonly SerialPort serialPort;
        private object serializerLock = new object();

        public ArduinoController()
        {
            serialPort = new SerialPort("COM6", 9600);
            serialPort.DataBits = 8;
            serialPort.StopBits = StopBits.One;
            serialPort.Handshake = Handshake.None;
            serialPort.Parity = Parity.None;
        }

        public void SendCommand(string command)
        {
            lock (serializerLock)
            {
                try
                {
                    serialPort.Open();
                    serialPort.WriteLine(command);
                    string confirmation = serialPort.ReadLine();
                    if (command != confirmation)
                    {
                        throw new Exception($"Trying to execute '{command}'. Confirmationwas '{confirmation}'");
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
