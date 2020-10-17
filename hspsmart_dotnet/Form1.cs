using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using moe.hsp.hspsmart.dotnet;
using System.Diagnostics;

namespace hspsmart_dotnet
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // 管理者権限で起動していないとダメ
            if (!CHspSmartDotNet.IsCurrentUserLocalAdministrator())
            {
                return;
            }

            CHspSmartDotNet smart = new CHspSmartDotNet();
            smart.DiskScan();
            Debug.WriteLine(smart.GetCount());

            int nRet;

            for (int i = 0; i < smart.GetCount(); i++)
            {
                Debug.WriteLine(smart.GetInfoString(i, CHspSmartDotNet.INFO.MODEL, out nRet));
            }

            Debug.WriteLine(CHspSmartDotNet.INFO_MAX);

            smart.UpdateIdInfo(0);
            smart.UpdateSmartInfo(0);

            int[] nId;
            int[] nStatusFlags;
            int[] nCurVal;
            int[] nWorVal;
            int[] nThrVale;
            long[] llRawValue;

            smart.GetSmartInfo(0, out nId, out nStatusFlags, out nCurVal, out nWorVal, out nThrVale, out llRawValue);

            Debug.WriteLine(nId.Length);

            Debug.WriteLine(smart.GetInfoInt(0, CHspSmartDotNet.INFO.TEMPERATURE, out nRet));

        }
    }
}
