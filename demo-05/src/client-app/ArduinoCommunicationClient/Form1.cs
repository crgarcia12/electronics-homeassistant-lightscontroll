using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using ArduinoCommunicationClient.Arduino;
using System.Threading;
using ArduinoCommunicationClient.Azure;
using Microsoft.OData.Edm;

namespace ArduinoCommunicationClient
{
    public partial class Form1 : Form
    {
        ArduinoController arduinoController;
        DbManager dbManager = new DbManager();
        Task readingTask;
        bool reading = false;


        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            arduinoController = new ArduinoController(PrintDebugMessage);
        }

        public void PrintDebugMessage(String message)
        {
            lstDebug.Items.Add(DateTime.Now.ToString("yyyyMMdd HH:mm:ss") + "-" + message);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if(reading || (readingTask != null && !readingTask.IsCompleted))
            {
                return;
            }

            reading = true;
            
            int value = this.arduinoController.ReadValue();
            if (value > 0)
            {
                readingTask = dbManager.StoreNewRecord(DateTime.UtcNow, value);
            }

            reading = false;
        }
    }
}
