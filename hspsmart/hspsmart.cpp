// hspsmart.cpp : DLL �A�v���P�[�V�����p�ɃG�N�X�|�[�g�����֐����`���܂��B
//

#include "stdafx.h"
#include <stdio.h>
#include "AtaSmart.h"
#include "IsCurrentUserLocalAdministrator.h"
#include "hspsmart.h"

#include <map>
using namespace std;

// HSP 64bit�ł��|�C���^�ŃA�N�Z�X�ł��Ȃ����߁A���������d�l�ɂȂ��Ă܂��c
// (32bit�ł͖��Ȃ���ł����ǂˁB)
static map<int, CAtaSmart* > g_pSmartMap;

static CAtaSmart* GetCAtaSmart(int nSmartIdx)
{
	if ( g_pSmartMap.count(nSmartIdx) )
	{
		return g_pSmartMap[nSmartIdx];
	}
	return NULL;
}

DLLAPI int WINAPI smart_CheckDLL(void)
{
	return CHECKDLL_VALUE;
}

DLLAPI int WINAPI smart_GetHSPSMARTBits(void)
{
	return HSPSMART_BITS;
}

// �Ǘ��Ҍ����������Ă��邩�ǂ����H
DLLAPI BOOL WINAPI smart_IsCurrentUserLocalAdministrator(void)
{
	return IsCurrentUserLocalAdministrator();
}

// ���������܂�
DLLAPI int WINAPI smart_Init(void)
{
	static int nSeqIdx = -1;
	g_pSmartMap[++nSeqIdx] = new CAtaSmart();
	return nSeqIdx;
}

// �J��
DLLAPI int WINAPI smart_UnInit(int nSmartIdx)
{
	
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
	
	// �Ǘ��}�b�v����폜
	g_pSmartMap.erase(nSmartIdx);
	
	// ���Ԃ��폜
	delete pSmart;

	return 0;
}

// �f�B�X�N�����o����(CDI�̍Č��o�Ɠ���)
// ���̏����͂��d���ł��B������u�r�؂�邱�Ƃ�����܂��B
DLLAPI int WINAPI smart_DiskScan(
	int nSmartIdx, BOOL bUseWmi, BOOL bAdvancedDiskSearch,
	PBOOL pbFlagChangeDisk, BOOL bWorkaroundHD204UI, BOOL bWorkaroundAdataSsd,
	BOOL bFlagHideNoSmartDisk	/*���������� ver 1.01(ver 6.01)*/
	)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	pSmart->Init(
		bUseWmi, bAdvancedDiskSearch, pbFlagChangeDisk,
		bWorkaroundHD204UI, bWorkaroundAdataSsd, bFlagHideNoSmartDisk);

	return 0;
}

// ���N��ԁH
// 0 �s���A1�ʏ�A2���ӁA3�ُ�A-1Null�|�C���^�G���[
DLLAPI int WINAPI smart_CheckDiskStatus(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	return pSmart->CheckDiskStatus(nDiskIdx);
}

// HDD�̐����擾
DLLAPI int WINAPI smart_GetCount(int nSmartIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
	return (int) pSmart->vars.GetCount();
}

// USB/IEEE1394�ڑ�HDD�Ή��ݒ�
DLLAPI int WINAPI smart_SetUSB1394(int nSmartIdx, UINT uMasks)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	pSmart->FlagUsbSat =			((uMasks & FLAG_USB_SAT)			!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbSunplus =		((uMasks & FLAG_USB_SUNPLUS)		!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbIodata =			((uMasks & FLAG_USB_IODATA)			!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbLogitec1 =		((uMasks & FLAG_USB_LOGITEC1)		!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbLogitec2 =		((uMasks & FLAG_USB_LOGITEC2)		!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbJmicron =		((uMasks & FLAG_USB_JMICRON)		!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbCypress =		((uMasks & FLAG_USB_CYPRESS)		!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbMemory =			((uMasks & FLAG_USB_MEMORY)			!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbNVMeJMicron =	((uMasks & FLAG_USB_NVME_JMICRON)	!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbNVMeASMedia =	((uMasks & FLAG_USB_NVME_ASMEDIA)	!= 0x00000000) ? TRUE : FALSE;
	pSmart->FlagUsbNVMeRealtek =	((uMasks & FLAG_USB_NVME_REALTEK)	!= 0x00000000) ? TRUE : FALSE;

	return 0;
}

DLLAPI int WINAPI smart_SetAtaPassThroughSmart(int nSmartIdx, BOOL bFlag)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
	pSmart->SetAtaPassThroughSmart(bFlag);
	return 0;
}

// Intel RAID ���ɂ����� CSMI�o�R�Ŏ擾���邩�H
/* 		CSMI_TYPE_DISABLE = 0,
		CSMI_TYPE_ENABLE_AUTO,
		CSMI_TYPE_ENABLE_RAID,
		CSMI_TYPE_ENABLE_ALL,
*/
DLLAPI int WINAPI smart_SetCsmiType(int nSmartIdx, int nCsmiType)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	if ((nCsmiType < CAtaSmart::CSMI_TYPE_DISABLE) || (nCsmiType > CAtaSmart::CSMI_TYPE_ENABLE_ALL))
	{
		return -2;
	}

	pSmart->CsmiType = nCsmiType;
	return 0;
}

DLLAPI int WINAPI smart_UpdateIdInfo(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	if ( pSmart->UpdateIdInfo(nDiskIdx) == FALSE )
	{
		return -3;
	}

	return 0;
}

DLLAPI int WINAPI smart_UpdateSmartInfo(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	if ( pSmart->UpdateSmartInfo(nDiskIdx) == FALSE )
	{
		return -3;
	}

	return 0;
}

DLLAPI int WINAPI smart_IsAdvancedDiskSearch(int nSmartIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
	return pSmart->IsAdvancedDiskSearch;
}

DLLAPI int WINAPI smart_IsEnabledWmi(int nSmartIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
	return pSmart->IsEnabledWmi;
}

DLLAPI int WINAPI smart_IsWorkaroundAdataSsd(int nSmartIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
	return pSmart->IsWorkaroundAdataSsd;
}

DLLAPI int WINAPI smart_IsWorkaroundHD204UI(int nSmartIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	return pSmart->IsWorkaroundHD204UI;
}

// AAM�𖳌���
DLLAPI int WINAPI smart_DisableAam(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	return (pSmart->DisableAam(nDiskIdx));
}

// APM�𖳌���
DLLAPI int WINAPI smart_DisableApm(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	return (pSmart->DisableApm(nDiskIdx));
}

// AAM��L���ɂ��A�l��ݒ肷��(128�`254)
DLLAPI int WINAPI smart_EnableAam(int nSmartIdx, int nDiskIdx, int nValue)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	// ����Ȃ��Ƃ��Ȃ��Ă������C�����邯�ǈꉞ
	return (pSmart->EnableAam(nDiskIdx, (BYTE)abs( nValue % 256)));
}

// APM��L���ɂ��A�l��ݒ肷��(1�`254)
DLLAPI int WINAPI smart_EnableApm(int nSmartIdx, int nDiskIdx, int nValue)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	// ����Ȃ��Ƃ��Ȃ��Ă������C�����邯�ǈꉞ
	return (pSmart->EnableApm(nDiskIdx, (BYTE)abs( nValue % 256)));
}

// AAM�̌��ݒl
DLLAPI int WINAPI smart_GetAamValue(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}
	
	return (int)(pSmart->GetAamValue(nDiskIdx));
}

// APM�̌��ݒl
DLLAPI int WINAPI smart_GetApmValue(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N(HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	return (int)(pSmart->GetApmValue(nDiskIdx));
}

// AAM�̐����l
DLLAPI int WINAPI smart_GetRecommendAamValue(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	return (int)(pSmart->GetRecommendAamValue(nDiskIdx));
}

// APM�̐����l
DLLAPI int WINAPI smart_GetRecommendApmValue(int nSmartIdx, int nDiskIdx)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	return (int)(pSmart->GetRecommendApmValue(nDiskIdx));
}

// smart_GetInfoStringW �̃T�u�֐�
static int _sub_CopyInfoString(
	wchar_t* pszInfoStrDest, int nInfoStrSizeDest, const CString strInfoStrSrc)
{
	// �R�s�[�T�C�Y�Ɖ�[�h
	int nCopySize = sizeof(wchar_t) * (strInfoStrSrc.GetLength() + 1);
	if ((pszInfoStrDest == NULL) || (nInfoStrSizeDest <= 0))
	{
		return nCopySize;
	}
	
	// �o�b�t�@�T�C�Y�s��
	if (nInfoStrSizeDest < nCopySize)
	{
		return -4;
	}
	
	// �R�s�[
	wcscpy_s(pszInfoStrDest, nInfoStrSizeDest, strInfoStrSrc);

	return 0;	// ����I��(�R�s�[�ł���)
}

// ���擾(String)
DLLAPI int WINAPI smart_GetInfoStringW(
	int nSmartIdx, int nDiskIdx, int nInfoType, wchar_t* pszInfoStr, int nInfoStrSize)
{
	
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	if ((pszInfoStr == NULL) && (0 < nInfoStrSize))
	{
		return -3;
	}

	switch(nInfoType)
	{
		// case INFO_EXTERNAL_ENCLOSURE:
		// 	return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->externals[nDiskIdx].Enclosure);
		case INFO_SERIALNUMBER:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].SerialNumber);
		case INFO_SERIALNUMBERREVERSE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].SerialNumberReverse);
		case INFO_FIRMWAREREV:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].FirmwareRev);
		case INFO_FIRMWAREREVREVERSE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].FirmwareRevReverse);
		case INFO_MODEL:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].Model);
		case INFO_MODELREVERSE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].ModelReverse);
		case INFO_MODELWMI:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].ModelWmi);
		case INFO_MODELSERIAL:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].ModelSerial);
		case INFO_DRIVEMAP:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].DriveMap);
		case INFO_MAXTRANSFERMODE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].MaxTransferMode);
		case INFO_CURRENTTRANSFERMODE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].CurrentTransferMode);
		case INFO_MAJORVERSION:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].MajorVersion);
		case INFO_MINORVERSION:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].MinorVersion);
		case INFO_INTERFACE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].Interface);
		case INFO_ENCLOSURE:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].Enclosure);
		case INFO_COMMANDTYPESTRING:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].CommandTypeString);
		case INFO_SSDVENDORSTRING:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].SsdVendorString);
		case INFO_DEVICENOMINALFORMFACTOR:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].DeviceNominalFormFactor);
		case INFO_PNPDEVICEID:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].PnpDeviceId);
		case INFO_SMARTKEYNAME:
			return _sub_CopyInfoString(pszInfoStr, nInfoStrSize, pSmart->vars[nDiskIdx].SmartKeyName);
	}

	// ���݂��Ȃ�
	return -5;
}

// ���擾(Int(DWORD), BOOL, WORD)
DLLAPI int WINAPI smart_GetInfoInt(int nSmartIdx, int nDiskIdx, int nInfoType, int* pnInfo)
{

	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N
	// (HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	if (pnInfo == NULL)
	{
		return -3;
	}

	switch(nInfoType)
	{
		//case INFO_EXTERNAL_USBPRODUCTID:
		//	*pnInfo = pSmart->externals[nDiskIdx].UsbProductId;
		//	break;
		//case INFO_EXTERNAL_USBVENDORID:
		//	*pnInfo = pSmart->externals[nDiskIdx].UsbVendorId;
		//	break;
		case INFO_ISSMARTENABLED:
			*pnInfo = pSmart->vars[nDiskIdx].IsSmartEnabled;
			break;
		case INFO_ISIDINFOINCORRECT:
			*pnInfo = pSmart->vars[nDiskIdx].IsIdInfoIncorrect;
			break;
		case INFO_ISSMARTCORRECT:
			*pnInfo = pSmart->vars[nDiskIdx].IsSmartCorrect;
			break;
		case INFO_ISTHRESHOLDCORRECT:
			*pnInfo = pSmart->vars[nDiskIdx].IsThresholdCorrect;
			break;
		case INFO_ISCHECKSUMERROR:
			*pnInfo = pSmart->vars[nDiskIdx].IsCheckSumError;
			break;
		case INFO_ISWORD88:
			*pnInfo = pSmart->vars[nDiskIdx].IsWord88;
			break;
		case INFO_ISWORD64_76:
			*pnInfo = pSmart->vars[nDiskIdx].IsWord64_76;
			break;
		case INFO_ISRAWVALUES8:
			*pnInfo = pSmart->vars[nDiskIdx].IsRawValues8;
			break;
		case INFO_ISRAWVALUES7:
			*pnInfo = pSmart->vars[nDiskIdx].IsRawValues7;
			break;
		case INFO_IS9126MB:
			*pnInfo = pSmart->vars[nDiskIdx].Is9126MB;
			break;
		case INFO_ISTHRESHOLDBUG:
			*pnInfo = pSmart->vars[nDiskIdx].IsThresholdBug;
			break;
		case INFO_ISSMARTSUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsSmartSupported;
			break;
		case INFO_ISLBA48SUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsLba48Supported;
			break;
		case INFO_ISAAMSUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsAamSupported;
			break;
		case INFO_ISAPMSUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsApmSupported;
			break;
		case INFO_ISAAMENABLED:
			*pnInfo = pSmart->vars[nDiskIdx].IsAamEnabled;
			break;
		case INFO_ISAPMENABLED:
			*pnInfo = pSmart->vars[nDiskIdx].IsApmEnabled;
			break;
		case INFO_ISNCQSUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsNcqSupported;
			break;
		case INFO_ISNVCACHESUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsNvCacheSupported;
			break;
		case INFO_ISMAXTORMINUTE:
			*pnInfo = pSmart->vars[nDiskIdx].IsMaxtorMinute;
			break;
		case INFO_ISSSD:
			*pnInfo = pSmart->vars[nDiskIdx].IsSsd;
			break;
		case INFO_ISTRIMSUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsTrimSupported;
			break;
		case INFO_PHYSICALDRIVEID:
			*pnInfo = pSmart->vars[nDiskIdx].PhysicalDriveId;
			break;
		case INFO_SCSIPORT:
			*pnInfo = pSmart->vars[nDiskIdx].ScsiPort;
			break;
		case INFO_SCSITARGETID:
			*pnInfo = pSmart->vars[nDiskIdx].ScsiTargetId;
			break;
		case INFO_SCSIBUS:
			*pnInfo = pSmart->vars[nDiskIdx].ScsiBus;
			break;
		case INFO_SILICONIMAGETYPE:
			*pnInfo = pSmart->vars[nDiskIdx].SiliconImageType;
			break;
		case INFO_TOTALDISKSIZE:
			*pnInfo = pSmart->vars[nDiskIdx].TotalDiskSize;
			break;
		case INFO_CYLINDER:
			*pnInfo = pSmart->vars[nDiskIdx].Cylinder;
			break;
		case INFO_HEAD:
			*pnInfo = pSmart->vars[nDiskIdx].Head;
			break;
		case INFO_SECTOR:
			*pnInfo = pSmart->vars[nDiskIdx].Sector;
			break;
		case INFO_SECTOR28:
			*pnInfo = pSmart->vars[nDiskIdx].Sector28;
			break;
		case INFO_DISKSIZECHS:
			*pnInfo = pSmart->vars[nDiskIdx].DiskSizeChs;
			break;
		case INFO_DISKSIZELBA28:
			*pnInfo = pSmart->vars[nDiskIdx].DiskSizeLba28;
			break;
		case INFO_DISKSIZELBA48:
			*pnInfo = pSmart->vars[nDiskIdx].DiskSizeLba48;
			break;
		case INFO_DISKSIZEWMI:
			*pnInfo = pSmart->vars[nDiskIdx].DiskSizeWmi;
			break;
		case INFO_BUFFERSIZE:
			*pnInfo = pSmart->vars[nDiskIdx].BufferSize;
			break;
		case INFO_TRANSFERMODETYPE:
			*pnInfo = pSmart->vars[nDiskIdx].TransferModeType;
			break;
		case INFO_DETECTEDTIMEUNITTYPE:
			*pnInfo = pSmart->vars[nDiskIdx].DetectedTimeUnitType;
			break;
		case INFO_MEASUREDTIMEUNITTYPE:
			*pnInfo = pSmart->vars[nDiskIdx].MeasuredTimeUnitType;
			break;
		case INFO_ATTRIBUTECOUNT:
			*pnInfo = pSmart->vars[nDiskIdx].AttributeCount;
			break;
		case INFO_DETECTEDPOWERONHOURS:
			*pnInfo = pSmart->vars[nDiskIdx].DetectedPowerOnHours;
			break;
		case INFO_MEASUREDPOWERONHOURS:
			*pnInfo = pSmart->vars[nDiskIdx].MeasuredPowerOnHours;
			break;
		case INFO_POWERONRAWVALUE:
			*pnInfo = pSmart->vars[nDiskIdx].PowerOnRawValue;
			break;
		case INFO_POWERONSTARTRAWVALUE:
			*pnInfo = pSmart->vars[nDiskIdx].PowerOnStartRawValue;
			break;
		case INFO_POWERONCOUNT:
			*pnInfo = pSmart->vars[nDiskIdx].PowerOnCount;
			break;
		case INFO_TEMPERATURE:
			*pnInfo = pSmart->vars[nDiskIdx].Temperature;
			break;
		case INFO_NOMINALMEDIAROTATIONRATE:
			*pnInfo = pSmart->vars[nDiskIdx].NominalMediaRotationRate;
			break;
		case INFO_HOSTWRITES:
			*pnInfo = pSmart->vars[nDiskIdx].HostWrites;
			break;
		case INFO_HOSTREADS:
			*pnInfo = pSmart->vars[nDiskIdx].HostReads;
			break;
		case INFO_GBYTESERASED:
			*pnInfo = pSmart->vars[nDiskIdx].GBytesErased;
			break;
		case INFO_NANDWRITES:
			*pnInfo = pSmart->vars[nDiskIdx].NandWrites;
			break;
		case INFO_WEARLEVELINGCOUNT:
			*pnInfo = pSmart->vars[nDiskIdx].WearLevelingCount;
			break;
/*
		// Ver 1.06 �������iCDI6.2.1�j
		case INFO_PLEXTORNANDWRITESUNIT:
			*pnInfo = pSmart->vars[nDiskIdx].PlextorNandWritesUnit;
			break;
*/
		case INFO_LIFE:
			*pnInfo = pSmart->vars[nDiskIdx].Life;
			break;
		case INFO_MAJOR:
			*pnInfo = pSmart->vars[nDiskIdx].Major;
			break;
		case INFO_MINOR:
			*pnInfo = pSmart->vars[nDiskIdx].Minor;
			break;
		case INFO_DISKSTATUS:
			*pnInfo = pSmart->vars[nDiskIdx].DiskStatus;
			break;
		case INFO_DRIVELETTERMAP:
			*pnInfo = pSmart->vars[nDiskIdx].DriveLetterMap;
			break;
		case INFO_ALARMTEMPERATURE:
			*pnInfo = pSmart->vars[nDiskIdx].AlarmTemperature;
			break;
		case INFO_ALARMHEALTHSTATUS:
			*pnInfo = pSmart->vars[nDiskIdx].AlarmHealthStatus;
			break;
		case INFO_DISKVENDORID:
			*pnInfo = pSmart->vars[nDiskIdx].DiskVendorId;
			break;
		case INFO_USBVENDORID2:
			*pnInfo = pSmart->vars[nDiskIdx].UsbVendorId;
			break;
		case INFO_USBPRODUCTID2:
			*pnInfo = pSmart->vars[nDiskIdx].UsbProductId;
			break;
		case INFO_THRESHOLD05:
			*pnInfo = pSmart->vars[nDiskIdx].Threshold05;
			break;
		case INFO_THRESHOLDC5:
			*pnInfo = pSmart->vars[nDiskIdx].ThresholdC5;
			break;
		case INFO_THRESHOLDC6:
			*pnInfo = pSmart->vars[nDiskIdx].ThresholdC6;
			break;
		case INFO_TARGET:
			*pnInfo = pSmart->vars[nDiskIdx].Target;
			break;
		case INFO_INTERFACETYPE:
			*pnInfo = pSmart->vars[nDiskIdx].InterfaceType;
			break;
		case INFO_COMMANDTYPE:
			*pnInfo = pSmart->vars[nDiskIdx].CommandType;
			break;
		case INFO_THRESHOLDFF:
			*pnInfo = pSmart->vars[nDiskIdx].ThresholdFF;
			break;
		case INFO_ISDEVICESLEEPSUPPORTED:
			*pnInfo = pSmart->vars[nDiskIdx].IsDeviceSleepSupported;
			break;
		case INFO_HOSTREADSWRITESUNIT:
			*pnInfo = pSmart->vars[nDiskIdx].HostReadsWritesUnit;
			break;
		case INFO_ISNVME:
			*pnInfo = pSmart->vars[nDiskIdx].IsNVMe;
			break;
		case INFO_ISUASP:
			*pnInfo = pSmart->vars[nDiskIdx].IsUasp;
			break;
		case INFO_IS_LOGICALSECTORSIZE:
			*pnInfo = pSmart->vars[nDiskIdx].LogicalSectorSize;
			break;

		default:
			return -5;
	}

	return 0;
}

// ���擾(double)
DLLAPI int WINAPI smart_GetInfoDouble(int nSmartIdx, int nDiskIdx, int nInfoType, double* pdInfo)
{

	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}
		
	// �����`�F�b�N(HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	if (pdInfo == NULL)
	{
		return -3;
	}

	switch(nInfoType)
	{
		case INFO_TEMPERATUREMULTIPLIER:
			*pdInfo = pSmart->vars[nDiskIdx].TemperatureMultiplier;
			break;
		default:
			return -5;
	}
	return 0;
}

// ���擾(LONGLONG 64bit)
DLLAPI int WINAPI smart_GetInfoInt64(int nSmartIdx, int nDiskIdx, int nInfoType, int* pnLowPart, int* pnHighPart)
{
	// ����Null�̏ꍇ�̓G���[�Ƃ���
	if ((pnLowPart == NULL) && (pnHighPart == NULL))
	{
		return -3;
	}

	LARGE_INTEGER li = {0};
	int nRet = smart_GetInfoInt64Ex(nSmartIdx, nDiskIdx, nInfoType, &(li.QuadPart));
	
	if (pnLowPart != NULL)
	{
		*pnLowPart = li.LowPart;
	}

	if (pnHighPart != NULL)
	{
		*pnHighPart = li.HighPart;
	}

	return nRet;
}
// ���擾(LONGLONG 64bit)
DLLAPI int WINAPI smart_GetInfoInt64Ex(int nSmartIdx, int nDiskIdx, int nInfoType, LONGLONG* pllInfo)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N(HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	// Null�̏ꍇ�̓G���[�Ƃ���
	if (pllInfo == NULL)
	{
		return -3;
	}

	switch(nInfoType)
	{
		case INFO_SECTOR48:
			*pllInfo = pSmart->vars[nDiskIdx].Sector48;
			break;
		case INFO_NUMBEROFSECTORS:
			*pllInfo = pSmart->vars[nDiskIdx].NumberOfSectors;
			break;
		case INFO_NVCACHESIZE:
			*pllInfo = pSmart->vars[nDiskIdx].NvCacheSize;
			break;
		default:
			return -5;
	}

	return 0;
}

// smart_GetInfoStruct �̃T�u�֐�
static int _sub_CopyInfoStruct(
	void* pInfoDest, int nInfoSizeDest, void* pInfoSrc, int nInfoSizeSrc)
{

	// �v���o�b�t�@�T�C�Y�擾
	if (nInfoSizeDest <= 0)
	{
		return nInfoSizeSrc;
	}
	
	// �o�b�t�@�s��
	if (nInfoSizeDest < nInfoSizeSrc)
	{
		return -4;
	}
	
	// �R�s�[
	return memcpy_s(pInfoDest, nInfoSizeDest, pInfoSrc, nInfoSizeSrc);
}

// ���擾(�\���́AArray)
DLLAPI int WINAPI smart_GetInfoStruct(int nSmartIdx, int nDiskIdx, int nInfoType, void* pInfo, int nInfoSize)
{

	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N(HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}
	
	// Null�̏ꍇ�̓G���[�Ƃ���
	if ((pInfo == NULL) && (nInfoSize > 0))
	{
		return -3;
	}

	const int SMART_ATTRIBUTE_SIZE = 12;
	const int SMART_THRESHOLD_SIZE = 12;

	switch(nInfoType)
	{
		case INFO_IDENTIFYDEVICE:
			return _sub_CopyInfoStruct(pInfo, nInfoSize,
				&(pSmart->vars[nDiskIdx].IdentifyDevice), IDENTIFY_BUFFER_SIZE);
		case INFO_SMARTREADDATA:
			return _sub_CopyInfoStruct(pInfo, nInfoSize,
				&(pSmart->vars[nDiskIdx].SmartReadData), sizeof(BYTE) * 512);
		case INFO_SMARTREADTHRESHOLD:
			return _sub_CopyInfoStruct(pInfo, nInfoSize,
				&(pSmart->vars[nDiskIdx].SmartReadThreshold), sizeof(BYTE) * 512);
		case INFO_ATTRIBUTE:
			return _sub_CopyInfoStruct(pInfo, nInfoSize,
				&(pSmart->vars[nDiskIdx].Attribute), SMART_ATTRIBUTE_SIZE * CAtaSmart::MAX_ATTRIBUTE);
		case INFO_THRESHOLD:
			return _sub_CopyInfoStruct(pInfo, nInfoSize,
				&(pSmart->vars[nDiskIdx].Threshold), SMART_THRESHOLD_SIZE * CAtaSmart::MAX_ATTRIBUTE);
	}

	return -5;
}

// RawValue�̂�64bit��
DLLAPI int WINAPI smart_GetSmartInfoInt64(
	int nSmartIdx, int nDiskIdx,
	int nId[CAtaSmart::MAX_ATTRIBUTE],
	int nStatusFlags[CAtaSmart::MAX_ATTRIBUTE],
	int nCurrentValue[CAtaSmart::MAX_ATTRIBUTE],
	int nWorstValue[CAtaSmart::MAX_ATTRIBUTE],
	int nThresholdValue[CAtaSmart::MAX_ATTRIBUTE],
	int nRawValue_LowPart[CAtaSmart::MAX_ATTRIBUTE],
	int nRawValue_HighPart[CAtaSmart::MAX_ATTRIBUTE]
	)
{
	
	LARGE_INTEGER llRawValue[CAtaSmart::MAX_ATTRIBUTE] = {0};

	int nRet = smart_GetSmartInfoInt64Ex(
		nSmartIdx, nDiskIdx, nId, nStatusFlags,
		nCurrentValue, nWorstValue, nThresholdValue, (LONGLONG *)llRawValue);

	for(int i = 0; i < CAtaSmart::MAX_ATTRIBUTE; i++)
	{
		if (nRawValue_LowPart != NULL)
		{
			nRawValue_LowPart[i] = llRawValue[i].LowPart;
		}

		if (nRawValue_HighPart != NULL)
		{
			nRawValue_HighPart[i] = llRawValue[i].LowPart;
		}
	}

	return nRet;
}

// RawValue�̂�64bit��
// int 4*30
// longlong 8*30
DLLAPI int WINAPI smart_GetSmartInfoInt64Ex(
	int nSmartIdx, int nDiskIdx,
	int nId[CAtaSmart::MAX_ATTRIBUTE],
	int nStatusFlags[CAtaSmart::MAX_ATTRIBUTE],
	int nCurrentValue[CAtaSmart::MAX_ATTRIBUTE],
	int nWorstValue[CAtaSmart::MAX_ATTRIBUTE],
	int nThresholdValue[CAtaSmart::MAX_ATTRIBUTE],
	LONGLONG llRawValue[CAtaSmart::MAX_ATTRIBUTE]
	)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N(HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	for(int i = 0; i < CAtaSmart::MAX_ATTRIBUTE; i++)
	{

		if (nId != NULL)
		{
			nId[i] = pSmart->vars[nDiskIdx].Attribute[i].Id;
		}

		if (nStatusFlags != NULL)
		{
			nStatusFlags[i] = pSmart->vars[nDiskIdx].Attribute[i].StatusFlags;
		}

		if (nCurrentValue != NULL)
		{
			nCurrentValue[i] = pSmart->vars[nDiskIdx].Attribute[i].CurrentValue;
		}

		if (nWorstValue != NULL)
		{
			nWorstValue[i] = pSmart->vars[nDiskIdx].Attribute[i].WorstValue;
		}
		
		if (nThresholdValue != NULL)
		{
			nThresholdValue[i] = pSmart->vars[nDiskIdx].Threshold[i].ThresholdValue;
		}

		if (llRawValue != NULL)
		{
			LONGLONG r1, r2, r3, r4, r5, r6;
			r1 = pSmart->vars[nDiskIdx].Attribute[i].RawValue[0];
			r2 = pSmart->vars[nDiskIdx].Attribute[i].RawValue[1];
			r3 = pSmart->vars[nDiskIdx].Attribute[i].RawValue[2];
			r4 = pSmart->vars[nDiskIdx].Attribute[i].RawValue[3];
			r5 = pSmart->vars[nDiskIdx].Attribute[i].RawValue[4];
			r6 = pSmart->vars[nDiskIdx].Attribute[i].RawValue[5];
			llRawValue[i] = (LONGLONG)((r1 << 0) | (r2 << 8) | (r3 << 16) | (r4 << 24) | (r5 << 32) | (r6 << 40));
		}
	}

	return 0;
}

DLLAPI int WINAPI smart_GetSmartMaxAttribute(void)
{
	return CAtaSmart::MAX_ATTRIBUTE;
}

// �Ǘ��Ҍ������i
DLLAPI int WINAPI smart_ShellExecuteExAdminW(LPCWSTR* szFilePath, LPCWSTR* szParams)
{

	SHELLEXECUTEINFO sei = {0};
	sei.cbSize = sizeof(sei);
	sei.lpVerb = L"runas";
	sei.nShow = SW_SHOW;

	// �w�肵�Ȃ��ꍇ�͎������g�����i
	WCHAR szSelfPath[_MAX_PATH] = {0};
	if (szFilePath == NULL)
	{
		if (GetModuleFileName(NULL, (LPWSTR)szSelfPath, sizeof(szSelfPath)) == 0)
		{
			return -1;
		}
		sei.lpFile = (LPWSTR)szSelfPath;
		sei.lpParameters = (szParams != NULL) ? (LPWSTR)szParams : GetCommandLine();
	}
	else
	{
		sei.lpFile = (LPWSTR)szFilePath;
		sei.lpParameters = (LPWSTR)szParams;
	}

	if (ShellExecuteEx(&sei) == FALSE)
	{
		return -2;
	}

	return 0;
}

DLLAPI int WINAPI smart_GetInfoMax(void)
{
	return INFO_MAX;
}

DLLAPI int WINAPI smart_SetThreshold(
	int nSmartIdx, int nDiskIdx,
	int nThreshold05, int nThresholdC5, int nThresholdC6, int nThresholdFF
	)
{
	CAtaSmart* pSmart = GetCAtaSmart(nSmartIdx);
	if (pSmart == NULL)
	{
		return -1;
	}

	// �����`�F�b�N(HDD�̐����`�F�b�N���Ĕ͈͊O�̏ꍇ)
	if ((nDiskIdx < 0) || (nDiskIdx >= pSmart->vars.GetCount()))
	{
		return -2;
	}

	// �Ⴆ�΁A-1 ���w�肷��Ɩ�������܂�
	// 0 �` 255 �܂�
	if ((0 <= nThreshold05) && (nThreshold05 <= 255))
	{
		pSmart->vars[nDiskIdx].Threshold05 = nThreshold05;
	}

	if ((0 <= nThresholdC5) && (nThresholdC5 <= 255))
	{
		pSmart->vars[nDiskIdx].ThresholdC5 = nThresholdC5;
	}

	if ((0 <= nThresholdC6) && (nThresholdC6 <= 255))
	{
		pSmart->vars[nDiskIdx].ThresholdC6 = nThresholdC6;
	}

	if ((0 <= nThresholdFF) && (nThresholdFF <= 255))
	{
		pSmart->vars[nDiskIdx].ThresholdFF = nThresholdFF;
	}

	return 0;
}
