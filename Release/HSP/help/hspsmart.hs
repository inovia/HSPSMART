;--------------------------------------------------
; HSP �w���v �\�[�X�t�@�C�� (hs �`��)
; hs �t�@�C���̏����ɂ��ẮAHS_BIBLE.txt ���Q�Ƃ��Ă��������B

;--------------------------------------------------
; ���� hs �t�@�C���̃f�t�H���g�̃t�B�[���h�l��ݒ�

%dll
; �v���O�C��/���W���[���� ���L��
hspsmart.dll
%ver
; �o�[�W���� ���L��
1.11(CrystalDiskInfo 8.2.3)
%date
; ���t ���L��
2019/08/12
%author
; ����� ���L��
; ���������ꍇ�͒ǋL���āI�I�I
Copyright (C) 2008-2019 hiyohiyo (CrystalDiskInfo��җl)
Copyright (C) 2013-2019 �C�m�r�A (hspsmart.dll �쐬)
%url
; �֘A URL ���L��
https://hsp.moe/
https://crystalmark.info/
%note
; ���l (�⑫���) ���L��
�{�v���O�C����CrystalDiskInfo�̃\�[�X�R�[�h���g�p���Ă���܂��B
%type
; �^�C�v ���L��

%port
; �Ή��� ���L��
Win
%portinfo
; �ڐA�̃q���g ���L��
64bit�ł��g�p����ꍇ�́A
#runtime "hsp3_64"
#include "hspsmart64.as"
��擪�ɋL�q���Ă��������B

%index
smart_IsCurrentUserLocalAdministrator
; ���o�� ���L��
�Ǘ��Ҍ����������Ă��邩���ׂ܂�
%prm
()

%inst
; ����� ���L��
���݂̃v���Z�X���Ǘ��Ҍ����������Ă��邩���ׂ܂��B
�����Ă���ꍇ�� 1 ���A�����Ă��Ȃ��ꍇ�� 0 ���Ԃ�܂��B

%sample
; �T���v���X�N���v�g ���L��
if smart_IsCurrentUserLocalAdministrator(){
	mes "�Ǘ��Ҍ���������܂�"
}
%href
; �֘A���� ���L��
smart_ShellExecuteExAdminW
smart_AdminSelfRunW
smart_Init
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_IsCurrentUserLocalAdministrator "smart_IsCurrentUserLocalAdministrator"


%index
smart_Init
; ���o�� ���L��
���������܂�
%prm
()

%inst
; ����� ���L��
���������܂��B
�߂�l�͑���n���h���ł��̂ŁA�ۑ����Ă����Ă��������B
����n���h���͂قƂ�ǂ̖��߁E�֐��Ŏg�p���܂��B
0�̏ꍇ�͎��s���Ă��܂��B
���s�ɂ͊Ǘ��Ҍ������K�v�ł��B

%sample
; �T���v���X�N���v�g ���L��
hSmart = smart_Init()
%href
; �֘A���� ���L��
smart_UnInit
smart_DiskScan
smart_IsCurrentUserLocalAdministrator
smart_ShellExecuteExAdminW
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_Init "smart_Init"


%index
smart_DiskScan
; ���o�� ���L��
�f�B�X�N�����o���܂�
%prm
int1, int2, int3, int4, int5, int6, int7
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: WMI���g�p���邩�H(0 = �g�p���Ȃ��A1 = �g�p����)
int3	: �A�h�o���X�h�f�B�X�N�T�[�`���g�p���邩�H(0 = �g�p���Ȃ��A1 = �g�p����)
int4	: ChangeDisk�t���O(0 = �g�p���Ȃ�(NULL�|�C���^)�A����ȊO�̒l�� PBOOL �Ƃ��Ĉ����܂��B�ʏ��0��OK�B)
int5	: �T���X�� HD155UI/HD204UI�̕s�����@�\���g�p���邩�H(0 = �g�p���Ȃ��A1 = �g�p����)
int6	: ADATA SSD S599��FW 3.4.6�̕s�����@�\���g�p���邩�H(0 = �g�p���Ȃ��A1 = �g�p����)
int7	: S.M.A.R.T.�ɑΉ����Ă��Ȃ��f�B�X�N���B�����H(0 = �g�p���Ȃ��A1 = �g�p����)

%inst
; ����� ���L��
�f�B�X�N�����o���܂�(CrystalDiskInfo�̍Č��o�Ɠ���)
����N������f�B�X�N���ォ��ǉ��E�ύX�E�폜���ꂽ�肵���Ƃ��Ɏ��s���Ă��������B
���̏����͂��d���ł��B�Đ����̉�������u�r�؂�邱�Ƃ�����܂��B
smart_SetAtaPassThroughSmart���߂ŁAIDE/ATA_PASS_THROUGH ���I�t�ɂ���Ɖ����r�؂�Ȃ��Ȃ�\��������܂��B

WMI�͒ʏ�A�L���ɂ��Ă������Ƃ������߂��܂��B
�L���ɂ��Ȃ��ƃf�B�X�N�����o�ł��Ȃ����Ƃ�����܂��B

�A�h�o���X�h�f�B�X�N�T�[�`��
�ʏ�̃T�[�`�����ł͌�����Ȃ��f�B�X�N�����o�ł���\��������܂��B
�������A���ɂ���Ă� OS ���ƃt���[�Y���Ă��܂��\��������܂��B
�EScsiPort0 �` 15 �� ScsiTargetID 0�`7 �ɑ΂��ăf�B�X�N�̗L�����m�F���܂��B 
�EIDENTIFY_DEVICE �̕Ԃ�l���s�K�؂ȃf�B�X�N���\�����܂��B
�ES.M.A.R.T. �ɑΉ����Ă��Ȃ��ƃ��|�[�g�����f�B�X�N�ɑ΂��Ă� S.M.A.R.T. ���̎擾�����݂܂��B
�O�t���{�[�h�ɐڑ������f�B�X�N�Ŗ�肪��������\��������܂��B

�T���X�� HD155UI/HD204UI�̕s�����@�\��
�t�@�[���E�F�A�s��ɂ��f�[�^�����̉\�������邽�ߌ����Ώۂ���O���܂��B
�L���ɂ��Ă������Ƃ������߂��܂��B

ADATA SSD S599��FW 3.4.6�̕s�����@�\��
2�{�̉��x���񍐂���邽�߁A������܂��B
�L���ɂ��Ă������Ƃ������߂��܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������

%sample
; �T���v���X�N���v�g ���L��
smart_DiskScan hSmart, 1, 1, 0, 1, 1, 0
%href
; �֘A���� ���L��
smart_Init
smart_SetAtaPassThroughSmart
smart_IsAdvancedDiskSearch
smart_IsEnabledWmi
smart_IsWorkaroundAdataSsd
smart_IsWorkaroundHD204UI
smart_UpdateIdInfo
smart_UpdateSmartInfo
smart_CheckDiskStatus
smart_SetThreshold
smart_SetUSB1394
smart_SetAtaPassThroughSmart
smart_SetCsmiType
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_DiskScan "smart_DiskScan" int, int, int, int, int, int


%index
smart_CheckDiskStatus
; ���o�� ���L��
�f�B�X�N�̃X�e�[�^�X���擾
%prm
(int1, int2)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
�f�B�X�N�̃X�e�[�^�X���擾���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B

�߂�l�͈ȉ��̂悤�ɂȂ�܂��B
0  = �f�B�X�N�X�e�[�^�X�s��
1  = �f�B�X�N�X�e�[�^�X�ʏ�
2  = �f�B�X�N�X�e�[�^�X����
3  = �f�B�X�N�X�e�[�^�X�ُ�

-1 = ����n���h������

%sample
; �T���v���X�N���v�g ���L��
mes smart_CheckDiskStatus(hSmart, 0)
%href
; �֘A���� ���L��
smart_GetCount
smart_SetThreshold
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_CheckDiskStatus "smart_CheckDiskStatus" int, int


%index
smart_SetUSB1394
; ���o�� ���L��
USB/IEEE1394�ڑ��̊O�t���f�B�X�N�����o�Ώۂɂ���
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �t���O�i��q�j

%inst
; ����� ���L��
USB/IEEE1394�ڑ��̊O�t���f�B�X�N�����o�Ώۂɂ��邩�ǂ����H

�t���O�ɂ͈ȉ��̂��̂� OR �l�Ŏw��ł��܂��B

// SCSI ATA TRANSLATION �o�R�ŃA�N�Z�X�����݂܂��B
FLAG_USB_SAT
// Sunplus ���R���g���[���Ή�
FLAG_USB_SUNPLUS
// I-O DATA ���R���g���[���Ή�
FLAG_USB_IODATA
// Logitec ���R���g���[���Ή�
FLAG_USB_LOGITEC1
FLAG_USB_LOGITEC2
// JMicron ���R���g���[���Ή�
FLAG_USB_JMICRON
// Cypress ���R���g���[���Ή�
FLAG_USB_CYPRESS
// USB �������ɑ΂��Ă� SCSI ATA TRANSLATION �o�R�ŃA�N�Z�X�����݂܂��B
// USB-SATA �ϊ��`�b�v�𓋍ڂ����ꕔ�̍��� USB �������Œ��g��������悤�ɂȂ�\��������܂��B
FLAG_USB_MEMORY

// JMicron ���R���g���[���Ή�(NVMe)
FLAG_USB_NVME_JMICRON

// AsMedia ���R���g���[���Ή�(NVMe)
FLAG_USB_NVME_ASMEDIA

// Realtek ���R���g���[���Ή�(NVMe)
FLAG_USB_NVME_REALTEK

FLAG_USB_ALL �� ���ׂĐݒ肳��܂��B
FLAG_USB_NULL �� ���ׂĉ�������܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������


%sample
; �T���v���X�N���v�g ���L��
smart_SetUSB1394 hSmart, FLAG_USB_ALL
%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_SetUSB1394 "smart_SetUSB1394" int, int


%index
smart_SetAtaPassThroughSmart
; ���o�� ���L��
IDE/ATA_PASS_THROUGH ���g�p���܂�
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: IDE/ATA_PASS_THROUGH���g�p����ꍇ��1�A���Ȃ��ꍇ�� 0���w��

%inst
; ����� ���L��
IDE/ATA_PASS_THROUGH ���g�p���邩�̐ݒ�B
�g�p����Əڍׂȏ�񂪎擾�ł���\��������܂��B
�ꕔ��(Intel �� ATA �h���C�o)�ł͉���т�}�E�X��т��������邱�Ƃ��񍐂���Ă��܂��B
��肪��������ꍇ�͖����ɂ��Ă��������B
�����m�ȏ�񂪎擾�ł��Ȃ��\��������܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B

0  = ����
-1 = ����n���h������

%sample
; �T���v���X�N���v�g ���L��
smart_SetAtaPassThroughSmart hSmart, 1
%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_SetAtaPassThroughSmart "smart_SetAtaPassThroughSmart" int, int


%index
smart_SetCsmiType
; ���o�� ���L��
CSMI���g�p���邩�ǂ���
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �t���O(��q)

%inst
; ����� ���L��
Intel RAID ���ɂ����� CSMI (Common Storage Management Interface) �o�R�Ńf�B�X�N�����擾���܂��B

�ȉ��̃t���O���w��ł��܂��B
�ʏ�͎������o�ł悢�Ǝv���܂��B

CSMI_TYPE_DISABLE	// ����
CSMI_TYPE_ENABLE_AUTO	// �������o
CSMI_TYPE_ENABLE_RAID	// RAID�f�B�X�N�̂ݗL��
CSMI_TYPE_ENABLE_ALL	// ���ׂėL��

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������
-2 = �����G���[(�l���͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_SetCsmiType hSmart, CSMI_TYPE_ENABLE_AUTO


%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_SetCsmiType "smart_SetCsmiType" int, int


%index
smart_UpdateIdInfo
; ���o�� ���L��
�f�B�X�N�̏����X�V(S.M.A.R.T.�ȊO)
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
�f�B�X�N�̏����X�V���܂��B(S.M.A.R.T.�ȊO)
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = �X�V���s

%sample
; �T���v���X�N���v�g ���L��
// �f�B�X�N�̏����X�V(S.M.A.R.T.�ȊO)
smart_UpdateIdInfo hSmart, 0
// �f�B�X�N��S.M.A.R.T.�����X�V
smart_UpdateSmartInfo hSmart, 0
%href
; �֘A���� ���L��
smart_UpdateSmartInfo
smart_DiskScan
smart_CheckDiskStatus
smart_GetCount
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_UpdateIdInfo "smart_UpdateIdInfo" int, int


%index
smart_UpdateSmartInfo
; ���o�� ���L��
�f�B�X�N��S.M.A.R.T.�����X�V
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
�f�B�X�N��S.M.A.R.T.�����X�V���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = �X�V���s
%sample
; �T���v���X�N���v�g ���L��
// �f�B�X�N�̏����X�V(S.M.A.R.T.�ȊO)
smart_UpdateIdInfo hSmart, 0
// �f�B�X�N��S.M.A.R.T.�����X�V
smart_UpdateSmartInfo hSmart, 0
%href
; �֘A���� ���L��
smart_UpdateIdInfo
smart_DiskScan
smart_CheckDiskStatus
smart_GetCount
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_UpdateSmartInfo "smart_UpdateSmartInfo" int, int


%index
smart_UnInit
; ���o�� ���L��
�J�����܂�
%prm
int1
int1	: ����n���h��(smart_Init()�����s���Ď擾����)

%inst
; ����� ���L��
�J�����܂��B
����n���h���������Ɏw�肵�܂��B
%sample
; �T���v���X�N���v�g ���L��
smart_UnInit hSmart
%href
; �֘A���� ���L��
smart_Init
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_UnInit "smart_UnInit" int


%index
smart_IsAdvancedDiskSearch
; ���o�� ���L��
�A�h�o���X�h�f�B�X�N�T�[�`���L�����ǂ����H
%prm
(int1)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)

%inst
; ����� ���L��
�A�h�o���X�h�f�B�X�N�T�[�`���L�����ǂ����擾���܂��B
�����̏ꍇ�� 0�A�L���̏ꍇ��1���Ԃ�܂��B
%sample
; �T���v���X�N���v�g ���L��
mes smart_IsAdvancedDiskSearch(hSmart)
%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_IsAdvancedDiskSearch "smart_IsAdvancedDiskSearch" int


%index
smart_IsEnabledWmi
; ���o�� ���L��
WMI���g�p���Ď擾���邩�ǂ����H
%prm
(int1)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)

%inst
; ����� ���L��
WMI���g�p���Ď擾���邩�ǂ����擾���܂��B
�����̏ꍇ�� 0�A�L���̏ꍇ��1���Ԃ�܂��B
%sample
; �T���v���X�N���v�g ���L��
mes smart_IsEnabledWmi(hSmart)
%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_IsEnabledWmi "smart_IsEnabledWmi" int


%index
smart_IsWorkaroundAdataSsd
; ���o�� ���L��
ADATA��SSD�s�����@�\���L�����ǂ����H
%prm
(int1)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)

%inst
; ����� ���L��
ADATA��SSD�s�����@�\���L�����ǂ����擾���܂��B
�����̏ꍇ�� 0�A�L���̏ꍇ��1���Ԃ�܂��B
%sample
; �T���v���X�N���v�g ���L��
mes smart_IsWorkaroundAdataSsd(hSmart)
%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_IsWorkaroundAdataSsd "smart_IsWorkaroundAdataSsd" int


%index
smart_IsWorkaroundHD204UI
; ���o�� ���L��
�T���X�� HD155UI/HD204UI�̕s�����@�\���L�����ǂ����H
%prm
(int1)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)

%inst
; ����� ���L��
�T���X�� HD155UI/HD204UI�̕s�����@�\���L�����ǂ����擾���܂��B
�����̏ꍇ�� 0�A�L���̏ꍇ��1���Ԃ�܂��B
%sample
; �T���v���X�N���v�g ���L��
mes smart_IsWorkaroundHD204UI(hSmart)
%href
; �֘A���� ���L��
smart_DiskScan
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_IsWorkaroundHD204UI "smart_IsWorkaroundHD204UI" int


%index
smart_GetCount
; ���o�� ���L��
���o���ꂽ�f�B�X�N�̐����擾���܂�
%prm
(int1)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)

%inst
; ����� ���L��
���o���ꂽ�f�B�X�N�̐����擾���܂��B
�G���[���}�C�i�X�l��Ԃ��ꍇ������܂��̂ŁArepeat �ȂǂŒ��ڎg�p����Ɩ������[�v����\��������܂��B
�G���[���Ԃ��Ă��ĂȂ����ǂ����`�F�b�N���Ă��������B

�߂�l
1�ȏ�  = ����(=���o���ꂽ�䐔)
0      = �f�B�X�N�Ȃ�
-1     = ����n���h������
%sample
; �T���v���X�N���v�g ���L��
mes smart_GetCount(hSmart)
%href
; �֘A���� ���L��
smart_DiskScan
smart_UpdateIdInfo
smart_UpdateSmartInfo
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetCount "smart_GetCount" int


%index
smart_DisableAam
; ���o�� ���L��
AAM�𖳌������܂�
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
AAM�𖳌������܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������
-2 = �����G���[(�l���͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_DisableAam hSmart, 0
%href
; �֘A���� ���L��
smart_DiskScan

smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_DisableAam "smart_DisableAam" int, int


%index
smart_DisableApm
; ���o�� ���L��
APM�𖳌������܂�
%prm
int1, int2
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
APM�𖳌������܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������
-2 = �����G���[(�l���͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_DisableApm hSmart, 0
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_DisableApm "smart_DisableApm" int, int


%index
smart_EnableAam
; ���o�� ���L��
AAM��L�������܂�
%prm
int1, int2, int3
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: AAM�̒l(128�`254)

%inst
; ����� ���L��
AAM��L�������܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
AAM�̒l��128�`254���w�肵�܂��B�͈͊O�̏ꍇ�͋ߎ��l���ݒ肳��܂��B

stat �� 1 �̏ꍇ�͐������Ă��܂��B
1  = ����
0  = ���s
-1 = ����n���h������
-2 = �����G���[(�l���͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_EnableAam hSmart, 0, 254
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_EnableAam "smart_EnableAam" int, int, int


%index
smart_EnableApm
; ���o�� ���L��
APM��L�������܂�
%prm
int1, int2, int3
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: APM�̒l(1�`254)

%inst
; ����� ���L��
APM��L�������܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
APM�̒l��1�`254���w�肵�܂��B�͈͊O�̏ꍇ�͋ߎ��l���ݒ肳��܂��B

stat �� 1 �̏ꍇ�͐������Ă��܂��B
1  = ����
0  = ���s
-1 = ����n���h������
-2 = �����G���[(�l���͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_EnableApm hSmart, 0, 254
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_EnableApm "smart_EnableApm" int, int, int


%index
smart_GetAamValue
; ���o�� ���L��
AAM�̌��ݒl���擾���܂�
%prm
(int1, int2)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
AAM�̌��ݒl���擾���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
AAM������������Ă���ꍇ�ł�AAM���T�|�[�g���Ă���Ύ擾�\�ł��B

�߂�l
0          = AAM�ɖ��Ή�
128 �` 254 = AAM�l
-1         = ����n���h������
-2         = �����G���[(�l���͈͊O) 


%sample
; �T���v���X�N���v�g ���L��
mes smart_GetAamValue(hSmart, 0)
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetAamValue "smart_GetAamValue" int, int


%index
smart_GetApmValue
; ���o�� ���L��
APM�̌��ݒl���擾���܂�
%prm
(int1, int2)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
APM�̌��ݒl���擾���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
APM������������Ă���ꍇ�ł�APM���T�|�[�g���Ă���Ύ擾�\�ł��B

�߂�l
0          = APM�ɖ��Ή�
1 �` 254   = APM�l
-1         = ����n���h������
-2         = �����G���[(�l���͈͊O) 

%sample
; �T���v���X�N���v�g ���L��
mes smart_GetApmValue(hSmart, 0)
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetApmValue "smart_GetApmValue" int, int


%index
smart_GetRecommendAamValue
; ���o�� ���L��
AAM�̃��[�J�[�����l���擾���܂�
%prm
(int1, int2)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
AAM�̃��[�J�[�����l���擾���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
AAM������������Ă���ꍇ�ł�AAM���T�|�[�g���Ă���Ύ擾�\�ł��B

�߂�l
0          = AAM�ɖ��Ή�
128 �` 254 = AAM�l
-1         = ����n���h������
-2         = �����G���[(�l���͈͊O) 
%sample
; �T���v���X�N���v�g ���L��
mes smart_GetRecommendAamValue(hSmart, 0)
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendApmValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetRecommendAamValue "smart_GetRecommendAamValue" int, int


%index
smart_GetRecommendApmValue
; ���o�� ���L��
APM�̃��[�J�[�����l���擾���܂�
%prm
(int1, int2)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)

%inst
; ����� ���L��
APM�̃��[�J�[�����l���擾���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
APM������������Ă���ꍇ�ł�APM���T�|�[�g���Ă���Ύ擾�\�ł��B

�߂�l
0          = APM�ɖ��Ή�
1 �` 254   = APM�l
-1         = ����n���h������
-2         = �����G���[(�l���͈͊O) 
%sample
; �T���v���X�N���v�g ���L��
mes smart_GetRecommendApmValue(hSmart, 0)
%href
; �֘A���� ���L��
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetRecommendApmValue "smart_GetRecommendApmValue" int, int


%index
smart_GetInfoStringSizeW
; ���o�� ���L��
������^���̊i�[�ɕK�v�ȃT�C�Y���擾
%prm
(int1, int2, int3)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(smart_GetInfoStringW�Q��)


%inst
; ����� ���L��
������^���̊i�[�ɕK�v�ȃT�C�Y���擾���܂��B
smart_GetInfoStringW �Ŏg�p���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_ENCLOSURE			// �f�B�X�N�G���N���[�W��
INFO_SERIALNUMBER		// �V���A���i���o�[
INFO_SERIALNUMBERREVERSE	// �V���A���i���o�[���t�]��������
INFO_FIRMWAREREV		// �t�@�[���E�F�A�̃����B�W����
INFO_FIRMWAREREVREVERSE		// �t�@�[���E�F�A�̃����B�W�������t�]��������
INFO_MODEL			// ���f����
INFO_MODELREVERSE		// ���f�������t�]��������
INFO_MODELWMI			// WMI����擾�������f����
INFO_MODELSERIAL		// ���f����
INFO_DRIVEMAP			// �h���C�u�}�b�v(C: D: �Ƃ�)
INFO_MAXTRANSFERMODE		// �ő�]�����[�h
INFO_CURRENTTRANSFERMODE	// ���݂̓]�����[�h
INFO_MAJORVERSION		// �Ή��K�i
INFO_MINORVERSION		// �Ή��K�i
INFO_INTERFACE			// �C���^�[�t�F�[�X(SATA�Ƃ�)
INFO_ENCLOSURE2			// �f�B�X�N�G���N���[�W��
INFO_COMMANDTYPESTRING		// �H
INFO_SSDVENDORSTRING		// SSD�x���_�[��
INFO_DEVICENOMINALFORMFACTOR	// �t�@�N�^�[(2.5�C���`�Ƃ�3.5�C���`)
INFO_PNPDEVICEID		// PnpDeviceId
INFO_SMARTKEYNAME		// S.M.A.R.T.���ږ����o�p�L�[��

�߂�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-4 = �o�b�t�@�̈�s��
-5 = �Ή����Ă��Ȃ�ID

%sample
; �T���v���X�N���v�g ���L��
// �i�[�ɕK�v�ȃT�C�Y���擾
size = smart_GetInfoStringSizeW(hSmart, 0, INFO_MODEL)
if size > 0{
	sdim buf, size + 2
	smart_GetInfoStringW hSmart, 0, INFO_MODEL, buf, size
	mes stat
	mes cnvwtos(buf)
}
%href
; �֘A���� ���L��
smart_GetInfoStringW


INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetInfoStringSizeW "smart_GetInfoStringW" int, int, int, nullptr, nullptr


%index
smart_GetInfoStringW
; ���o�� ���L��
�f�B�X�N�̏����擾(������^/UTF-16)
%prm
int1, int2, int3, var4, int5
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)
var4	: ��񂪊i�[�����ϐ�
int5	: �ϐ��̃T�C�Y

%inst
; ����� ���L��
�f�B�X�N�̏����擾���܂��B(������^/UTF-16)
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_ENCLOSURE			// �f�B�X�N�G���N���[�W��
INFO_SERIALNUMBER		// �V���A���i���o�[
INFO_SERIALNUMBERREVERSE	// �V���A���i���o�[���t�]��������
INFO_FIRMWAREREV		// �t�@�[���E�F�A�̃����B�W����
INFO_FIRMWAREREVREVERSE		// �t�@�[���E�F�A�̃����B�W�������t�]��������
INFO_MODEL			// ���f����
INFO_MODELREVERSE		// ���f�������t�]��������
INFO_MODELWMI			// WMI����擾�������f����
INFO_MODELSERIAL		// ���f����
INFO_DRIVEMAP			// �h���C�u�}�b�v(C: D: �Ƃ�)
INFO_MAXTRANSFERMODE		// �ő�]�����[�h
INFO_CURRENTTRANSFERMODE	// ���݂̓]�����[�h
INFO_MAJORVERSION		// �Ή��K�i
INFO_MINORVERSION		// �Ή��K�i
INFO_INTERFACE			// �C���^�[�t�F�[�X(SATA�Ƃ�)
INFO_ENCLOSURE2			// �f�B�X�N�G���N���[�W��
INFO_COMMANDTYPESTRING		// �R�}���h�^�C�v
INFO_SSDVENDORSTRING		// SSD�x���_�[��
INFO_DEVICENOMINALFORMFACTOR	// �t�H�[���t�@�N�^�[(2.5�C���`�Ƃ�3.5�C���`)
INFO_PNPDEVICEID		// PnpDeviceId
INFO_SMARTKEYNAME		// S.M.A.R.T.���ږ����o�p�L�[��

�ϐ��͂��炩���ߗ̈���m�ۂ��Ă����Ă��������B
�T�C�Y��smart_GetInfoStringSizeW()�Ŏ擾�ł��܂��B
�������Unicode�ŕԂ��Ă��܂��B
cnvwtos�Ȃǂŕϊ�����K�v������܂��B


stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-4 = �o�b�t�@�̈�s��
-5 = �Ή����Ă��Ȃ�ID

%sample
; �T���v���X�N���v�g ���L��
// �i�[�ɕK�v�ȃT�C�Y���擾
size = smart_GetInfoStringSizeW(hSmart, 0, INFO_MODEL)
if size > 0{
	sdim buf, size + 2
	smart_GetInfoStringW hSmart, 0, INFO_MODEL, buf, size
	mes stat
	mes cnvwtos(buf)
}
%href
; �֘A���� ���L��
smart_GetInfoStringSizeW
INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetInfoStringW "smart_GetInfoStringW" int, int, int, var, int


%index
smart_GetInfoInt
; ���o�� ���L��
�f�B�X�N�̏����擾(32bit���l�^)
%prm
int1, int2, int3, var4
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)
var4	: ��񂪊i�[�����ϐ�

%inst
; ����� ���L��
�f�B�X�N�̏����擾���܂��B(32bit���l�^)
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_USBPRODUCTID			// USB�v���_�N�gID
INFO_USBVENDORID			// USB�x���_�[ID
INFO_ISSMARTENABLED			// S.M.A.R.T.���L�����ǂ����H(0 = ����, 1 = �L��)
INFO_ISIDINFOINCORRECT			// IsIdInfoIncorrect�H(0 = No, 1 = Yes)
INFO_ISSMARTCORRECT			// IsSmartCorrect�H(0 = No, 1 = Yes)
INFO_ISTHRESHOLDCORRECT			// IsThresholdCorrect�H(0 = No, 1 = Yes)
INFO_ISCHECKSUMERROR			// �`�F�b�N�T���G���[�̌��o�L���H(0 = ����, 1 = �L��)
INFO_ISWORD88				// IsWord88�H(0 = No, 1 = Yes)
INFO_ISWORD64_76			// IsWord64_76�H(0 = No, 1 = Yes)
INFO_ISRAWVALUES8			// IsRawValues8�H(0 = No, 1 = Yes)
INFO_ISRAWVALUES7			// IsRawValues7�H(0 = No, 1 = Yes)
INFO_IS9126MB				// 9126MB���ǂ����H(HDD�e�ʂ̕ǁH)(0 = No, 1 = Yes)
INFO_ISTHRESHOLDBUG			// ����@��̃t�@�[���o�O���o�H(0 = No, 1 = Yes)
INFO_ISSMARTSUPPORTED			// S.M.A.R.T.���T�|�[�g���Ă��邩�ǂ����H(0 = No, 1 = Yes)
INFO_ISLBA48SUPPORTED			// LBA48�Ή��H(0 = No, 1 = Yes)
INFO_ISAAMSUPPORTED			// AAM�Ή��H(0 = No, 1 = Yes)
INFO_ISAPMSUPPORTED			// APM�Ή��H(0 = No, 1 = Yes)
INFO_ISAAMENABLED			// AAM�L���H(0 = ����, 1 = �L��)
INFO_ISAPMENABLED			// APM�L���H(0 = ����, 1 = �L��)
INFO_ISNCQSUPPORTED			// NCQ�Ή��H(0 = No, 1 = Yes)
INFO_ISNVCACHESUPPORTED			// NV�L���b�V�����T�|�[�g���Ă�H(0 = No, 1 = Yes)
INFO_ISMAXTORMINUTE			// MaxtorMinute(0 = No, 1 = Yes)
INFO_ISSSD				// SSD���ǂ����H (0 = No, 1 = Yes)
INFO_ISTRIMSUPPORTED			// SSD��Trim���T�|�[�g���Ă��邩�H(0 = No, 1 = Yes)
INFO_PHYSICALDRIVEID			// �����h���C�uID
INFO_SCSIPORT				// SCSI�|�[�g
INFO_SCSITARGETID			// SCSI�^�[�Q�b�gID
INFO_SCSIBUS				// SCSI�o�X
INFO_SILICONIMAGETYPE			// Silicon Image Controller �^�C�v
INFO_TOTALDISKSIZE			// �ő�f�B�X�N�T�C�Y
INFO_CYLINDER				// �V�����_�[��
INFO_HEAD				// �w�b�h��
INFO_SECTOR				// �Z�N�^��
INFO_SECTOR28				// �Z�N�^��(28bit)
INFO_DISKSIZECHS			// CHS�Ŏ擾�����f�B�X�N�T�C�Y
INFO_DISKSIZELBA28			// LBA28�Ŏ擾�����f�B�X�N�T�C�Y
INFO_DISKSIZELBA48			// LBA48�Ŏ擾�����f�B�X�N�T�C�Y
INFO_DISKSIZEWMI			// WMI�Ŏ擾�����f�B�X�N�T�C�Y
INFO_BUFFERSIZE				// �o�b�t�@�T�C�Y
INFO_TRANSFERMODETYPE			// �]�����[�h(�߂�l��TRANSFER_MODE�Q��)
INFO_DETECTEDTIMEUNITTYPE		// Measured Time(�g�p����)�P��(�߂�l��POWER_ON�Q��)
INFO_MEASUREDTIMEUNITTYPE		// Detected Time(���o����)�P��(�߂�l��POWER_ON�Q��)
INFO_ATTRIBUTECOUNT			// S.M.A.R.T.�̍��ڐ�(�ő�30)
INFO_DETECTEDPOWERONHOURS		// �g�p����
INFO_MEASUREDPOWERONHOURS		// ���o����
INFO_POWERONRAWVALUE			// �g�p���Ԑ��̒l
INFO_POWERONSTARTRAWVALUE		// �g�p�J�n���Ԑ��̒l
INFO_POWERONCOUNT			// �d��������
INFO_TEMPERATURE			// ���x
INFO_NOMINALMEDIAROTATIONRATE		// ��]��(5400RPM�Ƃ�7200RPM�Ȃ�)
INFO_HOSTWRITES				// �������� (�z�X�g)
INFO_HOSTREADS				// ���Ǎ��� (�z�X�g)
INFO_GBYTESERASED			// �����f�[�^��(GB�P��)
INFO_NANDWRITES				// �������� (NAND)
INFO_WEARLEVELINGCOUNT			// �E�F�A���x�����O��
INFO_LIFE				// ����
INFO_MAJOR				// ���W���[
INFO_MINOR				// �}�C�i�[
INFO_DISKSTATUS				// �f�B�X�N�X�e�[�^�X(smart_CheckDiskStatus()�Ŏ擾�ł���l�Ɠ���)
INFO_DRIVELETTERMAP			// �h���C�u���^�[�}�b�v
INFO_ALARMTEMPERATURE			// �x�񉷓x
INFO_ALARMHEALTHSTATUS			// �x�񌒍N���
INFO_DISKVENDORID			// �f�B�X�N�x���_�[ID
INFO_USBVENDORID2			// USB�x���_�[ID
INFO_USBPRODUCTID2			// USB�v���_�N�gID
INFO_THRESHOLD05			// ���ӂƔ��肷��05 ��֏����σZ�N�^��(0�`255)
INFO_THRESHOLDC5			// ���ӂƔ��肷��C5 ��֏����ۗ����Z�N�^��(0�`255)
INFO_THRESHOLDC6			// ���ӂƔ��肷��C6 �񕜕s�\�Z�N�^��(0�`255)
INFO_TARGET				// �H
INFO_INTERFACETYPE			// �C���^�[�t�F�[�X(INTERFACE���Q��)
INFO_COMMANDTYPE			// �R�}���h�^�C�v(COMMAND���Q��)
INFO_THRESHOLDFF			// ���ӂƔ��肷��FF �c�����(0�`255)
INFO_ISDEVICESLEEPSUPPORTED		// DevSleep�ɑΉ����Ă��邩�H
INFO_HOSTREADSWRITESUNIT		// �z�X�g�̓ǂݏ����P�ʁH(HOSTREADSWRITESUNIT���Q��)
INFO_ISNVME						// NVMe ���ǂ����H
INFO_ISUASP						// UASP ���ǂ����H
INFO_IS_LOGICALSECTORSIZE		// LogicalSectorSize

��������ƁAstat��0�ɂȂ�A�w�肵���ϐ��ɒl���i�[����܂��B
�ϐ��Ɋi�[�����l�̓f�B�X�N���ID�ɂ���ĈႢ�܂��B

stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-5 = �Ή����Ă��Ȃ�ID
%sample
; �T���v���X�N���v�g ���L��
// ���x�擾
i = 0
smart_GetInfoInt hSmart, 0, INFO_TEMPERATURE, i
mes i
%href
; �֘A���� ���L��
INFO_LIST
TRANSFER_MODE
POWER_ON
INTERFACE
COMMAND
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetInfoInt "smart_GetInfoInt" int, int, int, var


%index
smart_GetInfoDouble
; ���o�� ���L��
�f�B�X�N�̏����擾(64bit�����^)
%prm
int1, int2, int3, var4
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)
var4	: ��񂪊i�[�����ϐ�

%inst
; ����� ���L��
�f�B�X�N�̏����擾���܂��B(64bit�����^)
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_TEMPERATUREMULTIPLIER			// ���x�Ŏg�p����{���l(�ʏ�1.0)

�����i�[����ϐ��͂��炩���ߏ��������Ă����Ă��������B
d = 0.0 �� ddim d, 1 �ŏ������ł��܂��B
��������ƁAstat��0�ɂȂ�A�w�肵���ϐ��ɒl���i�[����܂��B
�ϐ��Ɋi�[�����l�̓f�B�X�N���ID�ɂ���ĈႢ�܂��B

stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-5 = �Ή����Ă��Ȃ�ID

%sample
; �T���v���X�N���v�g ���L��
// ���擾
d = 0.0
smart_GetInfoDouble hSmart, 0, INFO_TEMPERATUREMULTIPLIER, d
mes d
%href
; �֘A���� ���L��
INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetInfoDouble "smart_GetInfoDouble" int, int, int, var


%index
smart_GetInfoInt64
; ���o�� ���L��
�f�B�X�N�̏����擾(64bit���l�^/32bit�����^�C�v)
%prm
int1, int2, int3, var4, var5
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)
var4	: ��񂪊i�[�����ϐ�(LowPart)
var5	: ��񂪊i�[�����ϐ�(HighPart)

%inst
; ����� ���L��
�f�B�X�N�̏����擾���܂��B(64bit���l�^/32bit�����^�C�v)
64bit�l��LowPart(32bit)�AHighPart(32bit)�ɕ������Ď擾���܂��B
64bit�l���̂܂܎擾����ꍇ�́Asmart_GetInfoInt64Ex���g�p���Ă��������B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_SECTOR48			// 48�r�b�gLBA�̃Z�N�^��
INFO_NUMBEROFSECTORS		// �Z�N�^�̐�
INFO_NVCACHESIZE		// NV�L���b�V���̃T�C�Y

��������ƁAstat��0�ɂȂ�A�w�肵���ϐ��ɒl���i�[����܂��B
�ϐ��Ɋi�[�����l�̓f�B�X�N���ID�ɂ���ĈႢ�܂��B

stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-5 = �Ή����Ă��Ȃ�ID

%sample
; �T���v���X�N���v�g ���L��
// ���擾
lp = 0 : hp = 0
smart_GetInfoInt64 hSmart, 0, INFO_SECTOR48, lp, hp
mes lp
mes hp
%href
; �֘A���� ���L��
smart_GetInfoInt64Ex
INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetInfoInt64 "smart_GetInfoInt64" int, int, int, var, var


%index
smart_GetInfoInt64Ex
; ���o�� ���L��
�f�B�X�N�̏����擾(64bit���l�^)
%prm
int1, int2, int3, var4
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)
var4	: ��񂪊i�[�����ϐ�

%inst
; ����� ���L��
�f�B�X�N�̏����擾���܂��B(64bit���l�^)
64bit�l�𒼐ڎ擾���܂��B
64bit�l�𕪊����Ď擾����ꍇ�́Asmart_GetInfoInt64���g�p���Ă��������B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_SECTOR48			// 48�r�b�gLBA�̃Z�N�^��
INFO_NUMBEROFSECTORS		// �Z�N�^�̐�
INFO_NVCACHESIZE		// NV�L���b�V���̃T�C�Y

��������ƁAstat��0�ɂȂ�A�w�肵���ϐ��ɒl���i�[����܂��B
�ϐ��͂��炩����dim��ddim�Adouble�Ȃǂ�8byte���A���������Ă��������B
�ϐ��Ɋi�[�����l�̓f�B�X�N���ID�ɂ���ĈႢ�܂��B

stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-5 = �Ή����Ă��Ȃ�ID
%sample
; �T���v���X�N���v�g ���L��
// ���擾
dim int64, 2
smart_GetInfoInt64Ex hSmart, 0, INFO_SECTOR48, int64
mes int64.0
mes int64.1
%href
; �֘A���� ���L��
smart_GetInfoInt64
INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetInfoInt64Ex "smart_GetInfoInt64Ex" int, int, int, var


%index
smart_GetInfoStructSize
; ���o�� ���L��
�\����/�z��^���̊i�[�ɕK�v�ȃT�C�Y���擾
%prm
(int1, int2, int3)
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)


%inst
; ����� ���L��
�\����/�z��^���̊i�[�ɕK�v�ȃT�C�Y���擾���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B
INFO_IDENTIFYDEVICE		// IDENTIFY_DEVICE �\���̎擾
INFO_SMARTREADDATA		// S.M.A.R.T. �f�[�^ BYTE�z��[512] �擾
INFO_SMARTREADTHRESHOLD		// S.M.A.R.T. �������l�f�[�^ BYTE�z��[512] �擾
INFO_ATTRIBUTE			// SMART_ATTRIBUTE �\����[30]�擾(S.M.A.R.T.�l)
INFO_THRESHOLD			// SMART_THRESHOLD �\����[30]�擾(S.M.A.R.T.�������l)

�߂�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-4 = �o�b�t�@�̈�s��
-5 = �Ή����Ă��Ȃ�ID

%sample
; �T���v���X�N���v�g ���L��
size = smart_GetInfoStructSize(hSmart, 0, INFO_ATTRIBUTE)
sdim buf, size
smart_GetInfoStruct hSmart, 0, INFO_ATTRIBUTE, buf, size
mes stat
%href
; �֘A���� ���L��
smart_GetInfoStruct
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetInfoStructSize "smart_GetInfoStruct" int, int, int, nullptr, nullptr


%index
smart_GetInfoStruct
; ���o�� ���L��
�f�B�X�N�̏����擾(�\����/�z��^)
%prm
int1, int2, int3, var4, int5
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: �擾�������f�B�X�N���ID(INFO_LIST���Q��)
var4	: ��񂪊i�[�����ϐ�
int5	: �ϐ��̃T�C�Y

%inst
; ����� ���L��
�f�B�X�N�̏����擾���܂��B(�\����/�z��^)
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

INFO_IDENTIFYDEVICE		// IDENTIFY_DEVICE �\���̎擾
INFO_SMARTREADDATA		// S.M.A.R.T. �f�[�^ BYTE�z��[512] �擾
INFO_SMARTREADTHRESHOLD		// S.M.A.R.T. �������l�f�[�^ BYTE�z��[512] �擾
INFO_ATTRIBUTE			// SMART_ATTRIBUTE �\����[30]�擾(S.M.A.R.T.�l)
INFO_THRESHOLD			// SMART_THRESHOLD �\����[30]�擾(S.M.A.R.T.�������l)

�����i�[����ϐ��͂��炩���ߏ��������Ă����Ă��������B
�K�v�ȃT�C�Y�� smart_GetInfoStructSize �Ŏ擾�ł��܂��B
��������ƁAstat��0�ɂȂ�A�w�肵���ϐ��ɒl���i�[����܂��B
�ϐ��Ɋi�[�����l�̓f�B�X�N���ID�ɂ���ĈႢ�܂��B

�߂�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)
-3 = NULL�|�C���^�G���[
-4 = �o�b�t�@�̈�s��
-5 = �Ή����Ă��Ȃ�ID

------------------------------------------------------------
// �\���̏��

	struct IDENTIFY_DEVICE
	{
		WORD		GeneralConfiguration;					//0
		WORD		LogicalCylinders;						//1	Obsolete
		WORD		SpecificConfiguration;					//2
		WORD		LogicalHeads;							//3 Obsolete
		WORD		Retired1[2];							//4-5
		WORD		LogicalSectors;							//6 Obsolete
		DWORD		ReservedForCompactFlash;				//7-8
		WORD		Retired2;								//9
		CHAR		SerialNumber[20];						//10-19
		WORD		Retired3;								//20
		WORD		BufferSize;								//21 Obsolete
		WORD		Obsolute4;								//22
		CHAR		FirmwareRev[8];							//23-26
		CHAR		Model[40];								//27-46
		WORD		MaxNumPerInterupt;						//47
		WORD		Reserved1;								//48
		WORD		Capabilities1;							//49
		WORD		Capabilities2;							//50
		DWORD		Obsolute5;								//51-52
		WORD		Field88and7064;							//53
		WORD		Obsolute6[5];							//54-58
		WORD		MultSectorStuff;						//59
		DWORD		TotalAddressableSectors;				//60-61
		WORD		Obsolute7;								//62
		WORD		MultiWordDma;							//63
		WORD		PioMode;								//64
		WORD		MinMultiwordDmaCycleTime;				//65
		WORD		RecommendedMultiwordDmaCycleTime;		//66
		WORD		MinPioCycleTimewoFlowCtrl;				//67
		WORD		MinPioCycleTimeWithFlowCtrl;			//68
		WORD		Reserved2[6];							//69-74
		WORD		QueueDepth;								//75
		WORD		SerialAtaCapabilities;					//76
		WORD		SerialAtaAdditionalCapabilities;				//77
		WORD		SerialAtaFeaturesSupported;				//78
		WORD		SerialAtaFeaturesEnabled;				//79
		WORD		MajorVersion;							//80
		WORD		MinorVersion;							//81
		WORD		CommandSetSupported1;					//82
		WORD		CommandSetSupported2;					//83
		WORD		CommandSetSupported3;					//84
		WORD		CommandSetEnabled1;						//85
		WORD		CommandSetEnabled2;						//86
		WORD		CommandSetDefault;						//87
		WORD		UltraDmaMode;							//88
		WORD		TimeReqForSecurityErase;				//89
		WORD		TimeReqForEnhancedSecure;				//90
		WORD		CurrentPowerManagement;					//91
		WORD		MasterPasswordRevision;					//92
		WORD		HardwareResetResult;					//93
		WORD		AcoustricManagement;					//94
		WORD		StreamMinRequestSize;					//95
		WORD		StreamingTimeDma;						//96
		WORD		StreamingAccessLatency;					//97
		DWORD		StreamingPerformance;					//98-99
		ULONGLONG	MaxUserLba;								//100-103
		WORD		StremingTimePio;						//104
		WORD		Reserved3;								//105
		WORD		SectorSize;								//106
		WORD		InterSeekDelay;							//107
		WORD		IeeeOui;								//108
		WORD		UniqueId3;								//109
		WORD		UniqueId2;								//110
		WORD		UniqueId1;								//111
		WORD		Reserved4[4];							//112-115
		WORD		Reserved5;								//116
		DWORD		WordsPerLogicalSector;					//117-118
		WORD		Reserved6[8];							//119-126
		WORD		RemovableMediaStatus;					//127
		WORD		SecurityStatus;							//128
		WORD		VendorSpecific[31];						//129-159
		WORD		CfaPowerMode1;							//160
		WORD		ReservedForCompactFlashAssociation[7];	//161-167
		WORD		DeviceNominalFormFactor;				//168
		WORD		DataSetManagement;						//169
		WORD		AdditionalProductIdentifier[4];			//170-173
		WORD		Reserved7[2];							//174-175
		CHAR		CurrentMediaSerialNo[60];				//176-205
		WORD		SctCommandTransport;					//206
		WORD		ReservedForCeAta1[2];					//207-208
		WORD		AlignmentOfLogicalBlocks;				//209
		DWORD		WriteReadVerifySectorCountMode3;		//210-211
		DWORD		WriteReadVerifySectorCountMode2;		//212-213
		WORD		NvCacheCapabilities;					//214
		DWORD		NvCacheSizeLogicalBlocks;				//215-216
		WORD		NominalMediaRotationRate;				//217
		WORD		Reserved8;								//218
		WORD		NvCacheOptions1;						//219
		WORD		NvCacheOptions2;						//220
		WORD		Reserved9;								//221
		WORD		TransportMajorVersionNumber;			//222
		WORD		TransportMinorVersionNumber;			//223
		WORD		ReservedForCeAta2[10];					//224-233
		WORD		MinimumBlocksPerDownloadMicrocode;		//234
		WORD		MaximumBlocksPerDownloadMicrocode;		//235
		WORD		Reserved10[19];							//236-254
		WORD		IntegrityWord;							//255
	};

	typedef	struct SMART_ATTRIBUTE
	{
		BYTE	Id;
		WORD	StatusFlags;
		BYTE	CurrentValue;
		BYTE	WorstValue;
		BYTE	RawValue[6];
		BYTE	Reserved;
	};

	typedef	struct SMART_THRESHOLD
	{
		BYTE	Id;
		BYTE	ThresholdValue;
		BYTE	Reserved[10];
	};
------------------------------------------------------------

%sample
; �T���v���X�N���v�g ���L��
size = smart_GetInfoStructSize(hSmart, 0, INFO_ATTRIBUTE)
sdim buf, size
smart_GetInfoStruct hSmart, 0, INFO_ATTRIBUTE, buf, size
mes stat
%href
; �֘A���� ���L��
smart_GetInfoStructSize
INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetInfoStruct "smart_GetInfoStruct" int, int, int, var, int


%index
smart_GetSmartInfoInt64Ex
; ���o�� ���L��
S.M.A.R.T. �����擾���܂�(64bit)
%prm
int1, int2, var3, var4, var5, var6, var7, var8
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
var3	: S.M.A.R.T. ID ���i�[����z��ϐ�(32bit����)
var4	: �X�e�[�^�X�t���O���i�[����z��ϐ�(32bit����)
var5	: ���ݒl���i�[����z��ϐ�(32bit����)
var6	: �ň��l���i�[����z��ϐ�(32bit����)
var7	: �������l���i�[����z��ϐ�(32bit����)
var8	: ���̒l���i�[����z��ϐ�(64bit����[HSP�ł�double�ő�p���܂�])

%inst
; ����� ���L��
S.M.A.R.T. �����擾���܂��B
64bit�l�𕪊����Ď擾����ꍇ�� smart_GetSmartInfoInt64 ���g�p���Ă��������B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_max = smart_GetSmartMaxAttribute()
dim Id, smart_max
dim StatusFlags, smart_max
dim CurrentValue, smart_max
dim WorstValue, smart_max
dim ThresholdValue, smart_max
ddim RawValue, smart_max
smart_GetSmartInfoInt64Ex hSmart, 0, Id, StatusFlags, CurrentValue, WorstValue, ThresholdValue, RawValue
sdim out_smart, 1024
out_smart = "ID\t���ݒl\t�ň��l\t臒l\t���̒l\n"
repeat smart_max
	if Id.cnt != 0 {
		out_smart += strf("%02X", Id.cnt) + "\t"
		out_smart += strf("%d", CurrentValue.cnt) + "\t"
		out_smart += strf("%d", WorstValue.cnt) + "\t"
		out_smart += strf("%d", ThresholdValue.cnt) + "\t"
		out_smart += strf("0x%012I64X (%I64d)", RawValue.cnt, RawValue.cnt)
		out_smart += "\n"
	}
loop
mes out_smart
%href
; �֘A���� ���L��
smart_GetSmartInfoInt64
smart_GetSmartAttributeName
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetSmartInfoInt64Ex "smart_GetSmartInfoInt64Ex" int, int, var, var, var, var, var, var


%index
smart_GetSmartInfoInt64
; ���o�� ���L��
S.M.A.R.T. �����擾���܂�(64bit��32bit������)
%prm
int1, int2, var3, var4, var5, var6, var7, var8, var9
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
var3	: S.M.A.R.T. ID ���i�[����z��ϐ�(32bit����)
var4	: �X�e�[�^�X�t���O���i�[����z��ϐ�(32bit����)
var5	: ���ݒl���i�[����z��ϐ�(32bit����)
var6	: �ň��l���i�[����z��ϐ�(32bit����)
var7	: �������l���i�[����z��ϐ�(32bit����)
var8	: ���̒l(LowPart)���i�[����z��ϐ�(32bit)
var9	: ���̒l(HighPart)���i�[����z��ϐ�(32bit)
%inst
; ����� ���L��
S.M.A.R.T. �����擾���܂��B
64bit�l��32bit���������Ď擾����܂��B
64bit�l�𒼐ڎ擾����ꍇ�� smart_GetSmartInfoInt64Ex ���g�p���Ă��������B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B
�擾�������f�B�X�N���ID �͈ȉ��̂��̂��w��ł��܂��B

stat�l
0  = ����
-1 = ����n���h������
-2 = �����G���[(�f�B�X�N�ԍ����͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_max = smart_GetSmartMaxAttribute()
dim Id, smart_max
dim StatusFlags, smart_max
dim CurrentValue, smart_max
dim WorstValue, smart_max
dim ThresholdValue, smart_max
ddim RawValue, smart_max
smart_GetSmartInfoInt64Ex hSmart, 0, Id, StatusFlags, CurrentValue, WorstValue, ThresholdValue, RawValue
sdim out_smart, 1024
out_smart = "ID\t���ݒl\t�ň��l\t臒l\t���̒l\n"
repeat smart_max
	if Id.cnt != 0 {
		out_smart += strf("%02X", Id.cnt) + "\t"
		out_smart += strf("%d", CurrentValue.cnt) + "\t"
		out_smart += strf("%d", WorstValue.cnt) + "\t"
		out_smart += strf("%d", ThresholdValue.cnt) + "\t"
		out_smart += strf("0x%012I64X (%I64d)", RawValue.cnt, RawValue.cnt)
		out_smart += "\n"
	}
loop
mes out_smart
%href
; �֘A���� ���L��
smart_GetSmartInfoInt64Ex
smart_GetSmartAttributeName
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_GetSmartInfoInt64 "smart_GetSmartInfoInt64" int, int, var, var, var, var, var, var, var


%index
smart_GetSmartMaxAttribute
; ���o�� ���L��
S.M.A.R.T.�̍��ڂ̍ő吔�擾
%prm
()

%inst
; ����� ���L��
S.M.A.R.T.�̍��ڂ̍ő吔���Ԃ�܂��B
�ʏ��30�ł��B
S.M.A.R.T.�̍��ڐ����擾����ꍇ�́Asmart_GetInfoInt��INFO_ATTRIBUTECOUNT���Ăяo���Ă��������B

%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
smart_GetInfoInt
smart_GetSmartAttributeName
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #cfunc smart_GetSmartMaxAttribute "smart_GetSmartMaxAttribute"


%index
smart_ShellExecuteExAdminW
; ���o�� ���L��
�w��v���Z�X���Ǘ��Ҍ������ŋN������
%prm
wstr1, wstr2
wstr1	: ���s�t�@�C����(������, �����l)
wstr2	: �R�}���h���C��(������, �����l)

%inst
; ����� ���L��
�w��v���Z�X���Ǘ��Ҍ������ŋN�����܂��B
�����G���R�[�h��Unicode�ł����A������Shift_JIS����UTF-16�ɕϊ�����邽�߁Acnvstow�Ȃǂŕϊ�����K�v�͂Ȃ��ł��B

�ʏ�́A���s�t�@�C�����A�R�}���h���C���ɕ�������w�肵�܂��B
�ȉ��͓���Ȏg�����ɂ��Đ������Ă���܂��B

���s�t�@�C�����𐮐��l��0�ɂ����ꍇ�́A�������g���w�肳��܂��B�i�������g�̋N���j
���s�t�@�C������ "test.exe"�̏ꍇ�A
smart_ShellExecuteExAdminW 0, "-help"
��
smart_ShellExecuteExAdminW "test.exe", "-help"
�͓����Ӗ��ɂȂ�܂��B

���s�t�@�C�����A�R�}���h���C�����ɐ����l��0�ɂ����ꍇ�́A�������g���N������A�������g�̃R�}���h���C�����w�肳��܂��B
smart_ShellExecuteExAdminW 0, 0

�R�}���h���C�����K�v�Ȃ��ꍇ�́A"" �Ƌ󕶎��ɂ��Ă��������B
smart_ShellExecuteExAdminW 0, ""

smart_ShellExecuteExAdminW 0, 0
�ƋL�q�����ꍇ��
smart_AdminSelfRunW
�Ɠ�������ɂȂ�܂��B

����Ɏ��s���ꂽ�ꍇ��stat�� 0 ���������܂��B
0  = ����I��
-1 = �R�}���h���C���̃G���[
-2 = ���s�G���[
%sample
; �T���v���X�N���v�g ���L��
// ���������J���Ă݂�(�t�@�C����p�ӂ���K�v����)
smart_ShellExecuteExAdminW "notepad", "\"C:\\���{��e�X�g.txt\""
%href
; �֘A���� ���L��
smart_IsCurrentUserLocalAdministrator
smart_AdminSelfRunW
smart_Init
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_ShellExecuteExAdminW "smart_ShellExecuteExAdminW" wstr, wstr


%index
smart_AdminSelfRunW
; ���o�� ���L��
�������g���Ǘ��Ҍ����t���ŋN������
%prm
�����Ȃ�

%inst
; ����� ���L��
�������g���Ǘ��Ҍ����t���ŋN�����܂��B
�N�����ɕt�����ꂽ�R�}���h���C���͈����p����܂��B
�����p���K�v���Ȃ��ꍇ�́Asmart_ShellExecuteExAdminW���g�p���Ă��������B
�����I�ɂ� smart_ShellExecuteExAdminW��������0�ŌĂяo���Ă��܂��B
����Ɏ��s���ꂽ�ꍇ��stat�� 0 ���������܂��B
0  = ����I��
-1 = �R�}���h���C���̃G���[
-2 = ���s�G���[
%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
smart_ShellExecuteExAdminW
smart_IsCurrentUserLocalAdministrator
%group
; �O���[�v ���L��
hspsmart.dll
; ��` : [hspsmart.hsp] #func smart_AdminSelfRunW "smart_ShellExecuteExAdminW" nullptr, nullptr


%index
smart_GetInfoMax
; ���o�� ���L��
�擾�\�ȃf�B�X�N���ID�̍ő吔���擾
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
()

%inst
; ����� ���L��
�擾�\�ȃf�B�X�N���ID�̍ő吔���擾���܂��B
%sample
; �T���v���X�N���v�g ���L��
mes smart_GetInfoMax()
%href
; �֘A���� ���L��

%group
; �O���[�v ���L��
hspsmart.dll
%index
smart_SetThreshold
; ���o�� ���L��
���N��Ԃ̊�l(臒l)���w��
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
int1, int2, int3, int4, int5, int6
int1	: ����n���h��(smart_Init()�����s���Ď擾����)
int2	: �f�B�X�N�ԍ�(0�`)
int3	: 05 ��֏����σZ�N�^��(0�`255, -1 ���w�肷��Ɩ�������܂�)
int4	: C5 ��֏����ۗ����Z�N�^��(0�`255, -1 ���w�肷��Ɩ�������܂�)
int5	: C6 �񕜕s�\�Z�N�^��(0�`255, -1 ���w�肷��Ɩ�������܂�)
int6	: FF �c�����(0�`255, -1 ���w�肷��Ɩ�������܂�)
%inst
; ����� ���L��
���N��Ԃ̊�l(臒l)���w�肵�܂��B
���N��Ԃ̊�l(臒l)�̌��ݒl���擾����ɂ́Asmart_GetInfoInt()�����s���܂��B
�f�B�X�N�ԍ���0�Ԃ���n�܂�A�ő吔�� smart_GetCount() �Ŏ擾�ł��܂��B

�ύX����K�v�̂Ȃ��Ƃ���� -1 ���w�肷��ƁA�ύX����܂���B

stat �� 0 �̏ꍇ�͐������Ă��܂��B
0  = ����
-1 = ����n���h������
-2 = �����G���[(�l���͈͊O)

%sample
; �T���v���X�N���v�g ���L��
smart_SetThreshold hSmart, 0, 1, 1, 1, -1
%href
; �֘A���� ���L��
smart_CheckDiskStatus
smart_GetInfoInt
%group
; �O���[�v ���L��
hspsmart.dll
%index
smart_GetSmartAttributeName
; ���o�� ���L��
S.M.A.R.T. �̍��ږ����擾���܂�
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
(str1, int1, str2)
str1 : SMART�L�[��(smart_GetInfoStringW��INFO_SMARTKEYNAME����擾�ł��܂�)
int1 : smartID
str2 : S.M.A.R.T. �̍��ږ����L�q���ꂽini�t�@�C���p�X(��΃p�X)
%inst
; ����� ���L��
S.M.A.R.T. �̍��ږ����擾���܂��B

%sample
; �T���v���X�N���v�g ���L��
#include "hspsmart.as"

	title "�f�B�X�N��I�����Ă�������"
	
	// ����������
	hSmart = smart_Init()
	
	// USB/IEEE1394�ڑ���HDD�����o�Ώۂɂ���
	smart_SetUSB1394 hSmart, FLAG_USB_ALL
	// IDE/ATA_PASS_THROUGH ���g�p���܂�(��肪����ꍇ��OFF��)
	smart_SetAtaPassThroughSmart hSmart, 1
	// IntelRAID������CSMI�������L���ɂ���
	smart_SetCsmiType hSmart, CSMI_TYPE_ENABLE_AUTO
	
	// �f�B�X�N�����o����(CDI�̍Č��o�Ɠ���)
	// ����N������f�B�X�N���ォ��ǉ��E�ύX�E�폜���ꂽ�肵���Ƃ��Ɏ��s���Ă�������
	// ���̏����͂��d���ł��B�Đ����̉�������u�r�؂�邱�Ƃ�����܂��B
	smart_DiskScan hSmart, 1, 1, 0, 1, 1
	
	if smart_GetCount(hSmart) <= 0{
		dialog "�f�B�X�N���Ȃ����A�G���[���������܂���"
		end
	}
	
	// �f�B�X�N�ꗗ�쐬
	sdim disklist, 1024
	repeat smart_GetCount(hSmart)
		// �i�[�ɕK�v�ȃT�C�Y���擾
		size = smart_GetInfoStringSizeW(hSmart, cnt, INFO_MODEL)
		sdim buf, size + 2
		// ���f�����擾
		smart_GetInfoStringW hSmart, cnt, INFO_MODEL, buf, size
		disklist += cnvwtos(buf) + "\n"
	loop
	
	// GUI
	width 320, 200
	objsize 320, 180
	listbox disk_id, 0, disklist
	objsize 320, 20
	button "�I�������f�B�X�N�̏�������", *go

stop
*go
	cls
	
	notesel disklist
	noteget diskname, disk_id
	title diskname
	
	width 640, 480
	// SMART�L�[���擾
	size = smart_GetInfoStringSizeW(hSmart, disk_id, INFO_SMARTKEYNAME)
	sdim keyname, size + 2
	smart_GetInfoStringW hSmart, disk_id, INFO_SMARTKEYNAME, keyname, size
	keyname = cnvwtos(keyname)
	
	// SMART���擾
	smart_max = smart_GetSmartMaxAttribute()
	dim Id, smart_max
	dim StatusFlags, smart_max
	dim CurrentValue, smart_max
	dim WorstValue, smart_max
	dim ThresholdValue, smart_max
	ddim RawValue, smart_max
	smart_GetSmartInfoInt64Ex hSmart, disk_id, Id, StatusFlags, CurrentValue, WorstValue, ThresholdValue, RawValue
	sdim out_smart, 1024
	out_smart = "ID\t���ږ�\t\t\t\t\t���ݒl\t�ň��l\t臒l\t���̒l\n"
	repeat smart_max
		if Id.cnt != 0 {
			
			out_smart += strf("%02X", Id.cnt) + "\t"
			
			smart_att = smart_GetSmartAttributeName(keyname, Id.cnt, dir_cur + "\\smart.ini")
			out_smart += smart_att
			
			repeat 40-strlen(smart_att)
				out_smart += " "
			loop
			
			out_smart += strf("%d", CurrentValue.cnt) + "\t"
			out_smart += strf("%d", WorstValue.cnt) + "\t"
			out_smart += strf("%d", ThresholdValue.cnt) + "\t"
			out_smart += strf("0x%012I64X (%I64d)", RawValue.cnt, RawValue.cnt)
			out_smart += "\n"
		}
	loop
	
	font "MS Gothic", 12
	objmode 2, 1
	mesbox out_smart, 640, 480
	
	smart_UnInit hSmart
%href
; �֘A���� ���L��
smart_GetSmartInfoInt64
smart_GetSmartInfoInt64Ex
smart_GetSmartMaxAttribute
%group
; �O���[�v ���L��

hspsmart.dll
%index
INFO_LIST
; ���o�� ���L��
�擾�\�ȃf�B�X�N���ID�ꗗ
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
���߁E�֐��ł͂���܂���
%inst
; ����� ���L��

�y������^�z�ysmart_GetInfoStringW�z�Ŏw��\�ȃf�B�X�N���ID
-------------------------------------------------------------------
INFO_ENCLOSURE			// �f�B�X�N�G���N���[�W��
INFO_SERIALNUMBER		// �V���A���i���o�[
INFO_SERIALNUMBERREVERSE	// �V���A���i���o�[���t�]��������
INFO_FIRMWAREREV		// �t�@�[���E�F�A�̃����B�W����
INFO_FIRMWAREREVREVERSE		// �t�@�[���E�F�A�̃����B�W�������t�]��������
INFO_MODEL			// ���f����
INFO_MODELREVERSE		// ���f�������t�]��������
INFO_MODELWMI			// WMI����擾�������f����
INFO_MODELSERIAL		// ���f����
INFO_DRIVEMAP			// �h���C�u�}�b�v(C: D: �Ƃ�)
INFO_MAXTRANSFERMODE		// �ő�]�����[�h
INFO_CURRENTTRANSFERMODE	// ���݂̓]�����[�h
INFO_MAJORVERSION		// �Ή��K�i
INFO_MINORVERSION		// �Ή��K�i
INFO_INTERFACE			// �C���^�[�t�F�[�X(SATA�Ƃ�)
INFO_ENCLOSURE2			// �f�B�X�N�G���N���[�W��
INFO_COMMANDTYPESTRING		// �R�}���h�^�C�v
INFO_SSDVENDORSTRING		// SSD�x���_�[��
INFO_DEVICENOMINALFORMFACTOR	// �t�H�[���t�@�N�^(2.5�C���`�Ƃ�3.5�C���`)
INFO_PNPDEVICEID		// PnpDeviceId
INFO_SMARTKEYNAME		// S.M.A.R.T.���ږ����o�p�L�[��
-------------------------------------------------------------------
�y32bit���l�^�z�ysmart_GetInfoInt�z�Ŏw��\�ȃf�B�X�N���ID
-------------------------------------------------------------------
INFO_USBPRODUCTID			// USB�v���_�N�gID
INFO_USBVENDORID			// USB�x���_�[ID
INFO_ISSMARTENABLED			// S.M.A.R.T.���L�����ǂ����H(0 = ����, 1 = �L��)
INFO_ISIDINFOINCORRECT			// IsIdInfoIncorrect�H(0 = No, 1 = Yes)
INFO_ISSMARTCORRECT			// IsSmartCorrect�H(0 = No, 1 = Yes)
INFO_ISTHRESHOLDCORRECT			// IsThresholdCorrect�H(0 = No, 1 = Yes)
INFO_ISCHECKSUMERROR			// �`�F�b�N�T���G���[�̌��o�L���H(0 = ����, 1 = �L��)
INFO_ISWORD88				// IsWord88�H(0 = No, 1 = Yes)
INFO_ISWORD64_76			// IsWord64_76�H(0 = No, 1 = Yes)
INFO_ISRAWVALUES8			// IsRawValues8�H(0 = No, 1 = Yes)
INFO_ISRAWVALUES7			// IsRawValues7�H(0 = No, 1 = Yes)
INFO_IS9126MB				// 9126MB���ǂ����H(HDD�e�ʂ̕ǁH)(0 = No, 1 = Yes)
INFO_ISTHRESHOLDBUG			// ����@��̃t�@�[���o�O���o�H(0 = No, 1 = Yes)
INFO_ISSMARTSUPPORTED			// S.M.A.R.T.���T�|�[�g���Ă��邩�ǂ����H(0 = No, 1 = Yes)
INFO_ISLBA48SUPPORTED			// LBA48�Ή��H(0 = No, 1 = Yes)
INFO_ISAAMSUPPORTED			// AAM�Ή��H(0 = No, 1 = Yes)
INFO_ISAPMSUPPORTED			// APM�Ή��H(0 = No, 1 = Yes)
INFO_ISAAMENABLED			// AAM�L���H(0 = ����, 1 = �L��)
INFO_ISAPMENABLED			// APM�L���H(0 = ����, 1 = �L��)
INFO_ISNCQSUPPORTED			// NCQ�Ή��H(0 = No, 1 = Yes)
INFO_ISNVCACHESUPPORTED			// NV�L���b�V�����T�|�[�g���Ă�H(0 = No, 1 = Yes)
INFO_ISMAXTORMINUTE			// MaxtorMinute(0 = No, 1 = Yes)
INFO_ISSSD				// SSD���ǂ����H (0 = No, 1 = Yes)
INFO_ISTRIMSUPPORTED			// SSD��Trim���T�|�[�g���Ă��邩�H(0 = No, 1 = Yes)
INFO_PHYSICALDRIVEID			// �����h���C�uID
INFO_SCSIPORT				// SCSI�|�[�g
INFO_SCSITARGETID			// SCSI�^�[�Q�b�gID
INFO_SCSIBUS				// SCSI�o�X
INFO_SILICONIMAGETYPE			// Silicon Image Controller �^�C�v
INFO_TOTALDISKSIZE			// ���v�f�B�X�N�T�C�Y
INFO_CYLINDER				// �V�����_�[��
INFO_HEAD				// �w�b�h��
INFO_SECTOR				// �Z�N�^��
INFO_SECTOR28				// �Z�N�^��(28bit)
INFO_DISKSIZECHS			// CHS�Ŏ擾�����f�B�X�N�T�C�Y
INFO_DISKSIZELBA28			// LBA28�Ŏ擾�����f�B�X�N�T�C�Y
INFO_DISKSIZELBA48			// LBA48�Ŏ擾�����f�B�X�N�T�C�Y
INFO_DISKSIZEWMI			// WMI�Ŏ擾�����f�B�X�N�T�C�Y
INFO_BUFFERSIZE				// �o�b�t�@�T�C�Y
INFO_TRANSFERMODETYPE			// �]�����[�h(�߂�l��TRANSFER_MODE�Q��)
INFO_DETECTEDTIMEUNITTYPE		// Measured Time(�g�p����)�P��(�߂�l��POWER_ON�Q��)
INFO_MEASUREDTIMEUNITTYPE		// Detected Time(���o����)�P��(�߂�l��POWER_ON�Q��)
INFO_ATTRIBUTECOUNT			// S.M.A.R.T.�̍��ڐ�(�ő�30)
INFO_DETECTEDPOWERONHOURS		// �g�p����
INFO_MEASUREDPOWERONHOURS		// ���o����
INFO_POWERONRAWVALUE			// �g�p���Ԑ��̒l
INFO_POWERONSTARTRAWVALUE		// �g�p�J�n���Ԑ��̒l
INFO_POWERONCOUNT			// �d��������
INFO_TEMPERATURE			// ���x
INFO_NOMINALMEDIAROTATIONRATE		// ��]��(5400RPM�Ƃ�7200RPM�Ȃ�)
INFO_HOSTWRITES				// �������� (�z�X�g)
INFO_HOSTREADS				// ���Ǎ��� (�z�X�g)
INFO_GBYTESERASED			// �����f�[�^��(GB�P��)
INFO_NANDWRITES				// �������� (NAND)
INFO_WEARLEVELINGCOUNT			// �E�F�A���x�����O��
INFO_LIFE				// ����
INFO_MAJOR				// ���W���[
INFO_MINOR				// �}�C�i�[
INFO_DISKSTATUS				// �f�B�X�N�X�e�[�^�X(smart_CheckDiskStatus()�Ŏ擾�ł���l�Ɠ���)
INFO_DRIVELETTERMAP			// �h���C�u���^�[�}�b�v
INFO_ALARMTEMPERATURE			// �x�񉷓x
INFO_ALARMHEALTHSTATUS			// �x�񌒍N���
INFO_DISKVENDORID			// �f�B�X�N�x���_�[ID
INFO_USBVENDORID2			// USB�x���_�[ID
INFO_USBPRODUCTID2			// USB�v���_�N�gID
INFO_THRESHOLD05			// ���ӂƔ��肷��05 ��֏����σZ�N�^��(0�`255)
INFO_THRESHOLDC5			// ���ӂƔ��肷��C5 ��֏����ۗ����Z�N�^��(0�`255)
INFO_THRESHOLDC6			// ���ӂƔ��肷��C6 �񕜕s�\�Z�N�^��(0�`255)
INFO_TARGET				// �H
INFO_INTERFACETYPE			// �C���^�[�t�F�[�X(INTERFACE���Q��)
INFO_COMMANDTYPE			// �R�}���h�^�C�v(COMMAND���Q��)
INFO_THRESHOLDFF			// ���ӂƔ��肷��FF �c�����(0�`255)
INFO_ISDEVICESLEEPSUPPORTED		// DevSleep�ɑΉ����Ă��邩�H
INFO_HOSTREADSWRITESUNIT		// �z�X�g�̓ǂݏ����P�ʁH(HOSTREADSWRITESUNIT���Q��)
INFO_ISNVME						// NVMe ���ǂ����H
INFO_ISUASP						// UASP ���ǂ����H
INFO_IS_LOGICALSECTORSIZE		// LogicalSectorSize
-------------------------------------------------------------------
�y64bit�����^�z�ysmart_GetInfoDouble�z�Ŏw��\�ȃf�B�X�N���ID
-------------------------------------------------------------------
INFO_TEMPERATUREMULTIPLIER			// ���x�Ŏg�p����{���l(�ʏ�1.0)
-------------------------------------------------------------------
�y�\����/�z��^�z�ysmart_GetInfoStruct�z�Ŏw��\�ȃf�B�X�N���ID
-------------------------------------------------------------------
INFO_IDENTIFYDEVICE		// IDENTIFY_DEVICE �\���̎擾
INFO_SMARTREADDATA		// S.M.A.R.T. �f�[�^ BYTE�z��[512] �擾
INFO_SMARTREADTHRESHOLD		// S.M.A.R.T. �������l�f�[�^ BYTE�z��[512] �擾
INFO_ATTRIBUTE			// SMART_ATTRIBUTE �\����[30]�擾(S.M.A.R.T.�l)
INFO_THRESHOLD			// SMART_THRESHOLD �\����[30]�擾(S.M.A.R.T.�������l)
-------------------------------------------------------------------
�y64bit�����^�z�ysmart_GetInfoInt64/Ex�z�Ŏw��\�ȃf�B�X�N���ID
-------------------------------------------------------------------
INFO_SECTOR48			// 48�r�b�gLBA�̃Z�N�^��
INFO_NUMBEROFSECTORS		// �Z�N�^�̐�
INFO_NVCACHESIZE		// NV�L���b�V���̃T�C�Y

%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
smart_GetInfoStringW
smart_GetInfoInt
smart_GetInfoDouble
smart_GetInfoStruct
smart_GetInfoInt64
smart_GetInfoInt64Ex
%group
; �O���[�v ���L��
hspsmart.dll
%index
TRANSFER_MODE
; ���o�� ���L��
�]�����[�h
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
���߁E�֐��ł͂���܂���
%inst
; ����� ���L��
smart_GetInfoInt��INFO_TRANSFERMODETYPE���w�肵�����ɕԂ��Ă��܂��B
TRANSFER_MODE_UNKNOWN 		= 0	 // �s��
TRANSFER_MODE_PIO		= 1	 // PIO���[�h
TRANSFER_MODE_PIO_DMA		= 2	 // PIO/DMA���[�h
TRANSFER_MODE_ULTRA_DMA_16	= 3	 // UltraDMA16���[�h
TRANSFER_MODE_ULTRA_DMA_25	= 4	 // UltraDMA25���[�h
TRANSFER_MODE_ULTRA_DMA_33	= 5	 // UltraDMA33���[�h
TRANSFER_MODE_ULTRA_DMA_44	= 6	 // UltraDMA44���[�h
TRANSFER_MODE_ULTRA_DMA_66	= 7	 // UltraDMA66���[�h
TRANSFER_MODE_ULTRA_DMA_100	= 8	 // UltraDMA100���[�h
TRANSFER_MODE_ULTRA_DMA_133	= 9	 // UltraDMA133���[�h
TRANSFER_MODE_SATA_150		= 10	 // SATA/150
TRANSFER_MODE_SATA_300		= 11	 // SATA/300
TRANSFER_MODE_SATA_600		= 12	 // SATA/600
%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
smart_GetInfoInt
INFO_LIST
%group
; �O���[�v ���L��
hspsmart.dll
%index
POWER_ON
; ���o�� ���L��
���ԒP��
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
���߁E�֐��ł͂���܂���
%inst
; ����� ���L��
smart_GetInfoInt��INFO_DETECTEDTIMEUNITTYPE�AMEASUREDTIMEUNITTYPE���w�肵�����ɕԂ��Ă��܂��B

POWER_ON_UNKNOWN	 = 0	// �s��
POWER_ON_HOURS		 = 1	// 1���ԒP��
POWER_ON_MINUTES	 = 2	// 1���ԒP��
POWER_ON_HALF_MINUTES	 = 3	// 30�b�P��
POWER_ON_SECONDS	 = 4	// 1�b�P��
POWER_ON_10_MINUTES	 = 5	// 10���P��
POWER_ON_MILLI_SECONDS	 = 6	// 1�~���b�P��
%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
INFO_LIST
smart_GetInfoInt
%group
; �O���[�v ���L��
hspsmart.dll
%index
INTERFACE
; ���o�� ���L��
�C���^�[�t�F�[�X
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
���߁E�֐��ł͂���܂���
%inst
; ����� ���L��
#define	global INTERFACE_TYPE_UNKNOWN	 	 0	// �s��
#define	global INTERFACE_TYPE_PATA	 		 1	// �p������ATA/IDE
#define	global INTERFACE_TYPE_SATA	 		 2	// �V���A��ATA
#define	global INTERFACE_TYPE_USB	 		 3	// USB
#define	global INTERFACE_TYPE_IEEE1394	 	 4	// IEEE1394
#define global INTERFACE_TYPE_SCSI			 5	// SCSI
%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
INFO_LIST
smart_GetInfoInt
%group
; �O���[�v ���L��
hspsmart.dll
%index
COMMAND
; ���o�� ���L��
�R�}���h�^�C�v
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
���߁E�֐��ł͂���܂���
%inst
; ����� ���L��
// �萔�l�͕ύX�����\��������܂�
#define	global CMD_TYPE_UNKNOWN			  0
#define	global CMD_TYPE_PHYSICAL_DRIVE	  1
#define	global CMD_TYPE_SCSI_MINIPORT	  2
#define	global CMD_TYPE_SILICON_IMAGE	  3
#define	global CMD_TYPE_SAT				  4		// SAT = SCSI_ATA_TRANSLATION
#define	global CMD_TYPE_SUNPLUS			  5
#define	global CMD_TYPE_IO_DATA			  6
#define	global CMD_TYPE_LOGITEC1		  7
#define	global CMD_TYPE_LOGITEC2		  8
#define	global CMD_TYPE_JMICRON			  9
#define	global CMD_TYPE_CYPRESS			  10	
#define	global CMD_TYPE_SAT_ASM1352R	11	// AMS1352 2nd drive
#define	global CMD_TYPE_CSMI	 		  12	// CSMI = Common Storage Management Interface 
#define	global CMD_TYPE_CSMI_PHYSICAL_DRIVE	13	// CSMI = Common Storage Management Interface 
#define	global CMD_TYPE_WMI				  14
#define	global CMD_TYPE_NVME_SAMSUNG	  15
#define	global CMD_TYPE_NVME_INTEL		  16
#define	global CMD_TYPE_NVME_STORAGE_QUERY 17
#define	global CMD_TYPE_NVME_JMICRON		18
#define	global CMD_TYPE_NVME_ASMEDIA		19
#define	global CMD_TYPE_NVME_REALTEK		20
#define	global CMD_TYPE_NVME_INTEL_RST		21
#define	global CMD_TYPE_DEBUG			  22
%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
INFO_LIST
smart_GetInfoInt
%group
; �O���[�v ���L��
hspsmart.dll
%index
HOSTREADSWRITESUNIT
; ���o�� ���L��
�R�}���h�^�C�v
%prm
; �p�����[�^���X�g ���L��
; �p�����[�^������ ���L��
���߁E�֐��ł͂���܂���
%inst
; ����� ���L��
// �萔�l�͕ύX�����\��������܂�
HOST_READS_WRITES_UNKNOWN = 0
HOST_READS_WRITES_512B    = 1
HOST_READS_WRITES_32MB    = 2
HOST_READS_WRITES_GB      = 3
%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��
INFO_LIST
smart_GetInfoInt
%group
; �O���[�v ���L��
hspsmart.dll
