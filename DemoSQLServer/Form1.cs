using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoSQLServer
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.reportViewer1.ProcessingMode = ProcessingMode.Remote;
            this.reportViewer1.ServerReport.ReportServerUrl = new Uri(@"http://AB-ASUS:80/ReportServer_SQLSRV2016");
            this.reportViewer1.ServerReport.ReportPath = @"/ExampleSSRS/CustomerList";
            this.reportViewer1.RefreshReport();
        }
    }
}
