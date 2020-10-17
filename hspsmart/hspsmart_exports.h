#pragma once

// DLLとasファイルのバージョン不一致により、互換性に難が生じる場合
// (引数の追加、定数値の変更など)はここの数字を上げておく。
// 起動時にチェックされます。
#define CHECKDLL_VALUE 6

#ifndef DLLAPI
#define DLLAPI extern "C" __declspec(dllimport)
#endif

DLLAPI int WINAPI smart_CheckDLL(void);
DLLAPI int WINAPI smart_GetHSPSMARTBits(void);
DLLAPI BOOL WINAPI smart_IsCurrentUserLocalAdministrator(void);
DLLAPI int WINAPI smart_Init(void);
DLLAPI int WINAPI smart_UnInit(int nSmartIdx);
DLLAPI int WINAPI smart_DiskScan(
	int nSmartIdx, BOOL bUseWmi, BOOL bAdvancedDiskSearch,
	PBOOL pbFlagChangeDisk, BOOL bWorkaroundHD204UI, BOOL bWorkaroundAdataSsd,
	BOOL bFlagHideNoSmartDisk	/*増えた引数 ver 1.01(ver 6.01)*/
	);
DLLAPI int WINAPI smart_CheckDiskStatus(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_GetCount(int nSmartIdx);
DLLAPI int WINAPI smart_SetUSB1394(int nSmartIdx, UINT uMasks);
DLLAPI int WINAPI smart_SetAtaPassThroughSmart(int nSmartIdx, BOOL bFlag);
DLLAPI int WINAPI smart_SetCsmiType(int nSmartIdx, int nCsmiType);
DLLAPI int WINAPI smart_UpdateIdInfo(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_UpdateSmartInfo(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_IsAdvancedDiskSearch(int nSmartIdx);
DLLAPI int WINAPI smart_IsEnabledWmi(int nSmartIdx);
DLLAPI int WINAPI smart_IsWorkaroundAdataSsd(int nSmartIdx);
DLLAPI int WINAPI smart_IsWorkaroundHD204UI(int nSmartIdx);
DLLAPI int WINAPI smart_DisableAam(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_DisableApm(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_EnableAam(int nSmartIdx, int nDiskIdx, int nValue);
DLLAPI int WINAPI smart_EnableApm(int nSmartIdx, int nDiskIdx, int nValue);
DLLAPI int WINAPI smart_GetAamValue(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_GetApmValue(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_GetRecommendAamValue(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_GetRecommendApmValue(int nSmartIdx, int nDiskIdx);
DLLAPI int WINAPI smart_GetInfoStringW(
	int nSmartIdx, int nDiskIdx, int nInfoType, wchar_t* pszInfoStr, int nInfoStrSize);
DLLAPI int WINAPI smart_GetInfoInt(int nSmartIdx, int nDiskIdx, int nInfoType, int* pnInfo);
DLLAPI int WINAPI smart_GetInfoDouble(int nSmartIdx, int nDiskIdx, int nInfoType, double* pdInfo);
DLLAPI int WINAPI smart_GetInfoInt64(int nSmartIdx, int nDiskIdx, int nInfoType, int* pnLowPart, int* pnHighPart);
DLLAPI int WINAPI smart_GetInfoInt64Ex(int nSmartIdx, int nDiskIdx, int nInfoType, LONGLONG* pllInfo);
DLLAPI int WINAPI smart_GetInfoStruct(int nSmartIdx, int nDiskIdx, int nInfoType, void* pInfo, int nInfoSize);
DLLAPI int WINAPI smart_GetSmartInfoInt64(
	int nSmartIdx, int nDiskIdx,
	int nId[CAtaSmart::MAX_ATTRIBUTE],
	int nStatusFlags[CAtaSmart::MAX_ATTRIBUTE],
	int nCurrentValue[CAtaSmart::MAX_ATTRIBUTE],
	int nWorstValue[CAtaSmart::MAX_ATTRIBUTE],
	int nThresholdValue[CAtaSmart::MAX_ATTRIBUTE],
	int nRawValue_LowPart[CAtaSmart::MAX_ATTRIBUTE],
	int nRawValue_HighPart[CAtaSmart::MAX_ATTRIBUTE]
	);
DLLAPI int WINAPI smart_GetSmartInfoInt64Ex(
	int nSmartIdx, int nDiskIdx,
	int nId[CAtaSmart::MAX_ATTRIBUTE],
	int nStatusFlags[CAtaSmart::MAX_ATTRIBUTE],
	int nCurrentValue[CAtaSmart::MAX_ATTRIBUTE],
	int nWorstValue[CAtaSmart::MAX_ATTRIBUTE],
	int nThresholdValue[CAtaSmart::MAX_ATTRIBUTE],
	LONGLONG llRawValue[CAtaSmart::MAX_ATTRIBUTE]
	);
DLLAPI int WINAPI smart_GetSmartMaxAttribute(void);
DLLAPI int WINAPI smart_ShellExecuteExAdminW(LPCWSTR* szFilePath, LPCWSTR* szParams);
DLLAPI int WINAPI smart_GetInfoMax(void);
DLLAPI int WINAPI smart_SetThreshold(
	int nSmartIdx, int nDiskIdx,
	int nThreshold05, int nThresholdC5, int nThresholdC6, int nThresholdFF
	);