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


namespace ArduinoCommunicationClient
{
    public partial class Form1 : Form
    {
        ArduinoController arduinoController;
        Light redLight;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            arduinoController = new ArduinoController();
            redLight = new Light("redlight", arduinoController);

        }

        private void lblLight1_Click(object sender, EventArgs e)
        {
            lblLight1.BackColor = Color.DarkRed;

            redLight.AlternateState();
            if(redLight.IsOn())
            {
                lblLight1.BackColor = Color.Red;
            }
        }
    }
}
