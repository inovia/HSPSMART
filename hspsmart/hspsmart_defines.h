#pragma once
#define FLAG_USB_NULL						0x00000000
#define FLAG_USB_SAT						0x00000001
#define FLAG_USB_SUNPLUS					0x00000002
#define FLAG_USB_IODATA						0x00000004
// #define FLAG_USB_LOGITEC					0x00000008	// Ver 1.09 �p�~(CDI Ver 7.0.0)
#define FLAG_USB_LOGITEC1					0x00000008	// Ver 1.09 �ǉ�(CDI Ver 7.0.0)
#define FLAG_USB_JMICRON					0x00000010
#define FLAG_USB_CYPRESS					0x00000020
#define FLAG_USB_MEMORY						0x00000040
#define FLAG_USB_LOGITEC2					0x00000080	// Ver 1.09 �ǉ�(CDI Ver 7.0.0)
#define FLAG_USB_NVME_JMICRON				0x00000100	// Ver 1.11 �ǉ�
#define FLAG_USB_NVME_ASMEDIA				0x00000200	// Ver 1.11 �ǉ�
#define FLAG_USB_NVME_REALTEK				0x00000400	// Ver 1.11 �ǉ�

#define FLAG_USB_ALL						(FLAG_USB_SAT | FLAG_USB_SUNPLUS | FLAG_USB_IODATA | FLAG_USB_LOGITEC1 | FLAG_USB_LOGITEC2 | FLAG_USB_JMICRON | FLAG_USB_CYPRESS | FLAG_USB_MEMORY | FLAG_USB_NVME_JMICRON | FLAG_USB_NVME_ASMEDIA | FLAG_USB_NVME_REALTEK)

// #define	INFO_EXTERNAL_ENCLOSURE				0		// Ver 1.10 �p�~
// #define	INFO_EXTERNAL_USBPRODUCTID			1		// Ver 1.10 �p�~
// #define	INFO_EXTERNAL_USBVENDORID			2		// Ver 1.10 �p�~

#define	INFO_IDENTIFYDEVICE					0
#define	INFO_SMARTREADDATA					1
#define	INFO_SMARTREADTHRESHOLD				2
#define	INFO_ATTRIBUTE						3
#define	INFO_THRESHOLD						4
#define	INFO_ISSMARTENABLED					5
#define	INFO_ISIDINFOINCORRECT				6
#define	INFO_ISSMARTCORRECT					7
#define	INFO_ISTHRESHOLDCORRECT				8
#define	INFO_ISCHECKSUMERROR				9
#define	INFO_ISWORD88						10
#define	INFO_ISWORD64_76					11
#define	INFO_ISRAWVALUES8					12
#define	INFO_ISRAWVALUES7					13
#define	INFO_IS9126MB						14
#define	INFO_ISTHRESHOLDBUG					15
#define	INFO_ISSMARTSUPPORTED				16
#define	INFO_ISLBA48SUPPORTED				17
#define	INFO_ISAAMSUPPORTED					18
#define	INFO_ISAPMSUPPORTED					19
#define	INFO_ISAAMENABLED					20
#define	INFO_ISAPMENABLED					21
#define	INFO_ISNCQSUPPORTED					22
#define	INFO_ISNVCACHESUPPORTED				23
#define	INFO_ISMAXTORMINUTE					24
#define	INFO_ISSSD							25
#define	INFO_ISTRIMSUPPORTED				26
#define	INFO_PHYSICALDRIVEID				27
#define	INFO_SCSIPORT						28
#define	INFO_SCSITARGETID					29
#define	INFO_SCSIBUS						30
#define	INFO_SILICONIMAGETYPE				31
#define	INFO_TOTALDISKSIZE					32
#define	INFO_CYLINDER						33
#define	INFO_HEAD							34
#define	INFO_SECTOR							35
#define	INFO_SECTOR28						36
#define	INFO_SECTOR48						37
#define	INFO_NUMBEROFSECTORS				38
#define	INFO_DISKSIZECHS					39
#define	INFO_DISKSIZELBA28					40
#define	INFO_DISKSIZELBA48					41
#define	INFO_DISKSIZEWMI					42
#define	INFO_BUFFERSIZE						43
#define	INFO_NVCACHESIZE					44
#define	INFO_TRANSFERMODETYPE				45
#define	INFO_DETECTEDTIMEUNITTYPE			46
#define	INFO_MEASUREDTIMEUNITTYPE			47
#define	INFO_ATTRIBUTECOUNT					48
#define	INFO_DETECTEDPOWERONHOURS			49
#define	INFO_MEASUREDPOWERONHOURS			50
#define	INFO_POWERONRAWVALUE				51
#define	INFO_POWERONSTARTRAWVALUE			52
#define	INFO_POWERONCOUNT					53
#define	INFO_TEMPERATURE					54
#define	INFO_TEMPERATUREMULTIPLIER			55
#define	INFO_NOMINALMEDIAROTATIONRATE		56
#define	INFO_HOSTWRITES						57
#define	INFO_HOSTREADS						58
#define	INFO_GBYTESERASED					59
#define	INFO_NANDWRITES						60
#define	INFO_WEARLEVELINGCOUNT				61
#define	INFO_LIFE							62
#define	INFO_MAJOR							63
#define	INFO_MINOR							64
#define	INFO_DISKSTATUS						65
#define	INFO_DRIVELETTERMAP					66
#define	INFO_ALARMTEMPERATURE				67
#define	INFO_ALARMHEALTHSTATUS				68
#define	INFO_INTERFACETYPE					69
#define	INFO_COMMANDTYPE					70
#define	INFO_DISKVENDORID					71
#define	INFO_USBVENDORID2					72
#define	INFO_USBPRODUCTID2					73
#define	INFO_TARGET							74
#define	INFO_THRESHOLD05					75
#define	INFO_THRESHOLDC5					76
#define	INFO_THRESHOLDC6					77
#define	INFO_SASPHYENTITY					78
#define	INFO_SERIALNUMBER					79
#define	INFO_SERIALNUMBERREVERSE			80
#define	INFO_FIRMWAREREV					81
#define	INFO_FIRMWAREREVREVERSE				82
#define	INFO_MODEL							83
#define	INFO_MODELREVERSE					84
#define	INFO_MODELWMI						85
#define	INFO_MODELSERIAL					86
#define	INFO_DRIVEMAP						87
#define	INFO_MAXTRANSFERMODE				88
#define	INFO_CURRENTTRANSFERMODE			89
#define	INFO_MAJORVERSION					90
#define	INFO_MINORVERSION					91
#define	INFO_INTERFACE						92
#define	INFO_ENCLOSURE						93		// Ver 1.10 �ύX
#define	INFO_COMMANDTYPESTRING				94
#define	INFO_SSDVENDORSTRING				95
#define	INFO_DEVICENOMINALFORMFACTOR		96
#define	INFO_PNPDEVICEID					97
#define	INFO_SMARTKEYNAME					98
#define INFO_THRESHOLDFF					99
#define INFO_ISDEVICESLEEPSUPPORTED			100
#define INFO_HOSTREADSWRITESUNIT			101
#define INFO_ISNVME							102		// Ver 1.11 �ǉ�
#define INFO_ISUASP							103		// Ver 1.11 �ǉ�
#define INFO_IS_LOGICALSECTORSIZE			104		// Ver 1.11 �ǉ�

// �ő吔
#define	INFO_MAX 105
