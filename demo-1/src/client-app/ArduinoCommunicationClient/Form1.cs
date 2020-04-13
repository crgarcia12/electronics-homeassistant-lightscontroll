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

namespace ArduinoCommunicationClient
{
    public partial class Form1 : Form
    {
        ArduinoController arduinoController;
        Light redLight;
        Light yellowLight;
        Light greenLight;
        Motor motor;
        Buzzel buzzel;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            arduinoController = new ArduinoController(PrintDebugMessage);
            redLight = new Light("R", arduinoController);
            yellowLight = new Light("Y", arduinoController);
            greenLight = new Light("G", arduinoController);
            motor = new Motor("M", arduinoController);
            buzzel = new Buzzel("B", arduinoController);

            lblLightR.BackColor = Color.DarkRed;
            lblLightY.BackColor = Color.DarkGoldenrod;
            lblLightG.BackColor = Color.DarkGreen;
        }

        private void lblLightR_Click(object sender, EventArgs e)
        {
            lblLightR.BackColor = Color.DarkRed;

            redLight.AlternateState();
            if(redLight.IsOn())
            {
                lblLightR.BackColor = Color.Red;
            }
        }

        public void PrintDebugMessage(String message)
        {
            lstDebug.Items.Add(message);
        }

        private void lblLightY_Click(object sender, EventArgs e)
        {
            lblLightY.BackColor = Color.DarkGoldenrod;

            yellowLight.AlternateState();
            if (yellowLight.IsOn())
            {
                lblLightY.BackColor = Color.Yellow;
            }
        }

        private void lblLightG_Click(object sender, EventArgs e)
        {
            lblLightG.BackColor = Color.DarkGreen;

            greenLight.AlternateState();
            if (greenLight.IsOn())
            {
                lblLightG.BackColor = Color.LightGreen;
            }
        }

        private void trackMotor_Scroll(object sender, EventArgs e)
        {
            motor.Turn(trackMotor.Value);
        }

        private void lblAlarm_Click(object sender, EventArgs e)
        {
            bool previousState = redLight.IsOn();

            redLight.TurnOn();
            buzzel.Play(1000);
            buzzel.TurnOf();
            Thread.Sleep(5000);
            redLight.TurnOn();
            buzzel.Play(1000);
            buzzel.TurnOf();

            redLight.Turn(previousState);
        }
    }
}
