namespace ArduinoCommunicationClient
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblLightR = new System.Windows.Forms.Label();
            this.lblLightY = new System.Windows.Forms.Label();
            this.lblLightG = new System.Windows.Forms.Label();
            this.trackMotor = new System.Windows.Forms.TrackBar();
            this.lstDebug = new System.Windows.Forms.ListBox();
            ((System.ComponentModel.ISupportInitialize)(this.trackMotor)).BeginInit();
            this.SuspendLayout();
            // 
            // lblLightR
            // 
            this.lblLightR.BackColor = System.Drawing.Color.Lime;
            this.lblLightR.Location = new System.Drawing.Point(12, 9);
            this.lblLightR.Name = "lblLightR";
            this.lblLightR.Size = new System.Drawing.Size(105, 67);
            this.lblLightR.TabIndex = 0;
            this.lblLightR.Click += new System.EventHandler(this.lblLightR_Click);
            // 
            // lblLightY
            // 
            this.lblLightY.BackColor = System.Drawing.Color.Lime;
            this.lblLightY.Location = new System.Drawing.Point(123, 9);
            this.lblLightY.Name = "lblLightY";
            this.lblLightY.Size = new System.Drawing.Size(105, 67);
            this.lblLightY.TabIndex = 1;
            this.lblLightY.Click += new System.EventHandler(this.lblLightY_Click);
            // 
            // lblLightG
            // 
            this.lblLightG.BackColor = System.Drawing.Color.Lime;
            this.lblLightG.Location = new System.Drawing.Point(234, 9);
            this.lblLightG.Name = "lblLightG";
            this.lblLightG.Size = new System.Drawing.Size(105, 67);
            this.lblLightG.TabIndex = 2;
            this.lblLightG.Click += new System.EventHandler(this.lblLightG_Click);
            // 
            // trackMotor
            // 
            this.trackMotor.Location = new System.Drawing.Point(17, 107);
            this.trackMotor.Maximum = 180;
            this.trackMotor.Name = "trackMotor";
            this.trackMotor.Size = new System.Drawing.Size(580, 80);
            this.trackMotor.TabIndex = 3;
            this.trackMotor.Scroll += new System.EventHandler(this.trackMotor_Scroll);
            // 
            // lstDebug
            // 
            this.lstDebug.FormattingEnabled = true;
            this.lstDebug.ItemHeight = 24;
            this.lstDebug.Location = new System.Drawing.Point(12, 193);
            this.lstDebug.Name = "lstDebug";
            this.lstDebug.Size = new System.Drawing.Size(1177, 460);
            this.lstDebug.TabIndex = 4;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 24F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1201, 664);
            this.Controls.Add(this.lstDebug);
            this.Controls.Add(this.trackMotor);
            this.Controls.Add(this.lblLightG);
            this.Controls.Add(this.lblLightY);
            this.Controls.Add(this.lblLightR);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.trackMotor)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblLightR;
        private System.Windows.Forms.Label lblLightY;
        private System.Windows.Forms.Label lblLightG;
        private System.Windows.Forms.TrackBar trackMotor;
        private System.Windows.Forms.ListBox lstDebug;
    }
}

