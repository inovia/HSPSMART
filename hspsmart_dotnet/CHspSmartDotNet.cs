using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Windows.Forms;


namespace moe.hsp.hspsmart.dotnet
{
    /// <summary>
    /// http://hsp.moe/#hspsmart
    /// </summary>
    class CHspSmartDotNet
    {

        #region DLL定義

        /// <summary>
        /// DLLのバージョンチェックに使用されます
        /// </summary>
        private const int CHECKDLL_VALUE = 6;

        [DllImport("hspsmart.dll", EntryPoint = "smart_CheckDLL")]
        private static extern int smart_CheckDLL32();
        [DllImport("hspsmart64.dll", EntryPoint = "smart_CheckDLL")]
        private static extern int smart_CheckDLL64();

        [DllImport("hspsmart.dll", EntryPoint = "smart_IsCurrentUserLocalAdministrator")]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool smart_IsCurrentUserLocalAdministrator32();
        [DllImport("hspsmart64.dll", EntryPoint = "smart_IsCurrentUserLocalAdministrator")]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool smart_IsCurrentUserLocalAdministrator64();

        [DllImport("hspsmart.dll", EntryPoint = "smart_Init")]
        private static extern int smart_Init32();
        [DllImport("hspsmart64.dll", EntryPoint = "smart_Init")]
        private static extern int smart_Init64();

        [DllImport("hspsmart.dll", EntryPoint = "smart_UnInit")]
        private static extern int smart_UnInit32(int nSmartIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_UnInit")]
        private static extern int smart_UnInit64(int nSmartIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_DiskScan")]
        private static extern int smart_DiskScan32(int nSmartIdx,
            [MarshalAs(UnmanagedType.Bool)] bool bUseWmi,
            [MarshalAs(UnmanagedType.Bool)] bool bAdvancedDiskSearch,
            [MarshalAs(UnmanagedType.Bool)] out bool pbFlagChangeDisk,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundHD204UI,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundAdataSsd,
            [MarshalAs(UnmanagedType.Bool)] bool bFlagHideNoSmartDisk);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_DiskScan")]
        private static extern int smart_DiskScan64(int nSmartIdx,
            [MarshalAs(UnmanagedType.Bool)] bool bUseWmi,
            [MarshalAs(UnmanagedType.Bool)] bool bAdvancedDiskSearch,
            [MarshalAs(UnmanagedType.Bool)] out bool pbFlagChangeDisk,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundHD204UI,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundAdataSsd,
            [MarshalAs(UnmanagedType.Bool)] bool bFlagHideNoSmartDisk);

        [DllImport("hspsmart.dll", EntryPoint = "smart_DiskScan")]
        private static extern int smart_DiskScan32N(int nSmartIdx,
            [MarshalAs(UnmanagedType.Bool)] bool bUseWmi,
            [MarshalAs(UnmanagedType.Bool)] bool bAdvancedDiskSearch,
            IntPtr pbFlagChangeDisk,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundHD204UI,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundAdataSsd,
            [MarshalAs(UnmanagedType.Bool)] bool bFlagHideNoSmartDisk);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_DiskScan")]
        private static extern int smart_DiskScan64N(int nSmartIdx,
            [MarshalAs(UnmanagedType.Bool)] bool bUseWmi,
            [MarshalAs(UnmanagedType.Bool)] bool bAdvancedDiskSearch,
            IntPtr pbFlagChangeDisk,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundHD204UI,
            [MarshalAs(UnmanagedType.Bool)] bool bWorkaroundAdataSsd,
            [MarshalAs(UnmanagedType.Bool)] bool bFlagHideNoSmartDisk);

        [DllImport("hspsmart.dll", EntryPoint = "smart_CheckDiskStatus")]
        private static extern int smart_CheckDiskStatus32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_CheckDiskStatus")]
        private static extern int smart_CheckDiskStatus64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetCount")]
        private static extern int smart_GetCount32(int nSmartIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetCount")]
        private static extern int smart_GetCount64(int nSmartIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_SetUSB1394")]
        private static extern int smart_SetUSB1394_32(int nSmartIdx, FLAG_USB uMasks);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_SetUSB1394")]
        private static extern int smart_SetUSB1394_64(int nSmartIdx, FLAG_USB uMasks);

        [DllImport("hspsmart.dll", EntryPoint = "smart_SetAtaPassThroughSmart")]
        private static extern int smart_SetAtaPassThroughSmart32(int nSmartIdx, 
            [MarshalAs(UnmanagedType.Bool)] bool bFlag);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_SetAtaPassThroughSmart")]
        private static extern int smart_SetAtaPassThroughSmart64(int nSmartIdx, 
            [MarshalAs(UnmanagedType.Bool)] bool bFlag);

        [DllImport("hspsmart.dll", EntryPoint = "smart_SetCsmiType")]
        private static extern int smart_SetCsmiType32(int nSmartIdx, CSMI_TYPE nCsmiType);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_SetCsmiType")]
        private static extern int smart_SetCsmiType64(int nSmartIdx, CSMI_TYPE nCsmiType);

        [DllImport("hspsmart.dll", EntryPoint = "smart_UpdateIdInfo")]
        private static extern int smart_UpdateIdInfo32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_UpdateIdInfo")]
        private static extern int smart_UpdateIdInfo64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_UpdateSmartInfo")]
        private static extern int smart_UpdateSmartInfo32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_UpdateSmartInfo")]
        private static extern int smart_UpdateSmartInfo64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_IsAdvancedDiskSearch")]
        private static extern int smart_IsAdvancedDiskSearch32(int nSmartIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_IsAdvancedDiskSearch")]
        private static extern int smart_IsAdvancedDiskSearch64(int nSmartIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_IsEnabledWmi")]
        private static extern int smart_IsEnabledWmi32(int nSmartIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_IsEnabledWmi")]
        private static extern int smart_IsEnabledWmi64(int nSmartIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_IsWorkaroundAdataSsd")]
        private static extern int smart_IsWorkaroundAdataSsd32(int nSmartIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_IsWorkaroundAdataSsd")]
        private static extern int smart_IsWorkaroundAdataSsd64(int nSmartIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_IsWorkaroundHD204UI")]
        private static extern int smart_IsWorkaroundHD204UI32(int nSmartIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_IsWorkaroundHD204UI")]
        private static extern int smart_IsWorkaroundHD204UI64(int nSmartIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_DisableAam")]
        private static extern int smart_DisableAam32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_DisableAam")]
        private static extern int smart_DisableAam64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_DisableApm")]
        private static extern int smart_DisableApm32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_DisableApm")]
        private static extern int smart_DisableApm64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_EnableAam")]
        private static extern int smart_EnableAam32(int nSmartIdx, int nDiskIdx, int nValue);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_EnableAam")]
        private static extern int smart_EnableAam64(int nSmartIdx, int nDiskIdx, int nValue);

        [DllImport("hspsmart.dll", EntryPoint = "smart_EnableApm")]
        private static extern int smart_EnableApm32(int nSmartIdx, int nDiskIdx, int nValue);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_EnableApm")]
        private static extern int smart_EnableApm64(int nSmartIdx, int nDiskIdx, int nValue);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetAamValue")]
        private static extern int smart_GetAamValue32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetAamValue")]
        private static extern int smart_GetAamValue64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetApmValue")]
        private static extern int smart_GetApmValue32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetApmValue")]
        private static extern int smart_GetApmValue64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetRecommendAamValue")]
        private static extern int smart_GetRecommendAamValue32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetRecommendAamValue")]
        private static extern int smart_GetRecommendAamValue64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetRecommendApmValue")]
        private static extern int smart_GetRecommendApmValue32(int nSmartIdx, int nDiskIdx);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetRecommendApmValue")]
        private static extern int smart_GetRecommendApmValue64(int nSmartIdx, int nDiskIdx);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetInfoStringW")]
        private static extern int smart_GetInfoStringW32(int nSmartIdx, int nDiskIdx, INFO nInfoType, IntPtr pszInfoStr, int nInfoStrSize);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetInfoStringW")]
        private static extern int smart_GetInfoStringW64(int nSmartIdx, int nDiskIdx, INFO nInfoType, IntPtr pszInfoStr, int nInfoStrSize);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetInfoInt")]
        private static extern int smart_GetInfoInt_32(int nSmartIdx, int nDiskIdx, INFO nInfoType, out int pnInfo);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetInfoInt")]
        private static extern int smart_GetInfoInt_64(int nSmartIdx, int nDiskIdx, INFO nInfoType, out int pnInfo);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetInfoDouble")]
        private static extern int smart_GetInfoDouble32(int nSmartIdx, int nDiskIdx, INFO nInfoType, ref double pdInfo);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetInfoDouble")]
        private static extern int smart_GetInfoDouble64(int nSmartIdx, int nDiskIdx, INFO nInfoType, ref double pdInfo);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetInfoInt64Ex")]
        private static extern int smart_GetInfoInt64Ex_32(int nSmartIdx, int nDiskIdx, INFO nInfoType, ref long pllInfo);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetInfoInt64Ex")]
        private static extern int smart_GetInfoInt64Ex_64(int nSmartIdx, int nDiskIdx, INFO nInfoType, ref long pllInfo);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetSmartInfoInt64Ex")]
        private static extern int smart_GetSmartInfoInt64Ex_32(int nSmartIdx, int nDiskIdx,
            IntPtr nId,
            IntPtr nStatusFlags,
            IntPtr nCurrentValue,
            IntPtr nWorstValue,
            IntPtr nThresholdValue,
            IntPtr llRawValue
            );
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetSmartInfoInt64Ex")]
        private static extern int smart_GetSmartInfoInt64Ex_64(int nSmartIdx, int nDiskIdx,
            IntPtr nId,
            IntPtr nStatusFlags,
            IntPtr nCurrentValue,
            IntPtr nWorstValue,
            IntPtr nThresholdValue,
            IntPtr llRawValue
            );

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetSmartMaxAttribute")]
        private static extern int smart_GetSmartMaxAttribute32();
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetSmartMaxAttribute")]
        private static extern int smart_GetSmartMaxAttribute64();

        [DllImport("hspsmart.dll", EntryPoint = "smart_ShellExecuteExAdminW", CharSet = CharSet.Unicode)]
        private static extern int smart_ShellExecuteExAdminW32(string szFilePath, string szParams);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_ShellExecuteExAdminW", CharSet = CharSet.Unicode)]
        private static extern int smart_ShellExecuteExAdminW64(string szFilePath, string szParams);

        [DllImport("hspsmart.dll", EntryPoint = "smart_ShellExecuteExAdminW", CharSet = CharSet.Unicode)]
        private static extern int smart_ShellExecuteExAdminW_Self_32(IntPtr szFilePath, string szParams);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_ShellExecuteExAdminW", CharSet = CharSet.Unicode)]
        private static extern int smart_ShellExecuteExAdminW_Self_64(IntPtr szFilePath, string szParams);

        [DllImport("hspsmart.dll", EntryPoint = "smart_ShellExecuteExAdminW")]
        private static extern int smart_ShellExecuteExAdminW_SelfSameParams_32(IntPtr szFilePath, IntPtr szParams);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_ShellExecuteExAdminW")]
        private static extern int smart_ShellExecuteExAdminW_SelfSameParams_64(IntPtr szFilePath, IntPtr szParams);

        [DllImport("hspsmart.dll", EntryPoint = "smart_GetInfoMax")]
        private static extern int smart_GetInfoMax32();
        [DllImport("hspsmart64.dll", EntryPoint = "smart_GetInfoMax")]
        private static extern int smart_GetInfoMax64();

        [DllImport("hspsmart.dll", EntryPoint = "smart_SetThreshold")]
        private static extern int smart_SetThreshold32(int nSmartIdx, int nDiskIdx,
            int nThreshold05, int nThresholdC5, int nThresholdC6, int nThresholdFF);
        [DllImport("hspsmart64.dll", EntryPoint = "smart_SetThreshold")]
        private static extern int smart_SetThreshold64(int nSmartIdx, int nDiskIdx,
            int nThreshold05, int nThresholdC5, int nThresholdC6, int nThresholdFF);

        #endregion

        #region 定数値

        /// <summary>
        /// USBコントローラ設定
        /// </summary>
        [Flags]
        public enum FLAG_USB : uint
        {
            /// <summary>
            /// USB接続のHDD/SSDを使用しない。
            /// </summary>
            NULL     = 0,

            /// <summary>
            /// SCSI ATA TRANSLATION 経由でアクセスを試みます
            /// </summary>
            SAT      = 1,

            /// <summary>
            /// Sunplus 製コントローラ対応
            /// </summary>
            SUNPLUS  = 2,

            /// <summary>
            /// I-O DATA 製コントローラ対応
            /// </summary>
            IODATA   = 4,

            /// <summary>
            /// Logitec(旧) 製コントローラ対応
            /// </summary>
            LOGITEC1 = 8,

            /// <summary>
            /// JMicron 製コントローラ対応
            /// </summary>
            JMICRON  = 16,

            /// <summary>
            /// Cypress 製コントローラ対応
            /// </summary>
            CYPRESS  = 32,

            /// <summary>
            /// USB メモリに対しても SCSI ATA TRANSLATION 経由でアクセスを試みます。
            /// </summary>
            MEMORY   = 64,

            /// <summary>
            /// Logitec(新) 製コントローラ対応
            /// </summary>
            LOGITEC2 = 128,

            /// <summary>
            /// NVMe接続 JMicron製コントローラ対応
            /// </summary>
            NVME_JMICRON = 256,

            /// <summary>
            /// NVMe接続 AsMedia製コントローラ対応
            /// </summary>
            NVME_ASMEDIA = 512,

            /// <summary>
            /// NVMe接続 Realtek製コントローラ対応
            /// </summary>
            NVME_REALTEK = 1024,

            /// <summary>
            /// すべて
            /// </summary>
            ALL      = (SAT | SUNPLUS | IODATA | LOGITEC1 | JMICRON | CYPRESS | MEMORY | LOGITEC2 | NVME_JMICRON | NVME_ASMEDIA | NVME_REALTEK)
        }

        /// <summary>
        /// CSMI 設定
        /// </summary>
        public enum CSMI_TYPE : int
        {
            /// <summary>
            /// 無効
            /// </summary>
            DISABLE = 0,

            /// <summary>
            /// 自動検出
            /// </summary>
            ENABLE_AUTO = 1,

            /// <summary>
            /// RAIDディスクのみ有効
            /// </summary>
            ENABLE_RAID = 2,

            /// <summary>
            /// すべて有効
            /// </summary>
            ENABLE_ALL = 3,
        }

        /// <summary>
        /// INFO
        /// </summary>
        public enum INFO : int
        {
            /// <summary>
            /// IDENTIFY_DEVICE 構造体取得
            /// </summary>
            IDENTIFYDEVICE = 0,

            /// <summary>
            /// S.M.A.R.T. データ BYTE配列[512] 取得
            /// </summary>
            SMARTREADDATA = 1,
            
            /// <summary>
            /// S.M.A.R.T. しきい値データ BYTE配列[512] 取得
            /// </summary>
            SMARTREADTHRESHOLD = 2,

            /// <summary>
            /// SMART_ATTRIBUTE 構造体[30]取得(S.M.A.R.T.値)
            /// </summary>
            ATTRIBUTE = 3,

            /// <summary>
            /// SMART_THRESHOLD 構造体[30]取得(S.M.A.R.T.しきい値)
            /// </summary>
            THRESHOLD = 4,

            /// <summary>
            /// S.M.A.R.T.が有効かどうか？(0 = 無効, 1 = 有効)
            /// </summary>
            ISSMARTENABLED = 5,

            /// <summary>
            /// IsIdInfoIncorrect？(0 = No, 1 = Yes)
            /// </summary>
            ISIDINFOINCORRECT = 6,

            /// <summary>
            /// IsSmartCorrect？(0 = No, 1 = Yes)
            /// </summary>
            ISSMARTCORRECT = 7,

            /// <summary>
            /// IsThresholdCorrect？(0 = No, 1 = Yes)
            /// </summary>
            ISTHRESHOLDCORRECT = 8,

            /// <summary>
            /// チェックサムエラーの検出有効？(0 = 無効, 1 = 有効)
            /// </summary>
            ISCHECKSUMERROR = 9,

            /// <summary>
            /// IsWord88？(0 = No, 1 = Yes)
            /// </summary>
            ISWORD88 = 10,

            /// <summary>
            /// IsWord64_76？(0 = No, 1 = Yes)
            /// </summary>
            ISWORD64_76 = 11,

            /// <summary>
            /// IsRawValues8？(0 = No, 1 = Yes)
            /// </summary>
            ISRAWVALUES8 = 12,

            /// <summary>
            /// IsRawValues7？(0 = No, 1 = Yes)
            /// </summary>
            ISRAWVALUES7 = 13,

            /// <summary>
            /// 9126MBかどうか？(HDD容量の壁？)(0 = No, 1 = Yes)
            /// </summary>
            IS9126MB = 14,

            /// <summary>
            /// 特定機種のファームバグ検出？(0 = No, 1 = Yes)
            /// </summary>
            ISTHRESHOLDBUG = 15,

            /// <summary>
            /// S.M.A.R.T.をサポートしているかどうか？(0 = No, 1 = Yes)
            /// </summary>
            ISSMARTSUPPORTED = 16,
            
            /// <summary>
            /// LBA48対応？(0 = No, 1 = Yes)
            /// </summary>
            ISLBA48SUPPORTED = 17,

            /// <summary>
            /// AAM対応？(0 = No, 1 = Yes)
            /// </summary>
            ISAAMSUPPORTED = 18,
            
            /// <summary>
            /// APM対応？(0 = No, 1 = Yes)
            /// </summary>
            ISAPMSUPPORTED = 19,

            /// <summary>
            /// AAM有効？(0 = 無効, 1 = 有効)
            /// </summary>
            ISAAMENABLED = 20,
            
            /// <summary>
            /// APM有効？(0 = 無効, 1 = 有効)
            /// </summary>
            ISAPMENABLED = 21,

            /// <summary>
            /// NCQ対応？(0 = No, 1 = Yes)
            /// </summary>
            ISNCQSUPPORTED = 22,

            /// <summary>
            /// NVキャッシュをサポートしてる？(0 = No, 1 = Yes)
            /// </summary>
            ISNVCACHESUPPORTED = 23,

            /// <summary>
            /// MaxtorMinute(0 = No, 1 = Yes)
            /// </summary>
            ISMAXTORMINUTE = 24,

            /// <summary>
            /// SSDかどうか？ (0 = No, 1 = Yes)
            /// </summary>
            ISSSD = 25,

            /// <summary>
            /// SSDがTrimをサポートしているか？(0 = No, 1 = Yes)
            /// </summary>
            ISTRIMSUPPORTED = 26,

            /// <summary>
            /// 物理ドライブID
            /// </summary>
            PHYSICALDRIVEID = 27,

            /// <summary>
            /// SCSIポート
            /// </summary>
            SCSIPORT = 28,

            /// <summary>
            /// SCSIターゲットID
            /// </summary>
            SCSITARGETID = 29,

            /// <summary>
            /// SCSIバス
            /// </summary>
            SCSIBUS = 30,
            
            /// <summary>
            /// Silicon Image Controller タイプ
            /// </summary>
            SILICONIMAGETYPE = 31,

            /// <summary>
            /// 合計ディスクサイズ
            /// </summary>
            TOTALDISKSIZE = 32,

            /// <summary>
            /// シリンダー数
            /// </summary>
            CYLINDER = 33,

            /// <summary>
            /// ヘッド数
            /// </summary>
            HEAD = 34,

            /// <summary>
            /// セクタ数
            /// </summary>
            SECTOR = 35,

            /// <summary>
            /// セクタ数(LBA28)
            /// </summary>
            SECTOR28 = 36,

            /// <summary>
            /// セクタ数(LBA48)
            /// </summary>
            SECTOR48 = 37,

            /// <summary>
            /// セクタの数
            /// </summary>
            NUMBEROFSECTORS = 38,

            /// <summary>
            /// CHSで取得したディスクサイズ
            /// </summary>
            DISKSIZECHS = 39,

            /// <summary>
            /// LBA28で取得したディスクサイズ
            /// </summary>
            DISKSIZELBA28 = 40,

            /// <summary>
            /// LBA48で取得したディスクサイズ
            /// </summary>
            DISKSIZELBA48 = 41,

            /// <summary>
            /// WMIで取得したディスクサイズ
            /// </summary>
            DISKSIZEWMI = 42,

            /// <summary>
            /// バッファサイズ
            /// </summary>
            BUFFERSIZE = 43,

            /// <summary>
            /// NVキャッシュのサイズ
            /// </summary>
            NVCACHESIZE = 44,

            /// <summary>
            /// 転送モード(戻り値はTRANSFER_MODE参照)
            /// </summary>
            TRANSFERMODETYPE = 45,

            /// <summary>
            /// Measured Time(使用時間)単位(戻り値はPOWER_ON参照)
            /// </summary>
            DETECTEDTIMEUNITTYPE = 46,

            /// <summary>
            /// Detected Time(検出時間)単位(戻り値はPOWER_ON参照)
            /// </summary>
            MEASUREDTIMEUNITTYPE = 47,

            /// <summary>
            /// S.M.A.R.T.の項目数(最大30)
            /// </summary>
            ATTRIBUTECOUNT = 48,

            /// <summary>
            /// 使用時間
            /// </summary>
            DETECTEDPOWERONHOURS = 49,

            /// <summary>
            /// 検出時間
            /// </summary>
            MEASUREDPOWERONHOURS = 50,

            /// <summary>
            /// 使用時間生の値
            /// </summary>
            POWERONRAWVALUE = 51,

            /// <summary>
            /// 使用開始時間生の値
            /// </summary>
            POWERONSTARTRAWVALUE = 52,

            /// <summary>
            /// 電源投入回数
            /// </summary>
            POWERONCOUNT = 53,

            /// <summary>
            /// 温度
            /// </summary>
            TEMPERATURE = 54,

            /// <summary>
            /// 温度で使用する倍数値(通常1.0)
            /// </summary>
            TEMPERATUREMULTIPLIER = 55,

            /// <summary>
            /// 回転数(5400RPMとか7200RPMなど)
            /// </summary>
            NOMINALMEDIAROTATIONRATE = 56,

            /// <summary>
            /// 総書込量 (ホスト)
            /// </summary>
            HOSTWRITES = 57,

            /// <summary>
            /// 総読込量 (ホスト)
            /// </summary>
            HOSTREADS = 58,

            /// <summary>
            /// 消去データ量(GB単位)
            /// </summary>
            GBYTESERASED = 59,

            /// <summary>
            /// 総書込量 (NAND)
            /// </summary>
            NANDWRITES = 60,

            /// <summary>
            /// ウェアレベリング回数
            /// </summary>
            WEARLEVELINGCOUNT = 61,

            /// <summary>
            /// 寿命
            /// </summary>
            LIFE = 62,

            /// <summary>
            /// メジャー
            /// </summary>
            MAJOR = 63,

            /// <summary>
            /// マイナー
            /// </summary>
            MINOR = 64,

            /// <summary>
            /// ディスクステータス(CheckDiskStatus()で取得できる値と同じ)
            /// </summary>
            DISKSTATUS = 65,

            /// <summary>
            /// ドライブレターマップ
            /// </summary>
            DRIVELETTERMAP = 66,

            /// <summary>
            /// 警報温度
            /// </summary>
            ALARMTEMPERATURE = 67,

            /// <summary>
            /// 警報健康状態
            /// </summary>
            ALARMHEALTHSTATUS = 68,

            /// <summary>
            /// インターフェース(INTERFACE_TYPEを参照)
            /// </summary>
            INTERFACETYPE = 69,

            /// <summary>
            /// コマンドタイプ(CMD_TYPEを参照)
            /// </summary>
            COMMANDTYPE = 70,

            /// <summary>
            /// ディスクベンダーID
            /// </summary>
            DISKVENDORID = 71,

            /// <summary>
            /// USBベンダーID
            /// </summary>
            USBVENDORID2 = 72,
            
            /// <summary>
            /// USBプロダクトID
            /// </summary>
            USBPRODUCTID2 = 73,

            /// <summary>
            /// ？
            /// </summary>
            TARGET = 74,

            /// <summary>
            /// 注意と判定する05 代替処理済セクタ数(0～255)
            /// </summary>
            THRESHOLD05 = 75,

            /// <summary>
            /// 注意と判定するC5 代替処理保留中セクタ数(0～255)
            /// </summary>
            THRESHOLDC5 = 76,

            /// <summary>
            /// 注意と判定するC6 回復不能セクタ数(0～255)
            /// </summary>
            THRESHOLDC6 = 77,

            /// <summary>
            /// SASPHYENTITY
            /// </summary>
            SASPHYENTITY = 78,

            /// <summary>
            /// シリアルナンバー
            /// </summary>
            SERIALNUMBER = 79,

            /// <summary>
            /// シリアルナンバーを逆転したもの
            /// </summary>
            SERIALNUMBERREVERSE = 80,

            /// <summary>
            /// ファームウェアのレヴィジョン
            /// </summary>
            FIRMWAREREV = 81,

            /// <summary>
            /// ファームウェアのレヴィジョンを逆転したもの
            /// </summary>
            FIRMWAREREVREVERSE = 82,

            /// <summary>
            /// モデル名
            /// </summary>
            MODEL = 83,

            /// <summary>
            /// モデル名を逆転したもの
            /// </summary>
            MODELREVERSE = 84,

            /// <summary>
            /// WMIから取得したモデル名
            /// </summary>
            MODELWMI = 85,

            /// <summary>
            /// モデルシリアル
            /// </summary>
            MODELSERIAL = 86,

            /// <summary>
            /// ドライブマップ(C: D: とか)
            /// </summary>
            DRIVEMAP = 87,

            /// <summary>
            /// 最大転送モード
            /// </summary>
            MAXTRANSFERMODE = 88,

            /// <summary>
            /// 現在の転送モード
            /// </summary>
            CURRENTTRANSFERMODE = 89,

            /// <summary>
            /// メジャーバージョン
            /// </summary>
            MAJORVERSION = 90,

            /// <summary>
            /// マイナーバージョン
            /// </summary>
            MINORVERSION = 91,

            /// <summary>
            /// インターフェース(SATAとか)
            /// </summary>
            INTERFACE = 92,

            /// <summary>
            /// ディスクエンクロージャ
            /// </summary>
            ENCLOSURE = 93,

            /// <summary>
            /// コマンドタイプ
            /// </summary>
            COMMANDTYPESTRING = 94,

            /// <summary>
            /// SSDベンダー名
            /// </summary>
            SSDVENDORSTRING = 95,

            /// <summary>
            /// フォームファクタ(2.5インチとか3.5インチ)
            /// </summary>
            DEVICENOMINALFORMFACTOR = 96,

            /// <summary>
            /// PnpDeviceId
            /// </summary>
            PNPDEVICEID = 97,

            /// <summary>
            /// S.M.A.R.T.項目名抽出用キー名
            /// </summary>
            SMARTKEYNAME = 98,

            /// <summary>
            /// 注意と判定するFF 残り寿命(0～255)
            /// </summary>
            THRESHOLDFF = 99,

            /// <summary>
            /// DevSleepに対応しているか？
            /// </summary>
            ISDEVICESLEEPSUPPORTED = 100,

            /// <summary>
            /// ホストの読み書き単位？(HOST_READS_WRITESを参照)
            /// </summary>
            HOSTREADSWRITESUNIT = 101,

            /// <summary>
            /// NVMeかどうか
            /// </summary>
            INFO_ISNVME = 102,

            /// <summary>
            /// UASPかどうか
            /// </summary>
            INFO_ISUASP = 103,

            /// <summary>
            /// LogicalSectorSize
            /// </summary>
            INFO_IS_LOGICALSECTORSIZE = 104

        }

        /// <summary>
        /// INFO最大数
        /// </summary>
        public static readonly int INFO_MAX = Enum.GetNames(typeof(INFO)).Length;

        /// <summary>
        /// TRANSFER_MODE
        /// </summary>
        public enum TRANSFER_MODE : int
        {
            /// <summary>
            /// 不明
            /// </summary>
            UNKNOWN 		= 0,	 // 

            /// <summary>
            /// PIOモード
            /// </summary>
            PIO		    = 1,	 // 

            /// <summary>
            /// PIO/DMAモード
            /// </summary>
            PIO_DMA		= 2,	 // 

            /// <summary>
            /// UltraDMA16モード
            /// </summary>
            ULTRA_DMA_16	= 3,	 // 

            /// <summary>
            /// UltraDMA25モード
            /// </summary>
            ULTRA_DMA_25	= 4,	 // 

            /// <summary>
            /// UltraDMA33モード
            /// </summary>
            ULTRA_DMA_33	= 5,	 // 

            /// <summary>
            /// UltraDMA44モード
            /// </summary>
            ULTRA_DMA_44	= 6,	 // 

            /// <summary>
            /// UltraDMA66モード
            /// </summary>
            ULTRA_DMA_66	= 7,	 // 

            /// <summary>
            /// UltraDMA100モード
            /// </summary>
            ULTRA_DMA_100	= 8,	 // 

            /// <summary>
            /// UltraDMA133モード
            /// </summary>
            ULTRA_DMA_133	= 9,	 // 

            /// <summary>
            /// SATA/150モード
            /// </summary>
            SATA_150		= 10,	 // 

            /// <summary>
            /// SATA/300モード
            /// </summary>
            SATA_300		= 11,	 // 

            /// <summary>
            /// SATA/600モード
            /// </summary>
            SATA_600		= 12,	 // 
        }

        /// <summary>
        /// POWER_ON
        /// </summary>
        public enum POWER_ON : int
        {
            /// <summary>
            /// 不明
            /// </summary>
           UNKNOWN	 = 0,	// 

            /// <summary>
            /// 1時間単位
            /// </summary>
            HOURS		 = 1,	// 

            /// <summary>
            /// 1分間単位
            /// </summary>
            MINUTES	 = 2,	// 

            /// <summary>
            /// 30秒単位
            /// </summary>
            HALF_MINUTES	 = 3,	// 

            /// <summary>
            /// 1秒単位
            /// </summary>
            SECONDS	 = 4,	// 

            /// <summary>
            /// 10分単位
            /// </summary>
            _10_MINUTES	 = 5,	// 

            /// <summary>
            /// 1ミリ秒単位
            /// </summary>
            MILLI_SECONDS	 = 6,	// 
        }

        /// <summary>
        /// インタフェース種別
        /// </summary>
        public enum INTERFACE_TYPE : int
        {
            /// <summary>
            /// 不明
            /// </summary>
            UNKNOWN = 0,

            /// <summary>
            /// パラレルATA/IDE
            /// </summary>
            PATA = 1,

            /// <summary>
            /// シリアルATA
            /// </summary>
            SATA = 2,

            /// <summary>
            /// USB
            /// </summary>
            USB = 3,

            /// <summary>
            /// IEEE1394
            /// </summary>
            IEEE1394 = 4,

            /// <summary>
            /// UASP(USB Attached SCSI Protocol)
            /// </summary>
            [Obsolete("IsUaspを使用してください", true)]
            UASP = 5,

            /// <summary>
            /// SCSI
            /// </summary>
            SCSI = 5,

            /// <summary>
            /// NVMe
            /// </summary>
            NVME = 6,

            /// <summary>
            /// USB NVMe
            /// </summary>
            [Obsolete("IsNVMeを使用してください", true)]
            USB_UASP = 7,
        }

        /// <summary>
        /// CMD_TYPE
        /// </summary>
        public enum CMD_TYPE : int
        {
            UNKNOWN = 0,
            PHYSICAL_DRIVE = 1,
            SCSI_MINIPORT = 2,
            SILICON_IMAGE = 3,
            SAT = 4,	                    // SAT = SCSI_ATA_TRANSLATION
            SUNPLUS = 5,
            IO_DATA = 6,
            LOGITEC1 = 7,
            LOGITEC2 = 8,
            JMICRON = 9,
            CYPRESS = 10,
            [Obsolete("",true)]
            PROLIFIC = 11,	                // Not imprement
            SAT_ASM1352R = 11,	            // AMS1352 2nd drive
            CSMI = 12,	                    // CSMI = Common Storage Management Interface 
            CSMI_PHYSICAL_DRIVE = 13,	    // CSMI = Common Storage Management Interface 
            WMI = 14,
            NVME_SAMSUNG = 15,
            NVME_INTEL = 16,
            NVME_STORAGE_QUERY = 17,
            NVME_JMICRON = 18,
            NVME_ASMEDIA = 19,
            NVME_REALTEK = 20,
            NVME_INTEL_RST = 21,
            DEBUG = 22,
        }

        /// <summary>
        /// HOST_READS_WRITES
        /// </summary>
        public enum HOST_READS_WRITES : int
        {
            UNKNOWN = 0,
            _512B = 1,
            _32MB = 2,
            _GB = 3,
        }

#endregion

        /// <summary>
        /// HSPSMART管理識別子
        /// </summary>
        private int m_nSmartIdx = -1;

        /// <summary>
        /// デフォルトコンストラクタ 
        /// (DLLバージョン強制チェック)
        /// </summary>
        public CHspSmartDotNet() : this(true)
        {
            // 
        }

        /// <summary>
        /// コンストラクタ
        /// </summary>
        /// <param name="bCheckDLL">DLLのバージョンをチェックするか</param>
        public CHspSmartDotNet(bool bCheckDLL)
        {
            if ( bCheckDLL)
            {
                if ( CHECKDLL_VALUE < CheckDLL() )
                {
                    if ( DialogResult.No == MessageBox.Show(
                        "新しいバージョンのHSPSMART.DLLを呼び出しています。\n" +
                        "ファイルを確認してください。\n" +
                        "無視して続行可能です。続行する場合は「はい」を選択してください。",
                        "HSPSMART.NET", MessageBoxButtons.YesNo, MessageBoxIcon.Error))
                    {
                        throw new Exception("HSPSmartOldDefFileException");
                    }
                }

                if ( CheckDLL() < CHECKDLL_VALUE )
                {
                    if ( DialogResult.No == MessageBox.Show(
                        "古いバージョンのHSPSMART.DLLを呼び出しています。\n" +
                        "ファイルを確認してください。\n" +
                        "無視して続行可能です。続行する場合は「はい」を選択してください。",
                        "HSPSMART.NET", MessageBoxButtons.YesNo, MessageBoxIcon.Error))
                    {
                        throw new Exception("HSPSmartOldDllException");
                    }
                }
            }

            // 初期化
            m_nSmartIdx = (Is64Bit()) ? smart_Init64() : smart_Init32();
            if (m_nSmartIdx < 0)
            {
                throw new Exception("HSPSmartInternalException");
            }

        }

        /// <summary>
        /// デストラクタ
        /// </summary>
        ~CHspSmartDotNet()
        {
            if (0 <= m_nSmartIdx)
            {
                int nRet = (Is64Bit()) ? smart_UnInit64(m_nSmartIdx) : smart_UnInit32(m_nSmartIdx);
                m_nSmartIdx = -1;
            }
        }

        /// <summary>
        /// ディスクを検出します
        /// </summary>
        /// <param name="pbFlagChangeDisk">ChangeDiskフラグ</param>
        /// <param name="bUseWmi">WMIを使用するか</param>
        /// <param name="bAdvancedDiskSearch">アドバンスドディスクサーチを使用するか</param>
        /// <param name="bWorkaroundHD204UI">サムスン HD155UI/HD204UIの不具合回避機能を使用するか</param>
        /// <param name="bWorkaroundAdataSsd">ADATA SSD S599のFW 3.4.6の不具合回避機能を使用するか</param>
        /// <param name="bFlagHideNoSmartDisk">S.M.A.R.T.に対応していないディスクを隠すか</param>
        /// <returns></returns>
        public int DiskScan(
            out bool pbFlagChangeDisk, 
            bool bUseWmi = true, 
            bool bAdvancedDiskSearch = true, 
            bool bWorkaroundHD204UI = true, 
            bool bWorkaroundAdataSsd = true, 
            bool bFlagHideNoSmartDisk = false
            )
        {
            return (Is64Bit()) ? 
                smart_DiskScan64(m_nSmartIdx, bUseWmi, bAdvancedDiskSearch,
                    out pbFlagChangeDisk, bWorkaroundHD204UI, bWorkaroundAdataSsd, bFlagHideNoSmartDisk) : 
                smart_DiskScan32(m_nSmartIdx, bUseWmi, bAdvancedDiskSearch, 
                    out pbFlagChangeDisk, bWorkaroundHD204UI, bWorkaroundAdataSsd, bFlagHideNoSmartDisk);
        }

        /// <summary>
        /// ディスクを検出します
        /// </summary>
        /// <param name="bUseWmi">WMIを使用するか</param>
        /// <param name="bAdvancedDiskSearch">アドバンスドディスクサーチを使用するか</param>
        /// <param name="bWorkaroundHD204UI">サムスン HD155UI/HD204UIの不具合回避機能を使用するか</param>
        /// <param name="bWorkaroundAdataSsd">ADATA SSD S599のFW 3.4.6の不具合回避機能を使用するか</param>
        /// <param name="bFlagHideNoSmartDisk">S.M.A.R.T.に対応していないディスクを隠すか</param>
        /// <returns></returns>
        public int DiskScan(
            bool bUseWmi = true,
            bool bAdvancedDiskSearch = true,
            bool bWorkaroundHD204UI = true,
            bool bWorkaroundAdataSsd = true,
            bool bFlagHideNoSmartDisk = false
            )
        {
            return (Is64Bit()) ? 
                smart_DiskScan64N(m_nSmartIdx, bUseWmi, bAdvancedDiskSearch,
                    IntPtr.Zero, bWorkaroundHD204UI, bWorkaroundAdataSsd, bFlagHideNoSmartDisk) : 
                smart_DiskScan32N(m_nSmartIdx, bUseWmi, bAdvancedDiskSearch, 
                    IntPtr.Zero, bWorkaroundHD204UI, bWorkaroundAdataSsd, bFlagHideNoSmartDisk);
        }

        /// <summary>
        /// ディスクのステータスを取得
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns>
        /// 戻り値は以下のようになります。
        /// 0  = ディスクステータス不明
        /// 1  = ディスクステータス通常
        /// 2  = ディスクステータス注意
        /// 3  = ディスクステータス異常
        /// -1 = 操作ハンドル無効
        /// </returns>
        public int CheckDiskStatus(
            int nDiskIdx
            )
        {
            return (Is64Bit()) ? 
                smart_CheckDiskStatus64(m_nSmartIdx, nDiskIdx) : 
                smart_CheckDiskStatus32(m_nSmartIdx, nDiskIdx) ;
        }

        /// <summary>
        /// 検出されたディスクの数を取得します
        /// </summary>
        /// <returns></returns>
        public int GetCount()
        {
            return (Is64Bit()) ?
                smart_GetCount64(m_nSmartIdx) : smart_GetCount32(m_nSmartIdx);
        }

        /// <summary>
        /// USB/IEEE1394接続の外付けディスクを検出対象にする
        /// </summary>
        /// <param name="uMasks">検出対象コントローラ（フラグOR指定可）</param>
        /// <returns></returns>
        public int SetUSB1394(FLAG_USB uMasks)
        {
            return (Is64Bit()) ?
                smart_SetUSB1394_64(m_nSmartIdx, uMasks) : smart_SetUSB1394_32(m_nSmartIdx, uMasks);
        }

        /// <summary>
        /// IDE/ATA_PASS_THROUGH を使用します
        /// </summary>
        /// <param name="bFlag">IDE/ATA_PASS_THROUGHを使用するか</param>
        /// <returns></returns>
        public int SetAtaPassThroughSmart(bool bFlag)
        {
            return (Is64Bit()) ?
                smart_SetAtaPassThroughSmart64(m_nSmartIdx, bFlag) : smart_SetAtaPassThroughSmart32(m_nSmartIdx, bFlag);
        }

        /// <summary>
        /// CSMIを使用するかどうか
        /// </summary>
        /// <param name="nCsmiType">CSMIフラグ</param>
        /// <returns></returns>
        public int SetCsmiType(CSMI_TYPE nCsmiType)
        {
            return (Is64Bit()) ?
                smart_SetCsmiType64(m_nSmartIdx, nCsmiType) : smart_SetCsmiType32(m_nSmartIdx, nCsmiType);
        }

        /// <summary>
        /// ディスクの情報を更新(S.M.A.R.T.以外)
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int UpdateIdInfo(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_UpdateIdInfo64(m_nSmartIdx, nDiskIdx) : smart_UpdateIdInfo32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// ディスクのS.M.A.R.T.情報を更新
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int UpdateSmartInfo(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_UpdateSmartInfo64(m_nSmartIdx, nDiskIdx) : smart_UpdateSmartInfo32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// アドバンスドディスクサーチが有効かどうか
        /// </summary>
        public int IsAdvancedDiskSearch
        {
            get
            {
                return (Is64Bit()) ?
                    smart_IsAdvancedDiskSearch64(m_nSmartIdx) : smart_IsAdvancedDiskSearch32(m_nSmartIdx);
            }
        }

        /// <summary>
        /// WMIを使用して取得するかどうか
        /// </summary>
        public int IsEnabledWmi
        {
            get
            {
                return (Is64Bit()) ?
                    smart_IsEnabledWmi64(m_nSmartIdx) : smart_IsEnabledWmi32(m_nSmartIdx);
            }
        }

        /// <summary>
        /// ADATA製SSD不具合回避機能が有効かどうか
        /// </summary>
        public int IsWorkaroundAdataSsd
        {
            get
            {
                return (Is64Bit()) ?
                    smart_IsWorkaroundAdataSsd64(m_nSmartIdx) : smart_IsWorkaroundAdataSsd32(m_nSmartIdx);
            }
        }

        /// <summary>
        /// サムスン HD155UI/HD204UIの不具合回避機能が有効かどうか
        /// </summary>
        public int IsWorkaroundHD204UI
        {
            get
            {
                return (Is64Bit()) ?
                    smart_IsWorkaroundHD204UI64(m_nSmartIdx) : smart_IsWorkaroundHD204UI32(m_nSmartIdx);
            }
        }

        /// <summary>
        /// AAMを無効化します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int DisableAam(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_DisableAam64(m_nSmartIdx, nDiskIdx) : smart_DisableAam32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// APMを無効化します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int DisableApm(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_DisableApm64(m_nSmartIdx, nDiskIdx) : smart_DisableApm32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// AAMを有効化します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nValue">AAMの値(128～254)</param>
        /// <returns></returns>
        public int EnableAam(int nDiskIdx, int nValue)
        {
            return (Is64Bit()) ?
                smart_EnableAam64(m_nSmartIdx, nDiskIdx, nValue) : smart_EnableAam32(m_nSmartIdx, nDiskIdx, nValue);
        }

        /// <summary>
        /// APMを有効化します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nValue">APMの値(1～254)</param>
        /// <returns></returns>
        public int EnableApm(int nDiskIdx, int nValue)
        {
            return (Is64Bit()) ?
                smart_EnableApm64(m_nSmartIdx, nDiskIdx, nValue) : smart_EnableApm32(m_nSmartIdx, nDiskIdx, nValue);
        }

        /// <summary>
        /// AAMの現在値を取得します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int GetAamValue(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_GetAamValue64(m_nSmartIdx, nDiskIdx) : smart_GetAamValue32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// APMの現在値を取得します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int GetApmValue(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_GetApmValue64(m_nSmartIdx, nDiskIdx) : smart_GetApmValue32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// AAMのメーカー推奨値を取得します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int GetRecommendAamValue(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_GetRecommendAamValue64(m_nSmartIdx, nDiskIdx) : smart_GetRecommendAamValue32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// APMのメーカー推奨値を取得します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <returns></returns>
        public int GetRecommendApmValue(int nDiskIdx)
        {
            return (Is64Bit()) ?
                smart_GetRecommendApmValue64(m_nSmartIdx, nDiskIdx) : smart_GetRecommendApmValue32(m_nSmartIdx, nDiskIdx);
        }

        /// <summary>
        /// ディスクの情報を取得(文字列型)
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nInfoType">取得したいディスク情報ID</param>
        /// <param name="nRet">エラーなどの戻り値</param>
        /// <returns>ディスク情報(文字列型)</returns>
        public string GetInfoString(int nDiskIdx, INFO nInfoType, out int nRet)
        {
            // 初回はサイズのみ取得
            nRet = 0;
            if (Is64Bit())
            {
                nRet = smart_GetInfoStringW64(m_nSmartIdx, nDiskIdx, nInfoType, IntPtr.Zero, 0);
            }
            else
            {
                nRet = smart_GetInfoStringW32(m_nSmartIdx, nDiskIdx, nInfoType, IntPtr.Zero, 0);
            }

            // 正常
            if (0 < nRet)
            {
                IntPtr ptr = Marshal.AllocHGlobal(nRet * 2);
                if (Is64Bit())
                {
                    nRet = smart_GetInfoStringW64(m_nSmartIdx, nDiskIdx, nInfoType, ptr, nRet);
                }
                else
                {
                    nRet = smart_GetInfoStringW32(m_nSmartIdx, nDiskIdx, nInfoType, ptr, nRet);
                }

                string strInfo = Marshal.PtrToStringUni(ptr);
                
                Marshal.FreeHGlobal(ptr);

                return strInfo;
            }

            return "";
        }

        /// <summary>
        /// ディスクの情報を取得(32bit整数型)
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nInfoType">取得したいディスク情報ID</param>
        /// <param name="nRet">エラーなどの戻り値</param>
        /// <returns>ディスク情報(32bit整数型)</returns>
        public int GetInfoInt(int nDiskIdx, INFO nInfoType, out int nRet)
        {
            nRet = 0;
            int nInfo = 0;
            if (Is64Bit())
            {
                 nRet = smart_GetInfoInt_64(m_nSmartIdx, nDiskIdx, nInfoType, out nInfo);
            }
            else
            {
                nRet = smart_GetInfoInt_32(m_nSmartIdx, nDiskIdx, nInfoType, out nInfo);
            }

            return nInfo;
        }

        /// <summary>
        /// ディスクの情報を取得(浮動小数点(64bit)型)
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nInfoType">取得したいディスク情報ID</param>
        /// <param name="nRet">エラーなどの戻り値</param>
        /// <returns>ディスク情報(浮動小数点(64bit)型)</returns>
        public double GetInfoDouble(int nDiskIdx, INFO nInfoType, out int nRet)
        {
            nRet = 0;
            double dInfo = 0;
            if (Is64Bit())
            {
                nRet = smart_GetInfoDouble64(m_nSmartIdx, nDiskIdx, nInfoType, ref dInfo);
            }
            else
            {
                nRet = smart_GetInfoDouble32(m_nSmartIdx, nDiskIdx, nInfoType, ref dInfo);
            }

            return dInfo;
        }

        /// <summary>
        /// ディスクの情報を取得(64it整数型)
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nInfoType">取得したいディスク情報ID</param>
        /// <param name="nRet">エラーなどの戻り値</param>
        /// <returns>ディスク情報(64it整数型)</returns>
        public long GetInfoInt64(int nDiskIdx, INFO nInfoType, out int nRet)
        {
            nRet = 0;
            long llInfo = 0;
            if (Is64Bit())
            {
                nRet = smart_GetInfoInt64Ex_64(m_nSmartIdx, nDiskIdx, nInfoType, ref llInfo);
            }
            else
            {
                nRet = smart_GetInfoInt64Ex_32(m_nSmartIdx, nDiskIdx, nInfoType, ref llInfo);
            }

            return llInfo;
        }

        /// <summary>
        /// ディスクの情報を取得(構造体型)
        /// </summary>
        /// <returns></returns>
        private int GetInfoStruct()
        {
            // TODO: 未実装
            throw new NotImplementedException();
        }

        /// <summary>
        /// S.M.A.R.T. 情報を取得します
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nId">S.M.A.R.T. ID を格納する配列変数</param>
        /// <param name="nStatusFlags">ステータスフラグを格納する配列変数</param>
        /// <param name="nCurrentValue">現在値を格納する配列変数</param>
        /// <param name="nWorstValue">最悪値を格納する配列変数</param>
        /// <param name="nThresholdValue">しきい値を格納する配列変数</param>
        /// <param name="llRawValue">生の値を格納する配列変数</param>
        /// <returns></returns>
        public int GetSmartInfo(int nDiskIdx, out int[] nId,
            out int[] nStatusFlags, out int[] nCurrentValue, out int[] nWorstValue,
            out int[] nThresholdValue, out long[] llRawValue)
        {

            // 最大要素数
            int nMAX = GetSmartMaxAttribute();

            // 初期化
            nId = new int[nMAX];
            nStatusFlags = new int[nMAX];
            nCurrentValue = new int[nMAX];
            nWorstValue = new int[nMAX];
            nThresholdValue = new int[nMAX];
            llRawValue = new long[nMAX];

            IntPtr p_nId = Marshal.AllocCoTaskMem(Marshal.SizeOf(typeof(int)) * nMAX);
            IntPtr p_nStatusFlags = Marshal.AllocCoTaskMem(Marshal.SizeOf(typeof(int)) * nMAX);
            IntPtr p_nCurrentValue = Marshal.AllocCoTaskMem(Marshal.SizeOf(typeof(int)) * nMAX);
            IntPtr p_nWorstValue = Marshal.AllocCoTaskMem(Marshal.SizeOf(typeof(int)) * nMAX);
            IntPtr p_nThresholdValue = Marshal.AllocCoTaskMem(Marshal.SizeOf(typeof(int)) * nMAX);
            IntPtr p_llRawValue = Marshal.AllocCoTaskMem(Marshal.SizeOf(typeof(long)) * nMAX);

            int nRet = (Is64Bit()) ?
                smart_GetSmartInfoInt64Ex_64(m_nSmartIdx, nDiskIdx, p_nId,
                    p_nStatusFlags, p_nCurrentValue, p_nWorstValue, p_nThresholdValue, p_llRawValue) :
                smart_GetSmartInfoInt64Ex_32(m_nSmartIdx, nDiskIdx, p_nId,
                    p_nStatusFlags, p_nCurrentValue, p_nWorstValue, p_nThresholdValue, p_llRawValue) ;

            Marshal.Copy(p_nId, nId, 0, nMAX);
            Marshal.Copy(p_nStatusFlags, nStatusFlags, 0, nMAX);
            Marshal.Copy(p_nCurrentValue, nCurrentValue, 0, nMAX);
            Marshal.Copy(p_nWorstValue, nWorstValue, 0, nMAX);
            Marshal.Copy(p_nThresholdValue, nThresholdValue, 0, nMAX);
            Marshal.Copy(p_llRawValue, llRawValue, 0, nMAX);

            Marshal.FreeCoTaskMem(p_nId);
            Marshal.FreeCoTaskMem(p_nStatusFlags);
            Marshal.FreeCoTaskMem(p_nCurrentValue);
            Marshal.FreeCoTaskMem(p_nWorstValue);
            Marshal.FreeCoTaskMem(p_nThresholdValue);
            Marshal.FreeCoTaskMem(p_llRawValue);

            return nRet;
        }

        /// <summary>
        /// S.M.A.R.T.の項目の最大数取得(現状常に30を返します)
        /// </summary>
        /// <remarks>S.M.A.R.T.の項目数を取得する場合は、GetInfoIntのINFO.ATTRIBUTECOUNTを呼び出してください。</remarks>
        /// <returns></returns>
        public int GetSmartMaxAttribute()
        {
            return (Is64Bit()) ?
                smart_GetSmartMaxAttribute64() :
                smart_GetSmartMaxAttribute32() ;
        }

        /// <summary>
        /// 健康状態の基準値(閾値)を指定
        /// </summary>
        /// <param name="nDiskIdx">ディスク番号</param>
        /// <param name="nThreshold05">05 代替処理済セクタ数(0～255, -1 を指定すると無視されます)</param>
        /// <param name="nThresholdC5">C5 代替処理保留中セクタ数(0～255, -1 を指定すると無視されます)</param>
        /// <param name="nThresholdC6">C6 回復不能セクタ数(0～255, -1 を指定すると無視されます)</param>
        /// <param name="nThresholdFF">FF 残り寿命(0～255, -1 を指定すると無視されます)</param>
        /// <returns></returns>
        public int SetThreshold(int nDiskIdx, int nThreshold05, int nThresholdC5, int nThresholdC6, int nThresholdFF)
        {
            return (Is64Bit()) ?
                smart_SetThreshold64(m_nSmartIdx, nDiskIdx, nThreshold05, nThresholdC5, nThresholdC6, nThresholdFF) :
                smart_SetThreshold32(m_nSmartIdx, nDiskIdx, nThreshold05, nThresholdC5, nThresholdC6, nThresholdFF) ;
        }

        #region Static関数

        /// <summary>
        /// DLLのバージョンを取得します。
        /// </summary>
        /// <returns></returns>
        public static int CheckDLL()
        {
            return Is64Bit() ? smart_CheckDLL64() : smart_CheckDLL32();
        }

        /// <summary>
        /// CHspSmartDotNet.cs 側のバージョンを取得します。
        /// </summary>
        /// <returns></returns>
        public static int GetVersion()
        {
            return CHECKDLL_VALUE;
        }

        /// <summary>
        /// 管理者権限が付与されているかどうかを確認します。
        /// </summary>
        /// <returns></returns>
        public static bool IsCurrentUserLocalAdministrator()
        {
            return Is64Bit() ?
                smart_IsCurrentUserLocalAdministrator64() : smart_IsCurrentUserLocalAdministrator32();
        }

        /// <summary>
        /// 自分自身を管理者権限付きで起動する
        /// </summary>
        /// <returns></returns>
        public static int ShellExecuteExAdminW()
        {
            return Is64Bit() ?
                smart_ShellExecuteExAdminW_SelfSameParams_64(IntPtr.Zero, IntPtr.Zero) : 
                smart_ShellExecuteExAdminW_SelfSameParams_32(IntPtr.Zero, IntPtr.Zero) ;
        }

        /// <summary>
        /// 自分自身を管理者権限付きで起動する（引数付き）
        /// </summary>
        /// <param name="strParams">コマンドライン</param>
        /// <returns></returns>
        public static int ShellExecuteExAdminW(string strParams)
        {
            return Is64Bit() ?
                smart_ShellExecuteExAdminW_Self_64(IntPtr.Zero, strParams) :
                smart_ShellExecuteExAdminW_Self_32(IntPtr.Zero, strParams) ;
        }

        /// <summary>
        /// 指定プロセスを管理者権限つきで起動する
        /// </summary>
        /// <param name="strFilePath">実行ファイル名</param>
        /// <param name="strParams">コマンドライン</param>
        /// <returns></returns>
        public static int ShellExecuteExAdminW(string strFilePath, string strParams)
        {
            return Is64Bit() ?
                smart_ShellExecuteExAdminW64(strFilePath, strParams) :
                smart_ShellExecuteExAdminW32(strFilePath, strParams) ;
        }

        /// <summary>
        /// 取得可能なディスク情報IDの最大数を取得
        /// </summary>
        /// <returns></returns>
        public static int GetInfoMax()
        {
            return Is64Bit() ?
                smart_GetInfoMax64() : smart_GetInfoMax32();
        }

        /// <summary>
        /// 実行中のオペレーティングシステムのビット数を取得します。
        /// </summary>
        /// <returns></returns>
        private static bool Is64Bit()
        {
            return (IntPtr.Size == 8);
        }

        #endregion

    }
}
