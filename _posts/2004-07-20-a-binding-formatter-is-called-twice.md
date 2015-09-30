---
layout: post
title: 'A Binding Formatter is Called Twice'
category: uncategorized
---

It seems that a binding formatter is called twice when a user leaves a textbox control. As the user leaves the control the Leave event for the control is fired followed by the binding format event. The setter method of the bounded property is called next followed by the getter method then finally the binding format event is called again.

This should not be a concern for applications that use binding formatters but the developer should know it will be called twice.

Here is sample code that illustrates the behavior:

    using System;
    using System.Drawing;
    using System.Collections;
    using System.ComponentModel;
    using System.Windows.Forms;
    using System.Data;
    using System.Diagnostics;

    namespace SampleWindowsApp
    {
        /// <summary>
        /// Summary description for Form1.
        /// </summary>
        public class Form1 : System.Windows.Forms.Form
        {
            private System.Windows.Forms.TextBox textBox1;
            private System.Windows.Forms.Button button1;
            private MyClass _dataSource = new MyClass();

            /// <summary>
            /// Required designer variable.
            /// </summary>
            private System.ComponentModel.Container components = null;

            public Form1()
            {
                //
                // Required for Windows Form Designer support
                //
                InitializeComponent();
            }

            /// <summary>
            /// Clean up any resources being used.
            /// </summary>
            protected override void Dispose( bool disposing )
            {
                if( disposing )
                {
                    if (components != null)
                    {
                        components.Dispose();
                    }
                }
                base.Dispose( disposing );
            }

            #region Windows Form Designer generated code
            /// <summary>
            /// Required method for Designer support - do not modify
            /// the contents of this method with the code editor.
            /// </summary>
            private void InitializeComponent()
            {
                this.textBox1 = new System.Windows.Forms.TextBox();
                this.button1 = new System.Windows.Forms.Button();
                this.SuspendLayout();
                //
                // textBox1
                //
                this.textBox1.Location = new System.Drawing.Point(56, 32);
                this.textBox1.Name = "textBox1";
                this.textBox1.TabIndex = 0;
                this.textBox1.Text = "textBox1";
                this.textBox1.Leave += new System.EventHandler(this.textBox1_Leave);
                //
                // button1
                //
                this.button1.Location = new System.Drawing.Point(72, 120);
                this.button1.Name = "button1";
                this.button1.TabIndex = 1;
                this.button1.Text = "button1";
                //
                // Form1
                //
                this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
                this.ClientSize = new System.Drawing.Size(292, 266);
                this.Controls.Add(this.button1);
                this.Controls.Add(this.textBox1);
                this.Name = "Form1";
                this.Text = "Form1";
                this.Load += new System.EventHandler(this.Form1_Load);
                this.ResumeLayout(false);

            }
            #endregion

            /// <summary>
            /// The main entry point for the application.
            /// </summary>
            [STAThread]
            static void Main()
            {
                Application.Run(new Form1());
            }

            private void Form1_Load(object sender, System.EventArgs e)
            {
                Binding binding = new Binding( "Text", _dataSource, "Value" );
                binding.Format += new ConvertEventHandler(binding_Format);

                textBox1.DataBindings.Add( binding );
            }

            private void binding_Format(object sender, ConvertEventArgs e)
            {
                Debug.WriteLine( "Format" );
            }

            private void textBox1_Leave(object sender, System.EventArgs e)
            {
                Debug.WriteLine( "Leave" );

            }
        }

        class MyClass
        {
            private string _value = "Default value.";
            public string Value
            {
                get
                {
                    Debug.WriteLine( "MyClass.Value getter" );
                    return _value;
                }
                set
                {
                    Debug.WriteLine( "MyClass.Value setter" );
                    _value = value;
                }
            }
        }
    }
