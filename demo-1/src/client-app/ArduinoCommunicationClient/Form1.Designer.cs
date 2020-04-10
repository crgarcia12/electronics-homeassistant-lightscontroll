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
            this.lblLight1 = new System.Windows.Forms.Label();
            this.lblLight2 = new System.Windows.Forms.Label();
            this.lblLight3 = new System.Windows.Forms.Label();
            this.trackBar1 = new System.Windows.Forms.TrackBar();
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
            this.SuspendLayout();
            // 
            // lblLight
            // 
            this.lblLight1.BackColor = System.Drawing.Color.Lime;
            this.lblLight1.Location = new System.Drawing.Point(12, 9);
            this.lblLight1.Name = "lblLight";
            this.lblLight1.Size = new System.Drawing.Size(105, 67);
            this.lblLight1.TabIndex = 0;
            this.lblLight1.Click += new System.EventHandler(this.lblLight1_Click);
            // 
            // lblLuz2
            // 
            this.lblLight2.BackColor = System.Drawing.Color.Lime;
            this.lblLight2.Location = new System.Drawing.Point(123, 9);
            this.lblLight2.Name = "lblLuz2";
            this.lblLight2.Size = new System.Drawing.Size(105, 67);
            this.lblLight2.TabIndex = 1;
            // 
            // lblLuz3
            // 
            this.lblLight3.BackColor = System.Drawing.Color.Lime;
            this.lblLight3.Location = new System.Drawing.Point(234, 9);
            this.lblLight3.Name = "lblLuz3";
            this.lblLight3.Size = new System.Drawing.Size(105, 67);
            this.lblLight3.TabIndex = 2;
            // 
            // trackBar1
            // 
            this.trackBar1.Location = new System.Drawing.Point(17, 107);
            this.trackBar1.Name = "trackBar1";
            this.trackBar1.Size = new System.Drawing.Size(580, 80);
            this.trackBar1.TabIndex = 3;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 24F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1201, 664);
            this.Controls.Add(this.trackBar1);
            this.Controls.Add(this.lblLight3);
            this.Controls.Add(this.lblLight2);
            this.Controls.Add(this.lblLight1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblLight1;
        private System.Windows.Forms.Label lblLight2;
        private System.Windows.Forms.Label lblLight3;
        private System.Windows.Forms.TrackBar trackBar1;
    }
}

