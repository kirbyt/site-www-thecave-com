---
layout: post
title: 'A Binding Formatter is Called Twice'
categories:
  - blogger

---

It seems that a binding formatter is called twice when a user leaves a textbox control. As the user leaves the control the Leave event for the control is fired followed by the binding format event. The setter method of the bounded property is called next followed by the getter method then finally the binding format event is called again.
<br />
<br /> This should not be a concern for applications that use binding formatters but the developer should know it will be called twice.
<br />
<br /> Here is sample code that illustrates the behavior:<span style="font-family: monospace"><pre>
<br /> using System;
<br /> using System.Drawing;
<br /> using System.Collections;
<br /> using System.ComponentModel;
<br /> using System.Windows.Forms;
<br /> using System.Data;
<br /> using System.Diagnostics;
<br />
<br /> namespace SampleWindowsApp
<br /> {
<br />     /// <summary>
<br />     /// Summary description for Form1.
<br />     /// </summary>
<br />     public class Form1 : System.Windows.Forms.Form
<br />     {
<br />         private System.Windows.Forms.TextBox textBox1;
<br />         private System.Windows.Forms.Button button1;
<br />         private MyClass _dataSource = new MyClass();
<br />
<br />         /// <summary>
<br />         /// Required designer variable.
<br />         /// </summary>
<br />         private System.ComponentModel.Container components = null;
<br />
<br />         public Form1()
<br />         {
<br />             //
<br />             // Required for Windows Form Designer support
<br />             //
<br />             InitializeComponent();
<br />         }
<br />
<br />         /// <summary>
<br />         /// Clean up any resources being used.
<br />         /// </summary>
<br />         protected override void Dispose( bool disposing )
<br />         {
<br />             if( disposing )
<br />             {
<br />                 if (components != null)
<br />                 {
<br />                     components.Dispose();
<br />                 }
<br />             }
<br />             base.Dispose( disposing );
<br />         }
<br />
<br />         #region Windows Form Designer generated code
<br />         /// <summary>
<br />         /// Required method for Designer support - do not modify
<br />         /// the contents of this method with the code editor.
<br />         /// </summary>
<br />         private void InitializeComponent()
<br />         {
<br />             this.textBox1 = new System.Windows.Forms.TextBox();
<br />             this.button1 = new System.Windows.Forms.Button();
<br />             this.SuspendLayout();
<br />             //
<br />             // textBox1
<br />             //
<br />             this.textBox1.Location = new System.Drawing.Point(56, 32);
<br />             this.textBox1.Name = "textBox1";
<br />             this.textBox1.TabIndex = 0;
<br />             this.textBox1.Text = "textBox1";
<br />             this.textBox1.Leave += new System.EventHandler(this.textBox1_Leave);
<br />             //
<br />             // button1
<br />             //
<br />             this.button1.Location = new System.Drawing.Point(72, 120);
<br />             this.button1.Name = "button1";
<br />             this.button1.TabIndex = 1;
<br />             this.button1.Text = "button1";
<br />             //
<br />             // Form1
<br />             //
<br />             this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
<br />             this.ClientSize = new System.Drawing.Size(292, 266);
<br />             this.Controls.Add(this.button1);
<br />             this.Controls.Add(this.textBox1);
<br />             this.Name = "Form1";
<br />             this.Text = "Form1";
<br />             this.Load += new System.EventHandler(this.Form1_Load);
<br />             this.ResumeLayout(false);
<br />
<br />         }
<br />         #endregion
<br />
<br />         /// <summary>
<br />         /// The main entry point for the application.
<br />         /// </summary>
<br />         [STAThread]
<br />         static void Main()
<br />         {
<br />             Application.Run(new Form1());
<br />         }
<br />
<br />         private void Form1_Load(object sender, System.EventArgs e)
<br />         {
<br />             Binding binding = new Binding( "Text", _dataSource, "Value" );
<br />             binding.Format += new ConvertEventHandler(binding_Format);
<br />
<br />             textBox1.DataBindings.Add( binding );
<br />         }
<br />
<br />         private void binding_Format(object sender, ConvertEventArgs e)
<br />         {
<br />             Debug.WriteLine( "Format" );
<br />         }
<br />
<br />         private void textBox1_Leave(object sender, System.EventArgs e)
<br />         {
<br />             Debug.WriteLine( "Leave" );
<br />
<br />         }
<br />     }
<br />
<br />     class MyClass
<br />     {
<br />         private string _value = "Default value.";
<br />         public string Value
<br />         {
<br />             get
<br />             {
<br />                 Debug.WriteLine( "MyClass.Value getter" );
<br />                 return _value;
<br />             }
<br />             set
<br />             {
<br />                 Debug.WriteLine( "MyClass.Value setter" );
<br />                 _value = value;
<br />             }
<br />         }
<br />     }
<br /> }
<br /> </pre>
<br /> </span>
