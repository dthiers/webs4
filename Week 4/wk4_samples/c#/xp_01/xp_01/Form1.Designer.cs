namespace xp_01
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
            this.btnWrite = new System.Windows.Forms.Button();
            this.btnReadDom = new System.Windows.Forms.Button();
            this.txtOutput = new System.Windows.Forms.TextBox();
            this.btnXslt = new System.Windows.Forms.Button();
            this.wbOutput = new System.Windows.Forms.WebBrowser();
            this.btnValidate1 = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.btnValidate2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnWrite
            // 
            this.btnWrite.Location = new System.Drawing.Point(12, 12);
            this.btnWrite.Name = "btnWrite";
            this.btnWrite.Size = new System.Drawing.Size(97, 23);
            this.btnWrite.TabIndex = 0;
            this.btnWrite.TabStop = false;
            this.btnWrite.Text = "write";
            this.btnWrite.UseVisualStyleBackColor = true;
            this.btnWrite.Click += new System.EventHandler(this.btnWriteXmlWriter_Click);
            // 
            // btnReadDom
            // 
            this.btnReadDom.Location = new System.Drawing.Point(12, 41);
            this.btnReadDom.Name = "btnReadDom";
            this.btnReadDom.Size = new System.Drawing.Size(97, 23);
            this.btnReadDom.TabIndex = 1;
            this.btnReadDom.Text = "read-Dom";
            this.btnReadDom.UseVisualStyleBackColor = true;
            this.btnReadDom.Click += new System.EventHandler(this.btnReadDom_Click);
            // 
            // txtOutput
            // 
            this.txtOutput.AcceptsReturn = true;
            this.txtOutput.Location = new System.Drawing.Point(134, 12);
            this.txtOutput.Multiline = true;
            this.txtOutput.Name = "txtOutput";
            this.txtOutput.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtOutput.Size = new System.Drawing.Size(667, 166);
            this.txtOutput.TabIndex = 3;
            // 
            // btnXslt
            // 
            this.btnXslt.Location = new System.Drawing.Point(13, 186);
            this.btnXslt.Name = "btnXslt";
            this.btnXslt.Size = new System.Drawing.Size(75, 23);
            this.btnXslt.TabIndex = 4;
            this.btnXslt.Text = "xslt";
            this.btnXslt.UseVisualStyleBackColor = true;
            this.btnXslt.Click += new System.EventHandler(this.btnXslt_Click);
            // 
            // wbOutput
            // 
            this.wbOutput.Location = new System.Drawing.Point(134, 186);
            this.wbOutput.MinimumSize = new System.Drawing.Size(20, 20);
            this.wbOutput.Name = "wbOutput";
            this.wbOutput.Size = new System.Drawing.Size(667, 250);
            this.wbOutput.TabIndex = 5;
            // 
            // btnValidate1
            // 
            this.btnValidate1.Location = new System.Drawing.Point(12, 100);
            this.btnValidate1.Name = "btnValidate1";
            this.btnValidate1.Size = new System.Drawing.Size(97, 23);
            this.btnValidate1.TabIndex = 6;
            this.btnValidate1.Text = "validate-1";
            this.btnValidate1.UseVisualStyleBackColor = true;
            this.btnValidate1.Click += new System.EventHandler(this.btnValidate1_Click);
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(13, 330);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(75, 23);
            this.btnClear.TabIndex = 7;
            this.btnClear.Text = "clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnValidate2
            // 
            this.btnValidate2.Location = new System.Drawing.Point(13, 130);
            this.btnValidate2.Name = "btnValidate2";
            this.btnValidate2.Size = new System.Drawing.Size(96, 23);
            this.btnValidate2.TabIndex = 9;
            this.btnValidate2.Text = "validate-2";
            this.btnValidate2.UseVisualStyleBackColor = true;
            this.btnValidate2.Click += new System.EventHandler(this.btnValidate2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(809, 448);
            this.Controls.Add(this.btnValidate2);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnValidate1);
            this.Controls.Add(this.wbOutput);
            this.Controls.Add(this.btnXslt);
            this.Controls.Add(this.txtOutput);
            this.Controls.Add(this.btnReadDom);
            this.Controls.Add(this.btnWrite);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnWrite;
        private System.Windows.Forms.Button btnReadDom;
        private System.Windows.Forms.TextBox txtOutput;
        private System.Windows.Forms.Button btnXslt;
        private System.Windows.Forms.WebBrowser wbOutput;
        private System.Windows.Forms.Button btnValidate1;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button btnValidate2;
    }
}

