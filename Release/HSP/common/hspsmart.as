;#define global SMART_GLOBAL_VAR
;#define global SMART_NO_CHECK_DLL_ERROR
#ifndef __HSPSMART__
#define __HSPSMART__
#module SMART
// バージョンチェック
#define CHECKDLL_VALUE 6

// hspsmart64.as を先に呼び出している場合は定義されます。
#ifdef HSPSMART64
#uselib "hspsmart64.dll"
#define global HSPSMART_BITS 64
#else
#uselib "hspsmart.dll"
#define global HSPSMART_BITS 32
#endif

#cfunc global smart_GetHSPSMARTBits "smart_GetHSPSMARTBits"
#cfunc global smart_IsCurrentUserLocalAdministrator "smart_IsCurrentUserLocalAdministrator"
#cfunc global smart_Init "smart_Init"
#cfunc global smart_CheckDLL "smart_CheckDLL"
#func global smart_DiskScan "smart_DiskScan" int, int, int, int, int, int, int
#cfunc global smart_CheckDiskStatus "smart_CheckDiskStatus" int, int
#func global smart_SetUSB1394 "smart_SetUSB1394" int, int
#func global smart_SetAtaPassThroughSmart "smart_SetAtaPassThroughSmart" int, int
#func global smart_SetCsmiType "smart_SetCsmiType" int, int
#func global smart_UpdateIdInfo "smart_UpdateIdInfo" int, int
#func global smart_UpdateSmartInfo "smart_UpdateSmartInfo" int, int
#func global smart_UnInit "smart_UnInit" int
#cfunc global smart_IsAdvancedDiskSearch "smart_IsAdvancedDiskSearch" int
#cfunc global smart_IsEnabledWmi "smart_IsEnabledWmi" int
#cfunc global smart_IsWorkaroundAdataSsd "smart_IsWorkaroundAdataSsd" int
#cfunc global smart_IsWorkaroundHD204UI "smart_IsWorkaroundHD204UI" int
#cfunc global smart_GetCount "smart_GetCount" int
#func global smart_DisableAam "smart_DisableAam" int, int
#func global smart_DisableApm "smart_DisableApm" int, int
#func global smart_EnableAam "smart_EnableAam" int, int, int
#func global smart_EnableApm "smart_EnableApm" int, int, int
#cfunc global smart_GetAamValue "smart_GetAamValue" int, int
#cfunc global smart_GetApmValue "smart_GetApmValue" int, int
#cfunc global smart_GetRecommendAamValue "smart_GetRecommendAamValue" int, int
#cfunc global smart_GetRecommendApmValue "smart_GetRecommendApmValue" int, int
#cfunc global smart_GetInfoStringSizeW "smart_GetInfoStringW" int, int, int, nullptr, nullptr
#func global smart_GetInfoStringW "smart_GetInfoStringW" int, int, int, var, int
#func global smart_GetInfoInt "smart_GetInfoInt" int, int, int, var
#func global smart_GetInfoDouble "smart_GetInfoDouble" int, int, int, var
#func global smart_GetInfoInt64 "smart_GetInfoInt64" int, int, int, var, var
#func global smart_GetInfoInt64Ex "smart_GetInfoInt64Ex" int, int, int, var
#cfunc global smart_GetInfoStructSize "smart_GetInfoStruct" int, int, int, nullptr, nullptr
#func global smart_GetInfoStruct "smart_GetInfoStruct" int, int, int, var, int
#func global smart_GetSmartInfoInt64Ex "smart_GetSmartInfoInt64Ex" int, int, var, var, var, var, var, var
#func global smart_GetSmartInfoInt64 "smart_GetSmartInfoInt64" int, int, var, var, var, var, var, var, var
#cfunc global smart_GetSmartMaxAttribute "smart_GetSmartMaxAttribute"
#cfunc global smart_GetInfoMax "smart_GetInfoMax"
#func global smart_SetThreshold "smart_SetThreshold" int, int, int, int, int, int

// 指定プロセスを管理者権限つきで再起動
#func global smart_ShellExecuteExAdminW "smart_ShellExecuteExAdminW" wptr, wptr
// 自分自身を管理者権限つきで再起動
#func global smart_AdminSelfRunW "smart_ShellExecuteExAdminW" nullptr, nullptr

#define global FLAG_USB_NULL			0
#define global FLAG_USB_SAT				1
#define global FLAG_USB_SUNPLUS			2
#define global FLAG_USB_IODATA			4
// Ver 1.09 廃止(CDI Ver 7.0.0)
// #define global FLAG_USB_LOGITEC		8
#define global FLAG_USB_LOGITEC1		8
#define global FLAG_USB_JMICRON			16
#define global FLAG_USB_CYPRESS			32
#define global FLAG_USB_MEMORY			64
#define global FLAG_USB_LOGITEC2		128
#define global FLAG_USB_NVME_JMICRON	256		// Ver 1.11 追加
#define global FLAG_USB_NVME_ASMEDIA	512		// Ver 1.11 追加
#define global FLAG_USB_NVME_REALTEK	1024	// Ver 1.11 追加

#define global FLAG_USB_ALL						(FLAG_USB_SAT | FLAG_USB_SUNPLUS | FLAG_USB_IODATA | FLAG_USB_LOGITEC1 | FLAG_USB_LOGITEC2 | FLAG_USB_JMICRON | FLAG_USB_CYPRESS | FLAG_USB_MEMORY | FLAG_USB_NVME_JMICRON | FLAG_USB_NVME_ASMEDIA | FLAG_USB_NVME_REALTEK)

#define global CSMI_TYPE_DISABLE 		0
#define global CSMI_TYPE_ENABLE_AUTO 	1
#define global CSMI_TYPE_ENABLE_RAID 	2
#define global CSMI_TYPE_ENABLE_ALL 	3

#deffunc smart_InitVar
#ifndef SMART_GLOBAL_VAR
ENUM_INFO_TYPE_STRING.0   = "IdentifyDevice","SmartReadData"
ENUM_INFO_TYPE_STRING.2   = "SmartReadThreshold","Attribute","Threshold","IsSmartEnabled","IsIdInfoIncorrect"
ENUM_INFO_TYPE_STRING.7   = "IsSmartCorrect","IsThresholdCorrect","IsCheckSumError","IsWord88","IsWord64_76"
ENUM_INFO_TYPE_STRING.12  = "IsRawValues8","IsRawValues7","Is9126MB","IsThresholdBug","IsSmartSupported"
ENUM_INFO_TYPE_STRING.17  = "IsLba48Supported","IsAamSupported","IsApmSupported","IsAamEnabled","IsApmEnabled"
ENUM_INFO_TYPE_STRING.22  = "IsNcqSupported","IsNvCacheSupported","IsMaxtorMinute","IsSsd","IsTrimSupported"
ENUM_INFO_TYPE_STRING.27  = "PhysicalDriveId","ScsiPort","ScsiTargetId","ScsiBus","SiliconImageType"
ENUM_INFO_TYPE_STRING.32  = "TotalDiskSize","Cylinder","Head","Sector","Sector28"
ENUM_INFO_TYPE_STRING.37  = "Sector48","NumberOfSectors","DiskSizeChs","DiskSizeLba28","DiskSizeLba48"
ENUM_INFO_TYPE_STRING.42  = "DiskSizeWmi","BufferSize","NvCacheSize","TransferModeType","DetectedTimeUnitType"
ENUM_INFO_TYPE_STRING.47  = "MeasuredTimeUnitType","AttributeCount","DetectedPowerOnHours","MeasuredPowerOnHours","PowerOnRawValue"
ENUM_INFO_TYPE_STRING.52  = "PowerOnStartRawValue","PowerOnCount","Temperature","TemperatureMultiplier","NominalMediaRotationRate"
ENUM_INFO_TYPE_STRING.57  = "HostWrites","HostReads","GBytesErased","NandWrites","WearLevelingCount"
ENUM_INFO_TYPE_STRING.62  = "Life","Major","Minor","DiskStatus","DriveLetterMap"
ENUM_INFO_TYPE_STRING.67  = "AlarmTemperature","AlarmHealthStatus","InterfaceType","CommandType","DiskVendorId"
ENUM_INFO_TYPE_STRING.72  = "UsbVendorId","UsbProductId","Target","Threshold05","ThresholdC5"
ENUM_INFO_TYPE_STRING.77  = "ThresholdC6","sasPhyEntity","SerialNumber","SerialNumberReverse","FirmwareRev"
ENUM_INFO_TYPE_STRING.82  = "FirmwareRevReverse","Model","ModelReverse","ModelWmi","ModelSerial"
ENUM_INFO_TYPE_STRING.87  = "DriveMap","MaxTransferMode","CurrentTransferMode","MajorVersion","MinorVersion"
ENUM_INFO_TYPE_STRING.92  = "Interface","Enclosure","CommandTypeString","SsdVendorString","DeviceNominalFormFactor"
ENUM_INFO_TYPE_STRING.97  = "PnpDeviceId","SmartKeyName","ThresholdFF","IsDeviceSleepSupported","HostReadsWritesUnit"
ENUM_INFO_TYPE_STRING.102 = "IsNVMe", "IsUasp", "LogicalSectorSize"
#else
ENUM_INFO_TYPE_STRING@.0    = "IdentifyDevice","SmartReadData"
ENUM_INFO_TYPE_STRING@.2    = "SmartReadThreshold","Attribute","Threshold","IsSmartEnabled","IsIdInfoIncorrect"
ENUM_INFO_TYPE_STRING@.7    = "IsSmartCorrect","IsThresholdCorrect","IsCheckSumError","IsWord88","IsWord64_76"
ENUM_INFO_TYPE_STRING@.12   = "IsRawValues8","IsRawValues7","Is9126MB","IsThresholdBug","IsSmartSupported"
ENUM_INFO_TYPE_STRING@.17   = "IsLba48Supported","IsAamSupported","IsApmSupported","IsAamEnabled","IsApmEnabled"
ENUM_INFO_TYPE_STRING@.22   = "IsNcqSupported","IsNvCacheSupported","IsMaxtorMinute","IsSsd","IsTrimSupported"
ENUM_INFO_TYPE_STRING@.27   = "PhysicalDriveId","ScsiPort","ScsiTargetId","ScsiBus","SiliconImageType"
ENUM_INFO_TYPE_STRING@.32   = "TotalDiskSize","Cylinder","Head","Sector","Sector28"
ENUM_INFO_TYPE_STRING@.37   = "Sector48","NumberOfSectors","DiskSizeChs","DiskSizeLba28","DiskSizeLba48"
ENUM_INFO_TYPE_STRING@.42   = "DiskSizeWmi","BufferSize","NvCacheSize","TransferModeType","DetectedTimeUnitType"
ENUM_INFO_TYPE_STRING@.47   = "MeasuredTimeUnitType","AttributeCount","DetectedPowerOnHours","MeasuredPowerOnHours","PowerOnRawValue"
ENUM_INFO_TYPE_STRING@.52   = "PowerOnStartRawValue","PowerOnCount","Temperature","TemperatureMultiplier","NominalMediaRotationRate"
ENUM_INFO_TYPE_STRING@.57   = "HostWrites","HostReads","GBytesErased","NandWrites","WearLevelingCount"
ENUM_INFO_TYPE_STRING@.62   = "Life","Major","Minor","DiskStatus","DriveLetterMap"
ENUM_INFO_TYPE_STRING@.67   = "AlarmTemperature","AlarmHealthStatus","InterfaceType","CommandType","DiskVendorId"
ENUM_INFO_TYPE_STRING@.72   = "UsbVendorId","UsbProductId","Target","Threshold05","ThresholdC5"
ENUM_INFO_TYPE_STRING@.77   = "ThresholdC6","sasPhyEntity","SerialNumber","SerialNumberReverse","FirmwareRev"
ENUM_INFO_TYPE_STRING@.82   = "FirmwareRevReverse","Model","ModelReverse","ModelWmi","ModelSerial"
ENUM_INFO_TYPE_STRING@.87   = "DriveMap","MaxTransferMode","CurrentTransferMode","MajorVersion","MinorVersion"
ENUM_INFO_TYPE_STRING@.92   = "Interface","Enclosure","CommandTypeString","SsdVendorString","DeviceNominalFormFactor"
ENUM_INFO_TYPE_STRING@.97   = "PnpDeviceId","SmartKeyName","ThresholdFF","IsDeviceSleepSupported","HostReadsWritesUnit"
ENUM_INFO_TYPE_STRING@.102	= "IsNVMe", "IsUasp", "LogicalSectorSize"
#endif
return

#define	global INFO_IDENTIFYDEVICE					0
#define	global INFO_SMARTREADDATA					1
#define	global INFO_SMARTREADTHRESHOLD				2
#define	global INFO_ATTRIBUTE						3
#define	global INFO_THRESHOLD						4
#define	global INFO_ISSMARTENABLED					5
#define	global INFO_ISIDINFOINCORRECT				6
#define	global INFO_ISSMARTCORRECT					7
#define	global INFO_ISTHRESHOLDCORRECT				8
#define	global INFO_ISCHECKSUMERROR				9
#define	global INFO_ISWORD88						10
#define	global INFO_ISWORD64_76					11
#define	global INFO_ISRAWVALUES8					12
#define	global INFO_ISRAWVALUES7					13
#define	global INFO_IS9126MB						14
#define	global INFO_ISTHRESHOLDBUG					15
#define	global INFO_ISSMARTSUPPORTED				16
#define	global INFO_ISLBA48SUPPORTED				17
#define	global INFO_ISAAMSUPPORTED					18
#define	global INFO_ISAPMSUPPORTED					19
#define	global INFO_ISAAMENABLED					20
#define	global INFO_ISAPMENABLED					21
#define	global INFO_ISNCQSUPPORTED					22
#define	global INFO_ISNVCACHESUPPORTED				23
#define	global INFO_ISMAXTORMINUTE					24
#define	global INFO_ISSSD							25
#define	global INFO_ISTRIMSUPPORTED				26
#define	global INFO_PHYSICALDRIVEID				27
#define	global INFO_SCSIPORT						28
#define	global INFO_SCSITARGETID					29
#define	global INFO_SCSIBUS						30
#define	global INFO_SILICONIMAGETYPE				31
#define	global INFO_TOTALDISKSIZE					32
#define	global INFO_CYLINDER						33
#define	global INFO_HEAD							34
#define	global INFO_SECTOR							35
#define	global INFO_SECTOR28						36
#define	global INFO_SECTOR48						37
#define	global INFO_NUMBEROFSECTORS				38
#define	global INFO_DISKSIZECHS					39
#define	global INFO_DISKSIZELBA28					40
#define	global INFO_DISKSIZELBA48					41
#define	global INFO_DISKSIZEWMI					42
#define	global INFO_BUFFERSIZE						43
#define	global INFO_NVCACHESIZE					44
#define	global INFO_TRANSFERMODETYPE				45
#define	global INFO_DETECTEDTIMEUNITTYPE			46
#define	global INFO_MEASUREDTIMEUNITTYPE			47
#define	global INFO_ATTRIBUTECOUNT					48
#define	global INFO_DETECTEDPOWERONHOURS			49
#define	global INFO_MEASUREDPOWERONHOURS			50
#define	global INFO_POWERONRAWVALUE				51
#define	global INFO_POWERONSTARTRAWVALUE			52
#define	global INFO_POWERONCOUNT					53
#define	global INFO_TEMPERATURE					54
#define	global INFO_TEMPERATUREMULTIPLIER			55
#define	global INFO_NOMINALMEDIAROTATIONRATE		56
#define	global INFO_HOSTWRITES						57
#define	global INFO_HOSTREADS						58
#define	global INFO_GBYTESERASED					59
#define	global INFO_NANDWRITES						60
#define	global INFO_WEARLEVELINGCOUNT				61
#define	global INFO_LIFE							62
#define	global INFO_MAJOR							63
#define	global INFO_MINOR							64
#define	global INFO_DISKSTATUS						65
#define	global INFO_DRIVELETTERMAP					66
#define	global INFO_ALARMTEMPERATURE				67
#define	global INFO_ALARMHEALTHSTATUS				68
#define	global INFO_INTERFACETYPE					69
#define	global INFO_COMMANDTYPE					70
#define	global INFO_DISKVENDORID					71
#define	global INFO_USBVENDORID2					72
#define	global INFO_USBPRODUCTID2					73
#define	global INFO_TARGET							74
#define	global INFO_THRESHOLD05					75
#define	global INFO_THRESHOLDC5					76
#define	global INFO_THRESHOLDC6					77
#define	global INFO_SASPHYENTITY					78
#define	global INFO_SERIALNUMBER					79
#define	global INFO_SERIALNUMBERREVERSE			80
#define	global INFO_FIRMWAREREV					81
#define	global INFO_FIRMWAREREVREVERSE				82
#define	global INFO_MODEL							83
#define	global INFO_MODELREVERSE					84
#define	global INFO_MODELWMI						85
#define	global INFO_MODELSERIAL					86
#define	global INFO_DRIVEMAP						87
#define	global INFO_MAXTRANSFERMODE				88
#define	global INFO_CURRENTTRANSFERMODE			89
#define	global INFO_MAJORVERSION					90
#define	global INFO_MINORVERSION					91
#define	global INFO_INTERFACE						92
#define	global INFO_ENCLOSURE						93		// Ver 1.10 変更
#define	global INFO_COMMANDTYPESTRING				94
#define	global INFO_SSDVENDORSTRING				95
#define	global INFO_DEVICENOMINALFORMFACTOR		96
#define	global INFO_PNPDEVICEID					97
#define	global INFO_SMARTKEYNAME					98
#define	global INFO_THRESHOLDFF					99
#define	global INFO_ISDEVICESLEEPSUPPORTED			100
#define	global INFO_HOSTREADSWRITESUNIT			101
#define global INFO_ISNVME							102		// Ver 1.11 追加
#define global INFO_ISUASP							103		// Ver 1.11 追加
#define global INFO_IS_LOGICALSECTORSIZE			104		// Ver 1.11 追加

#define	global TRANSFER_MODE_UNKNOWN 		0	 // 不明
#define	global TRANSFER_MODE_PIO		 	1	 // PIOモード
#define	global TRANSFER_MODE_PIO_DMA		2	 // PIO/DMAモード
#define	global TRANSFER_MODE_ULTRA_DMA_16	3	 // UltraDMA16モード
#define	global TRANSFER_MODE_ULTRA_DMA_25	4	 // UltraDMA25モード
#define	global TRANSFER_MODE_ULTRA_DMA_33	5	 // UltraDMA33モード
#define	global TRANSFER_MODE_ULTRA_DMA_44	6	 // UltraDMA44モード
#define	global TRANSFER_MODE_ULTRA_DMA_66	7	 // UltraDMA66モード
#define	global TRANSFER_MODE_ULTRA_DMA_100	8	 // UltraDMA100モード
#define	global TRANSFER_MODE_ULTRA_DMA_133	9	 // UltraDMA133モード
#define	global TRANSFER_MODE_SATA_150		10	 // SATA/150
#define	global TRANSFER_MODE_SATA_300		11	 // SATA/300
#define	global TRANSFER_MODE_SATA_600		12	 // SATA/600

#define	global POWER_ON_UNKNOWN	 			 0	// 不明
#define	global POWER_ON_HOURS		 		 1	// 1時間単位
#define	global POWER_ON_MINUTES	 			 2	// 1分間単位
#define	global POWER_ON_HALF_MINUTES		 3	// 30秒単位
#define	global POWER_ON_SECONDS	 			 4	// 1秒単位
#define	global POWER_ON_10_MINUTES			 5	// 10分単位
#define	global POWER_ON_MILLI_SECONDS		 6	// 1ミリ秒単位

#define	global INTERFACE_TYPE_UNKNOWN	 	 0	// 不明
#define	global INTERFACE_TYPE_PATA	 		 1	// パラレルATA/IDE
#define	global INTERFACE_TYPE_SATA	 		 2	// シリアルATA
#define	global INTERFACE_TYPE_USB	 		 3	// USB
#define	global INTERFACE_TYPE_IEEE1394	 	 4	// IEEE1394
// Ver 1.11 廃止
// #define	global INTERFACE_TYPE_UASP	 	 5	// UASP(USB Attached SCSI Protocol)
// Ver 1.08
#define global INTERFACE_TYPE_SCSI			 5	// SCSI			// Ver 1.11 6 → 5
#define global INTERFACE_TYPE_NVME			 6	// NVMe			// Ver 1.11 7 → 6
// #define global INTERFACE_TYPE_USB_NVME	 7	// USB NVMe		// Ver 1.11 8 → 7 → 廃止

// Ver 1.08(定数値変更有)
// Ver 1.09(定数値変更有)
// Ver 1.11(定数値変更有)
#define	global CMD_TYPE_UNKNOWN			  	0
#define	global CMD_TYPE_PHYSICAL_DRIVE	  	1
#define	global CMD_TYPE_SCSI_MINIPORT	  	2
#define	global CMD_TYPE_SILICON_IMAGE	  	3
#define	global CMD_TYPE_SAT				  	4		// SAT = SCSI_ATA_TRANSLATION
#define	global CMD_TYPE_SUNPLUS			  	5
#define	global CMD_TYPE_IO_DATA			  	6
// Ver 1.09 廃止(CDI Ver 7.0.0)
// #define	global CMD_TYPE_LOGITEC			7
#define	global CMD_TYPE_LOGITEC1			7
#define	global CMD_TYPE_LOGITEC2			8
#define	global CMD_TYPE_JMICRON			  	9
#define	global CMD_TYPE_CYPRESS			  	10	
// #define	global CMD_TYPE_PROLIFIC		11	// Not imprement		// Ver 1.11 削除
#define	global CMD_TYPE_SAT_ASM1352R		11	// AMS1352 2nd drive
#define	global CMD_TYPE_CSMI	 		  	12	// CSMI = Common Storage Management Interface 
#define	global CMD_TYPE_CSMI_PHYSICAL_DRIVE	13	// CSMI = Common Storage Management Interface 
#define	global CMD_TYPE_WMI				  	14
#define	global CMD_TYPE_NVME_SAMSUNG	  	15
#define	global CMD_TYPE_NVME_INTEL		  	16
#define	global CMD_TYPE_NVME_STORAGE_QUERY	17
#define	global CMD_TYPE_NVME_JMICRON		18
#define	global CMD_TYPE_NVME_ASMEDIA		19
#define	global CMD_TYPE_NVME_REALTEK		20
#define	global CMD_TYPE_NVME_INTEL_RST		21
#define	global CMD_TYPE_DEBUG			  	22						// Ver 1.11 変更 18→22

#define	global HOST_READS_WRITES_UNKNOWN	0
#define	global HOST_READS_WRITES_512B		1
#define	global HOST_READS_WRITES_32MB		2
#define	global HOST_READS_WRITES_GB	  		3

#uselib "kernel32.dll"
#func GPPSA "GetPrivateProfileStringA" sptr, sptr, sptr, var, int, sptr
// SMARTの項目名を取得
#defcfunc smart_GetSmartAttributeName str key, int id, str filepath
	sdim buf, 1025
	// GetPrivateProfileStringA
	GPPSA key, strf("%02X", id), "不明", buf, 1024, filepath
	;logmes ""+key+":"+strf("%02X", id)
return buf
#defcfunc GetOSBits
#uselib "Kernel32"
#func GetNativeSystemInfo "GetNativeSystemInfo" var
	
	if varptr(GetNativeSystemInfo) {
		// 32bit だと 36bytes
		// 64bit だと 48bytes
		// 大きい分には問題ないので、48bytesにする
		sdim SYSTEM_INFO, 48
		GetNativeSystemInfo SYSTEM_INFO
		// PROCESSOR_ARCHITECTURE_AMD64 = 9
		if wpeek(SYSTEM_INFO, 0) == 9{
			return 64
		}
	}

return 32
#deffunc smart_CheckDLL_Init
#ifndef SMART_NO_CHECK_DLL_ERROR
#uselib "Kernel32"
#cfunc GetCurrentProcess "GetCurrentProcess"
#cfunc IsWow64Process "IsWow64Process" int, var

	// IsWow64Process は Windows Vista,
	// Windows Server 2008, Windows Server 2003 with SP1, Windows XP with SP2 以上 で実装
	if varptr(IsWow64Process){
		isWow64 = 0
		if IsWow64Process(GetCurrentProcess(), isWow64) {
			// WOW64上で動いている = 64bit版 Windows で 32bit プロセス
			if isWow64{
				if HSPSMART_BITS != 32{
					dialog "32bitプロセス上で64bit版HSPSMART.dllを呼び出しています。\n#runtime \"hsp3_64\"を忘れていませんか？", 1 : end
				}
			}else{
				// WOW64上で動いていない = 
				// 32bit版 Windows で 32bitプロセスで動作 
				// もしくは、
				// 64bit版 Windows で 64bitプロセスで動作 
				// のどちらか
				// 問題になるのは、 64bitプロセスで32bit版DLLの呼び出し
				// と 32bit プロセス で 64bit版DLLの呼び出し
				// なので、OSのビット数(プロセス)とDLLのビット数を比較すればよい
				
				if HSPSMART_BITS != GetOSBits(){
					if GetOSBits() == 32 {
						msg = "#include \"hspsmart.as\"を使用してください。"
					}else{
						msg = "#include \"hspsmart64.as\"を使用してください。"
					}
					dialog "" + GetOSBits() + "bitプロセス上で" + HSPSMART_BITS + "bit版HSPSMART.dllを呼び出しています。\n" + msg, 1 : end
				}
			}
		}else{
			// IsWow64Process() 実行失敗ケース…？ ほぼあり得ないけど
			dialog "IsWow64Process() の呼び出しに失敗しました", 1 : end
		}
	}else{
		// IsWow64Process() がないということは、古いバージョンの 32bit版 Windows と決め打ち
		// Windows XP SP1 とか Windows 2000
		if HSPSMART_BITS != 32{
			dialog "32bit版Windows上で64bit版HSPSMART.dllを呼び出しています。\nお使いの環境では64bit版HSPSMART.dllは使用できません。", 1 : end
		}
	}

	if varptr(smart_Init) == 0{
		dialog "HSPSMART.DLL が見つからないか、smart_Init()が呼び出せません。\nファイルを確認してください。", 1
		end
	}
	if varptr(smart_CheckDLL) == 0{
		dialog "古いバージョンのHSPSMART.DLLを呼び出しています。\nファイルを確認してください。\n無視して続行可能です。続行する場合は「はい」を選択してください。", 3
		if stat == 7 : end
	}else{
		if smart_CheckDLL() < CHECKDLL_VALUE{
			dialog "古いバージョンのHSPSMART.DLLを呼び出しています。\nファイルを確認してください。\n無視して続行可能です。続行する場合は「はい」を選択してください。", 3
			if stat == 7 : end
		}
		if smart_CheckDLL() > CHECKDLL_VALUE{
			dialog "hspsmart.as ファイルのバージョンが古いです。\nファイルを確認してください。\n無視して続行可能です。続行する場合は「はい」を選択してください。", 3
			if stat == 7 : end
		}
	}
#endif
return
#global
smart_InitVar
smart_CheckDLL_Init
#endif