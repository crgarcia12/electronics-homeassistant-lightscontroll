using System;
using System.IO.Ports;
using System.Threading;

namespace ArduinoCommunicationClient
{
    public class ArduinoController
    {
        private readonly SerialPort serialPort;
        private object serializerLock = new object();
        Action<string> printDebugMessageAction;

        public ArduinoController(Action<string> printDebugMessageAction)
        {
            this.serialPort = new SerialPort("COM3", 9600);
            this.serialPort.DataBits = 8;
            this.serialPort.StopBits = StopBits.One;
            this.serialPort.Handshake = Handshake.None;
            this.serialPort.Parity = Parity.None;

            this.printDebugMessageAction = printDebugMessageAction;
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

                        // Maybe it was just a dbg message, so print it and wait for the next one
                        printDebugMessageAction(confirmation);
                        //if (confirmation.Contains("[DBG]"))
                        //{
                        //    printDebugMessageAction(confirmation);
                        //}
                        //else if (expectedConfirmationMessage == confirmation)
                        //{
                        //    gotConfirmation = true;
                        //}
                        //else
                        //{ 
                        //    throw new Exception($"Trying to execute '{command}'. Confirmationwas '{confirmation}'"); 
                        //}
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
