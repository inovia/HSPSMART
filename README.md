# HSPSMART
================================================================================
�y��    �́z  HSPSMART.dll Version 1.11 (based CrystalDiskInfo 8.2.3)
�y�o �^ ���z  hspsmart_111.zip hspsmart_111.7z
�y����Җ��z  �C�m�r�A 
�y������z  Windows 7, 8.1, 10
�y�����^�C���zHSP 3.0 �ȍ~
�y�� �J ���z  2013.05.28
�y�X �V ���z�@2019.08.12
�y�J�����z�@Microsoft Visual Studio 2017
--------------------------------------------------------------------------------
�y��@�@�ʁz  �t���[�\�t�g
�y�� �z �z�z  �������܂ߎ��R�ɂǂ����B�������ACrystalDiskInfo�̃��C�Z���X�ɏ������Ă��������B
              http://crystalmark.info/software/CrystalDiskInfo/manual-ja/License.html
              �{DLL���p������ MIT ���C�Z���X �Œ񋟂��܂��B
================================================================================
 �T�|�[�gURL : https://www.hinekure.net/
             : https://hsp.moe/
             : https://twitter.com/hk1v/
================================================================================
 �{DLL�̂��₢���킹�̓C�m�r�A�̕��ɂ��肢���܂��B
 CrystalDiskInfo�ł����l�̕s����N���Ă���ȂǁA���ۂ������炩�ȏꍇ�������āA
 hiyohiyo���ɖ{DLL�ɂ��Ė₢���킹�����Ȃ��ł��������B
================================================================================
 �{DLL���g�p�������Ƃɂ���؂̑��Q�ɑ΂��A��҂͐ӔC�𕉂��܂���B
 �\�߂��������������ł��g�p���������B
================================================================================

 * �T�v - information

  ��DLL��HSP3.0�ȍ~�Ńf�B�X�N�̏���S.M.A.R.T.�����擾���邱�Ƃ��ł��܂��B
 HSP 3.5 beta3�ȍ~�ł���΁A64bit�l�C�e�B�u�ł��g�p�ł��܂��B

 hiyohiyo����CrystalDiskInfo�̃\�[�X�R�[�h���g�p����Ă���܂��B
 http://crystalmark.info/software/CrystalDiskInfo/
 �\�[�X�R�[�h��src�t�H���_�Ɋi�[���Ă���܂��B

 �{DLL���g�p�����\�t�g��z�z����ۂ́AReadme.txt�Ȃǂ�hiyohiyo���̒��쌠�\����A
 CrystalDiskInfo�̃\�[�X�R�[�h���g�p����Ă���Ƃ����\�����K�v�ł��B

 COPYRIGHT.txt
 COPYRIGHT-ja.txt

 ���Q�Ƃ��Ă��������B

 ���Ȃ݂ɁACrystalDiskInfo �ɂ͕t�^����Ă���f�W�^�������͖{DLL�ɂ͕t�^���Ă��܂���̂ŁA
 �\�߂������̂����g�p���Ă��������B

 * �C���X�g�[��	- install

  hspsmart.dll�Ahspsmart64.dll ���AHSP3���C���X�g�[������Ă���t�H���_�ɃR�s�[�A
 hspsmart.as�Ahspsmart64.as ��HSP3���C���X�g�[������Ă���t�H���_�̒���common�t�H���_�̒��ɃR�s�[�A
 hspsmart.hs ��HSP3���C���X�g�[������Ă���t�H���_�̒���hsphelp�t�H���_�̒��ɃR�s�[���Ă��������B

 * 64bit�Ń����^�C�� - 64bit runtime

  "64bit��HSP�����^�C��(HSP3.5beta3����)" �t�H���_�� 64bit��HSP�����^�C���𓯍����Ă��܂��B
 bin�t�H���_�̒��g��HSP�̎��s���ɂ܂���ƃR�s�[���Ă��g�����������B(HSP3.5 beta3 ������)
 ���̃����^�C�����g�p���邱�ƂŁA�u_x64.hsp�v�ŏI���t�@�C�����̃T���v�������s�ł��܂��B

 * �g���� - how to use

  �g�������X�N���v�g�� #include "hspsmart.as" ���L�q����Η��p�\�ɂȂ�܂��B
 "hspsmart.as"��"common"�t�H���_�ɓ����Ȃ育���R�ɂǂ����B
 64bit�ł��g�p����ꍇ�́A"hspsmart.as"�̑���ɁA"hspsmart64.as" ���g�p���Ă��������B

 ����ƁA�����Ȃ̂��閽�ߎd�l������Ǝv���܂����A���������������B
 �T���v����t�����Ă����܂����̂ł����R�ɂ������������B

 * ���ߎd�l - guide
 
 �������Ă��� hspsmart.hs �t�@�C����HDL�ɓǂݍ��܂��Ė��߃}�j���A�����������������B

 * �X�V���� - history

 1.00 -> ���Ń����[�X
 1.01 -> 
�@�ECrystalDiskInfo 6.0.1�Ή�
�@�EDevSleep���o�Ή�(smart_GetInfoInt�֐�����擾�\)
�@�E[�����ύX] smart_DiskScan���߂ɑ�7�������ǉ�����Ă��܂��B
�@�@S.M.A.R.T.�ɑΉ����Ă��Ȃ��f�B�X�N���B���@�\�ł��B
�@�E[�����ύX] smart_SetThreshold���߂ɑ�6�������ǉ�����Ă��܂��B
�@�@SSD��FF �c������̊�l(臒l)���ݒ�ł��܂��B
�@�EIDENTIFY_DEVICE�\���̂̃����o�����ύX����Ă��܂��B
�@�@ReservedForFutureSerialAta��SerialAtaAdditionalCapabilities
�@�E�萔�̒l���ꕔ�ύX�E�ǉ�����Ă��܂��B
�@�@DLL�̃o�[�W������as�t�@�C���̃o�[�W��������v���Ȃ��ƁA����ɓ��삵�Ȃ��ꍇ���\��������܂��B
�@�@���łɃR���p�C���ς݂�EXE�̏ꍇ�ADLL�������ւ��������ł͐���ɓ��삵�Ȃ��ꍇ���\��������܂��B
�@�@�ăR���p�C������K�v������܂��B
 1.02 -> 
�@�ECrystalDiskInfo 6.0.4�Ή�
�@�Eas�t�@�C����DLL�̃o�[�W�������`�F�b�N����@�\��ǉ����܂����i�����Ń`�F�b�N����܂��j
�@�@�`�F�b�N�������Ȃ��ꍇ�́A
�@�@#define global SMART_NO_CHECK_DLL_ERROR
�@�@#include "hspsmart.as"
�@�@�̂悤�Ȋ����ŁA�C���N���[�h�̑O�� SMART_NO_CHECK_DLL_ERROR ���`���Ă��������B
�@�ECrystalDiskInfo 6.0.4�̃\�[�X�R�[�h�����̂܂܎g�p������AWMI�g�p����HDD�̑䐔�����������Ȃ錻�ۂ���������̂ŁA
�@�@AtaSmart.cpp����CAtaSmart::GetTimeUnitType()���̃��f�����̑啶����������ʂ̕ϐ��ɃR�s�[���Ă���s���悤�ɂ��Ă��܂��B
�@�@(���ۂ�CrystalDiskInfo 6.0.4�ł͔������Ă��Ȃ��̂ŁA�C������Ă�E�E�E�H)
�@�@��1.03�ɂďC�����m�F�B
 1.03 -> 
�@�ECrystalDiskInfo 6.1.8�Ή�
 1.04 -> 
�@�ECrystalDiskInfo 6.1.12�Ή�
 1.05 -> 
�@�E�������[�X
�@�ECrystalDiskInfo 6.1.14�Ή�
 1.06 -> 
�@�ECrystalDiskInfo 6.2.1�Ή�
�@�EATA_SMART_INFO�\���̂�PlextorNandWritesUnit�����o���p�~���ꂽ���߁A�o�[�W�����A�b�v���ɂ͒��ӂ��Ă��������B
�@�@�iDLL�̃o�[�W������as�t�@�C���̃o�[�W��������v���Ȃ��ƁA����ɓ��삵�Ȃ��ꍇ���\��������܂��B
�@�@���łɃR���p�C���ς݂�EXE�̏ꍇ�ADLL�������ւ��������ł͐���ɓ��삵�Ȃ��ꍇ���\��������܂��B
�@�@�ăR���p�C������K�v������܂��B�j
�@�E�R���\�[���ŃT���v����ǉ�
 1.07 -> 
�@�ECrystalDiskInfo 6.3.2�Ή�
�@�E�N���X�|�C���^�𒼐ړn���Ă����ӏ����C���f�b�N�X�ɂ��Ǘ��ɕύX�ihspsmart.cpp�j
�@�iHSP���̃\�[�X�͕ύX�Ȃ��ׁA�N���X�|�C���^�����ɂ傲�ɂ債�Ă��Ȃ�����́A�ȑO�̃o�[�W�����ƌ݊���������܂��j
�@�E64bit��DLL����
�@�@#runtime "hsp3_64"
�@�@#include "hspsmart64.as"
�@�@�ƋL�q����Ǝg�p�ł���悤�ɂȂ�܂��B
�@�E64bit��HSP�����^�C�������i3.5beta2�����j
 1.08 -> 
�@�ECrystalDiskInfo 6.7.5�Ή�
�@�E64bit��HSP3CL�����^�C�������i3.5beta3�����j
�@�E�萔�̒l���ꕔ�ύX�E�ǉ�����Ă��܂��B
�@�@DLL�̃o�[�W������as�t�@�C���̃o�[�W��������v���Ȃ��ƁA����ɓ��삵�Ȃ��ꍇ���\��������܂��B
�@�@���łɃR���p�C���ς݂�EXE�̏ꍇ�ADLL�������ւ��������ł͐���ɓ��삵�Ȃ��ꍇ���\��������܂��B
�@�@�ăR���p�C������K�v������܂��B
 1.09 -> 
�@�ECrystalDiskInfo 7.0.0�Ή�
�@�E�萔�̒l���ꕔ�ύX�E�ǉ�����Ă��܂��B
     �� CMD_TYPE_LOGITEC �̔p�~�B CMD_TYPE_LOGITEC1 �� CMD_TYPE_LOGITEC2 �̒ǉ��B
     �� CMD_TYPE_NVME_STORAGE_QUERY �̒ǉ��B
     �� FLAG_USB_LOGITEC �̔p�~�B FLAG_USB_LOGITEC1 �� FLAG_USB_LOGITEC2 �̒ǉ��B
 1.10 -> 
�@�ECrystalDiskInfo 7.1.1�Ή�
  �EC#�ł��b�蓯��(������������)�B

 1.10 -> 
�@�ECrystalDiskInfo 8.2.3�Ή�