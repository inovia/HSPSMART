// http://www.dinop.com/vc/service_ctrl.html (ja)

#pragma once

#include <winsvc.h>
#include "atlstr.h"

class	CDnpService
{
	//
	//	�T�[�r�X�̋N���^��~�p�X���b�h�N���X
	//
	class CServiceThread
	{
	public:
		CServiceThread()
		{
			_bCancel = false;
		}

	private:

		bool					_bCancel;			//�T�[�r�X�̋N���^��~�������f�p�ϐ��Atrue�Ȃ璆�f�J�n
		CComAutoCriticalSection	_secbCancel;		//�T�[�r�X�̋N���^��~�������f�p�N���e�B�J���Z�N�V����

	public:

		//
		//	�T�[�r�X�̋N���^��~�������f�p�֐�
		//
		//	���f�������ꍇ��IsCancel(true,true)���Ăяo��
		//
		bool	IsCancel(bool bSave=false,bool bNewValue=false)
		{
			bool	ret;

			_secbCancel.Lock();
				if(bSave)
				{
					_bCancel = bNewValue;
					ret = true;
				}
				else
					ret = _bCancel;
			_secbCancel.Unlock();

			return	ret;
		}



		//
		//	�T�[�r�X�̊ȈՃR���g���[��
		//
		//	���̂܂܌Ăяo���ƃT�[�r�X���N���^��~����܂Ŗ������[�v�őҋ@����B
		//	�X���b�h���ŌĂяo���AIsCancel()�𗘗p���邱�ƂŖ������[�v�Ɋׂ�Ȃ�
		//	�R���g���[�����\�B
		//
		bool EasyStartStop(LPCTSTR pszName, bool b)
		{
			bool			ret = false;
			BOOL			bRet = FALSE;
			SC_HANDLE		hManager = NULL;
			SC_HANDLE		hService = NULL;
			SERVICE_STATUS	sStatus;

			hManager = ::OpenSCManager(NULL,NULL,GENERIC_EXECUTE);
			if(hManager == NULL)
			{
				return false;
			}
	
			hService = ::OpenService(hManager, pszName, SERVICE_START | SERVICE_QUERY_STATUS);
			if(hService == NULL)
			{
				if(hManager){::CloseServiceHandle(hManager);}
				return false;
			}
	
			::ZeroMemory(&sStatus,sizeof(SERVICE_STATUS));
			bRet = ::QueryServiceStatus(hService,&sStatus);
			if(bRet == FALSE)
			{
				if(hService){::CloseServiceHandle(hService);}
				if(hManager){::CloseServiceHandle(hManager);}
				return false;
			}

			if(sStatus.dwCurrentState == SERVICE_RUNNING)
			{
				if(hService){::CloseServiceHandle(hService);}
				if(hManager){::CloseServiceHandle(hManager);}
				return true;
			}

			CString cstr;
			cstr.Format(_T("sStatus.dwCurrentState:%08X"), sStatus.dwCurrentState);
			DebugPrint(cstr);

			//�T�[�r�X�J�n�v��
			DebugPrint(_T("StartService - 1"));
			bRet = ::StartService(hService, NULL, NULL);

			//�J�n�܂Ŗ������[�v�őҋ@
			DebugPrint(_T("QueryServiceStatus - 1"));
			int count = 0;
			while(::QueryServiceStatus(hService, &sStatus))
			{
				// �������[�v����� (�ő� 1 �b�� WMI �̏�������҂�)
				if(count >= 4)
				{
					break;
				}

				if(sStatus.dwCurrentState == SERVICE_RUNNING)
				{
					DebugPrint(_T("StartService Completed : SERVICE_RUNNING"));
					if(hService){::CloseServiceHandle(hService);}
					if(hManager){::CloseServiceHandle(hManager);}
					return true;
				}
					
				::Sleep(100 * count);
				DebugPrint(_T("Sleep"));
				count++;
			}
				
			// �T�[�r�X�̋N�����[�h�� auto �ɋ����ύX
			ShellExecute(NULL, NULL, _T("sc"), _T("config Winmgmt start= auto"), NULL, SW_HIDE);
			count = 0;
			DebugPrint(_T("QueryServiceStatus - 2"));
			while(::QueryServiceStatus(hService, &sStatus))
			{
				//�T�[�r�X�J�n�v��
				DebugPrint(_T("StartService - 2"));
				::StartService(hService, NULL, NULL);

				// �������[�v����� (�ő� 5 �b�� WMI �̏�������҂�)
				if(count >= 10)
				{
					break;
				}

				if(sStatus.dwCurrentState == SERVICE_RUNNING)
				{
					DebugPrint(_T("StartService Completed : SERVICE_RUNNING"));
					if(hService){::CloseServiceHandle(hService);}
					if(hManager){::CloseServiceHandle(hManager);}
					return true;
				}
					
				::Sleep(500);
				DebugPrint(_T("Sleep"));
				count++;
			}

			if(hService){::CloseServiceHandle(hService);}
			if(hManager){::CloseServiceHandle(hManager);}
			return false;
		}
	};


public:


	//
	//	�T�[�r�X�̊ȈՃR���g���[��
	//
	//	�T�[�r�X���N��/��~����܂Ŗ������[�v�őҋ@����B
	//
	bool	EasyStartStop(LPCTSTR pszName,bool bStart)
	{
		CServiceThread	cThread;

		return	cThread.EasyStartStop(pszName,bStart);
	}


	//
	//	�T�[�r�X�̊ȈՋN��
	//
	//	�T�[�r�X���N������܂Ŗ������[�v�őҋ@����B
	//
	bool	EasyStart(LPCTSTR pszName)
	{
		return	EasyStartStop(pszName,true);
	}

	//
	//	�T�[�r�X�̊ȈՒ�~
	//
	//	�T�[�r�X����~����܂Ŗ������[�v�őҋ@����B
	//
	bool	EasyStop(LPCTSTR pszName)
	{
		return	EasyStartStop(pszName,false);
	}


	//
	//	�T�[�r�X�̊ȈՍċN��
	//
	//	�T�[�r�X���ċN������܂Ŗ������[�v�őҋ@����B
	//
	bool	EasyRestart(LPCTSTR pszName)
	{
		bool			ret;
		CServiceThread	cThread;

		ret = cThread.EasyStartStop(pszName,false);
		if(ret)
			ret = cThread.EasyStartStop(pszName,true);

		return	ret;
	}



	//
	//	�w�肷��T�[�r�X�������Ă��邩�̃`�F�b�N
	//
	//	false�̏ꍇ��"��~"�Ƃ͌���Ȃ��B�T�[�r�X�����݂��Ȃ��ꍇ�Ȃǂ�false�ƂȂ�B
	//
	bool	IsServiceRunning(LPCTSTR pszName)
	{
		bool			ret;
		BOOL			bRet;
		SC_HANDLE		hManager;
		SC_HANDLE		hService;
		SERVICE_STATUS	sStatus;

		ret = false;
		hManager = NULL;
		hService = NULL;
		while(1)			//�������[�v�ł͂Ȃ��I
		{
			hManager = ::OpenSCManager(NULL,NULL,GENERIC_EXECUTE);
			ATLASSERT(hManager);
			if(hManager == NULL)
				break;

			hService = ::OpenService(hManager,pszName,SERVICE_QUERY_STATUS);
			ATLASSERT(hService);
			if(hService == NULL)
				break;

			::ZeroMemory(&sStatus,sizeof(SERVICE_STATUS));
			bRet = ::QueryServiceStatus(hService,&sStatus);
			ATLASSERT(bRet);
			if(bRet == FALSE)
				break;

			if(sStatus.dwCurrentState == SERVICE_RUNNING)
				ret = true;

			break;		//�K�{
		}

		if(hService)
			::CloseServiceHandle(hService);
		if(hManager)
			::CloseServiceHandle(hManager);

		return	ret;
	}
};
