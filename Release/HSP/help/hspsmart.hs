;--------------------------------------------------
; HSP ヘルプ ソースファイル (hs 形式)
; hs ファイルの書式については、HS_BIBLE.txt を参照してください。

;--------------------------------------------------
; この hs ファイルのデフォルトのフィールド値を設定

%dll
; プラグイン/モジュール名 を記入
hspsmart.dll
%ver
; バージョン を記入
1.11(CrystalDiskInfo 8.2.3)
%date
; 日付 を記入
2019/08/12
%author
; 著作者 を記入
; ↓増えた場合は追記して！！！
Copyright (C) 2008-2019 hiyohiyo (CrystalDiskInfo作者様)
Copyright (C) 2013-2019 イノビア (hspsmart.dll 作成)
%url
; 関連 URL を記入
https://hsp.moe/
https://crystalmark.info/
%note
; 備考 (補足情報等) を記入
本プラグインはCrystalDiskInfoのソースコードを使用しております。
%type
; タイプ を記入

%port
; 対応環境 を記入
Win
%portinfo
; 移植のヒント を記入
64bit版を使用する場合は、
#runtime "hsp3_64"
#include "hspsmart64.as"
を先頭に記述してください。

%index
smart_IsCurrentUserLocalAdministrator
; 見出し を記入
管理者権限を持っているか調べます
%prm
()

%inst
; 解説文 を記入
現在のプロセスが管理者権限を持っているか調べます。
持っている場合は 1 が、持っていない場合は 0 が返ります。

%sample
; サンプルスクリプト を記入
if smart_IsCurrentUserLocalAdministrator(){
	mes "管理者権限があります"
}
%href
; 関連項目 を記入
smart_ShellExecuteExAdminW
smart_AdminSelfRunW
smart_Init
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_IsCurrentUserLocalAdministrator "smart_IsCurrentUserLocalAdministrator"


%index
smart_Init
; 見出し を記入
初期化します
%prm
()

%inst
; 解説文 を記入
初期化します。
戻り値は操作ハンドルですので、保存しておいてください。
操作ハンドルはほとんどの命令・関数で使用します。
0の場合は失敗しています。
実行には管理者権限が必要です。

%sample
; サンプルスクリプト を記入
hSmart = smart_Init()
%href
; 関連項目 を記入
smart_UnInit
smart_DiskScan
smart_IsCurrentUserLocalAdministrator
smart_ShellExecuteExAdminW
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_Init "smart_Init"


%index
smart_DiskScan
; 見出し を記入
ディスクを検出します
%prm
int1, int2, int3, int4, int5, int6, int7
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: WMIを使用するか？(0 = 使用しない、1 = 使用する)
int3	: アドバンスドディスクサーチを使用するか？(0 = 使用しない、1 = 使用する)
int4	: ChangeDiskフラグ(0 = 使用しない(NULLポインタ)、それ以外の値は PBOOL として扱われます。通常は0でOK。)
int5	: サムスン HD155UI/HD204UIの不具合回避機能を使用するか？(0 = 使用しない、1 = 使用する)
int6	: ADATA SSD S599のFW 3.4.6の不具合回避機能を使用するか？(0 = 使用しない、1 = 使用する)
int7	: S.M.A.R.T.に対応していないディスクを隠すか？(0 = 使用しない、1 = 使用する)

%inst
; 解説文 を記入
ディスクを検出します(CrystalDiskInfoの再検出と同じ)
初回起動時やディスクが後から追加・変更・削除されたりしたときに実行してください。
この処理はやや重いです。再生中の音声が一瞬途切れることもあります。
smart_SetAtaPassThroughSmart命令で、IDE/ATA_PASS_THROUGH をオフにすると音が途切れなくなる可能性があります。

WMIは通常、有効にしておくことをお勧めします。
有効にしないとディスクが検出できないことがあります。

アドバンスドディスクサーチは
通常のサーチ方式では見つからないディスクを検出できる可能性があります。
ただし、環境によっては OS ごとフリーズしてしまう可能性があります。
・ScsiPort0 ～ 15 の ScsiTargetID 0～7 に対してディスクの有無を確認します。 
・IDENTIFY_DEVICE の返り値が不適切なディスクも表示します。
・S.M.A.R.T. に対応していないとレポートされるディスクに対しても S.M.A.R.T. 情報の取得を試みます。
外付けボードに接続したディスクで問題が発生する可能性があります。

サムスン HD155UI/HD204UIの不具合回避機能は
ファームウェア不具合によりデータ欠損の可能性があるため検索対象から外します。
有効にしておくことをお勧めします。

ADATA SSD S599のFW 3.4.6の不具合回避機能は
2倍の温度が報告されるため、回避します。
有効にしておくことをお勧めします。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効

%sample
; サンプルスクリプト を記入
smart_DiskScan hSmart, 1, 1, 0, 1, 1, 0
%href
; 関連項目 を記入
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
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_DiskScan "smart_DiskScan" int, int, int, int, int, int


%index
smart_CheckDiskStatus
; 見出し を記入
ディスクのステータスを取得
%prm
(int1, int2)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
ディスクのステータスを取得します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。

戻り値は以下のようになります。
0  = ディスクステータス不明
1  = ディスクステータス通常
2  = ディスクステータス注意
3  = ディスクステータス異常

-1 = 操作ハンドル無効

%sample
; サンプルスクリプト を記入
mes smart_CheckDiskStatus(hSmart, 0)
%href
; 関連項目 を記入
smart_GetCount
smart_SetThreshold
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_CheckDiskStatus "smart_CheckDiskStatus" int, int


%index
smart_SetUSB1394
; 見出し を記入
USB/IEEE1394接続の外付けディスクを検出対象にする
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: フラグ（後述）

%inst
; 解説文 を記入
USB/IEEE1394接続の外付けディスクを検出対象にするかどうか？

フラグには以下のものが OR 値で指定できます。

// SCSI ATA TRANSLATION 経由でアクセスを試みます。
FLAG_USB_SAT
// Sunplus 製コントローラ対応
FLAG_USB_SUNPLUS
// I-O DATA 製コントローラ対応
FLAG_USB_IODATA
// Logitec 製コントローラ対応
FLAG_USB_LOGITEC1
FLAG_USB_LOGITEC2
// JMicron 製コントローラ対応
FLAG_USB_JMICRON
// Cypress 製コントローラ対応
FLAG_USB_CYPRESS
// USB メモリに対しても SCSI ATA TRANSLATION 経由でアクセスを試みます。
// USB-SATA 変換チップを搭載した一部の高速 USB メモリで中身が見えるようになる可能性があります。
FLAG_USB_MEMORY

// JMicron 製コントローラ対応(NVMe)
FLAG_USB_NVME_JMICRON

// AsMedia 製コントローラ対応(NVMe)
FLAG_USB_NVME_ASMEDIA

// Realtek 製コントローラ対応(NVMe)
FLAG_USB_NVME_REALTEK

FLAG_USB_ALL は すべて設定されます。
FLAG_USB_NULL は すべて解除されます。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効


%sample
; サンプルスクリプト を記入
smart_SetUSB1394 hSmart, FLAG_USB_ALL
%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_SetUSB1394 "smart_SetUSB1394" int, int


%index
smart_SetAtaPassThroughSmart
; 見出し を記入
IDE/ATA_PASS_THROUGH を使用します
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: IDE/ATA_PASS_THROUGHを使用する場合は1、しない場合は 0を指定

%inst
; 解説文 を記入
IDE/ATA_PASS_THROUGH を使用するかの設定。
使用すると詳細な情報が取得できる可能性があります。
一部環境(Intel 製 ATA ドライバ)では音飛びやマウス飛びが発生することが報告されています。
問題が発生する場合は無効にしてください。
※正確な情報が取得できない可能性があります。

stat が 0 の場合は成功しています。

0  = 成功
-1 = 操作ハンドル無効

%sample
; サンプルスクリプト を記入
smart_SetAtaPassThroughSmart hSmart, 1
%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_SetAtaPassThroughSmart "smart_SetAtaPassThroughSmart" int, int


%index
smart_SetCsmiType
; 見出し を記入
CSMIを使用するかどうか
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: フラグ(後述)

%inst
; 解説文 を記入
Intel RAID 環境において CSMI (Common Storage Management Interface) 経由でディスク情報を取得します。

以下のフラグが指定できます。
通常は自動検出でよいと思います。

CSMI_TYPE_DISABLE	// 無効
CSMI_TYPE_ENABLE_AUTO	// 自動検出
CSMI_TYPE_ENABLE_RAID	// RAIDディスクのみ有効
CSMI_TYPE_ENABLE_ALL	// すべて有効

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(値が範囲外)

%sample
; サンプルスクリプト を記入
smart_SetCsmiType hSmart, CSMI_TYPE_ENABLE_AUTO


%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_SetCsmiType "smart_SetCsmiType" int, int


%index
smart_UpdateIdInfo
; 見出し を記入
ディスクの情報を更新(S.M.A.R.T.以外)
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
ディスクの情報を更新します。(S.M.A.R.T.以外)
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = 更新失敗

%sample
; サンプルスクリプト を記入
// ディスクの情報を更新(S.M.A.R.T.以外)
smart_UpdateIdInfo hSmart, 0
// ディスクのS.M.A.R.T.情報を更新
smart_UpdateSmartInfo hSmart, 0
%href
; 関連項目 を記入
smart_UpdateSmartInfo
smart_DiskScan
smart_CheckDiskStatus
smart_GetCount
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_UpdateIdInfo "smart_UpdateIdInfo" int, int


%index
smart_UpdateSmartInfo
; 見出し を記入
ディスクのS.M.A.R.T.情報を更新
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
ディスクのS.M.A.R.T.情報を更新します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = 更新失敗
%sample
; サンプルスクリプト を記入
// ディスクの情報を更新(S.M.A.R.T.以外)
smart_UpdateIdInfo hSmart, 0
// ディスクのS.M.A.R.T.情報を更新
smart_UpdateSmartInfo hSmart, 0
%href
; 関連項目 を記入
smart_UpdateIdInfo
smart_DiskScan
smart_CheckDiskStatus
smart_GetCount
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_UpdateSmartInfo "smart_UpdateSmartInfo" int, int


%index
smart_UnInit
; 見出し を記入
開放します
%prm
int1
int1	: 操作ハンドル(smart_Init()を実行して取得する)

%inst
; 解説文 を記入
開放します。
操作ハンドルを引数に指定します。
%sample
; サンプルスクリプト を記入
smart_UnInit hSmart
%href
; 関連項目 を記入
smart_Init
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_UnInit "smart_UnInit" int


%index
smart_IsAdvancedDiskSearch
; 見出し を記入
アドバンスドディスクサーチが有効かどうか？
%prm
(int1)
int1	: 操作ハンドル(smart_Init()を実行して取得する)

%inst
; 解説文 を記入
アドバンスドディスクサーチが有効かどうか取得します。
無効の場合は 0、有効の場合は1が返ります。
%sample
; サンプルスクリプト を記入
mes smart_IsAdvancedDiskSearch(hSmart)
%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_IsAdvancedDiskSearch "smart_IsAdvancedDiskSearch" int


%index
smart_IsEnabledWmi
; 見出し を記入
WMIを使用して取得するかどうか？
%prm
(int1)
int1	: 操作ハンドル(smart_Init()を実行して取得する)

%inst
; 解説文 を記入
WMIを使用して取得するかどうか取得します。
無効の場合は 0、有効の場合は1が返ります。
%sample
; サンプルスクリプト を記入
mes smart_IsEnabledWmi(hSmart)
%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_IsEnabledWmi "smart_IsEnabledWmi" int


%index
smart_IsWorkaroundAdataSsd
; 見出し を記入
ADATA製SSD不具合回避機能が有効かどうか？
%prm
(int1)
int1	: 操作ハンドル(smart_Init()を実行して取得する)

%inst
; 解説文 を記入
ADATA製SSD不具合回避機能が有効かどうか取得します。
無効の場合は 0、有効の場合は1が返ります。
%sample
; サンプルスクリプト を記入
mes smart_IsWorkaroundAdataSsd(hSmart)
%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_IsWorkaroundAdataSsd "smart_IsWorkaroundAdataSsd" int


%index
smart_IsWorkaroundHD204UI
; 見出し を記入
サムスン HD155UI/HD204UIの不具合回避機能が有効かどうか？
%prm
(int1)
int1	: 操作ハンドル(smart_Init()を実行して取得する)

%inst
; 解説文 を記入
サムスン HD155UI/HD204UIの不具合回避機能が有効かどうか取得します。
無効の場合は 0、有効の場合は1が返ります。
%sample
; サンプルスクリプト を記入
mes smart_IsWorkaroundHD204UI(hSmart)
%href
; 関連項目 を記入
smart_DiskScan
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_IsWorkaroundHD204UI "smart_IsWorkaroundHD204UI" int


%index
smart_GetCount
; 見出し を記入
検出されたディスクの数を取得します
%prm
(int1)
int1	: 操作ハンドル(smart_Init()を実行して取得する)

%inst
; 解説文 を記入
検出されたディスクの数を取得します。
エラー時マイナス値を返す場合がありますので、repeat などで直接使用すると無限ループする可能性があります。
エラーが返ってきてないかどうかチェックしてください。

戻り値
1以上  = 成功(=検出された台数)
0      = ディスクなし
-1     = 操作ハンドル無効
%sample
; サンプルスクリプト を記入
mes smart_GetCount(hSmart)
%href
; 関連項目 を記入
smart_DiskScan
smart_UpdateIdInfo
smart_UpdateSmartInfo
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetCount "smart_GetCount" int


%index
smart_DisableAam
; 見出し を記入
AAMを無効化します
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
AAMを無効化します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(値が範囲外)

%sample
; サンプルスクリプト を記入
smart_DisableAam hSmart, 0
%href
; 関連項目 を記入
smart_DiskScan

smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_DisableAam "smart_DisableAam" int, int


%index
smart_DisableApm
; 見出し を記入
APMを無効化します
%prm
int1, int2
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
APMを無効化します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(値が範囲外)

%sample
; サンプルスクリプト を記入
smart_DisableApm hSmart, 0
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_DisableApm "smart_DisableApm" int, int


%index
smart_EnableAam
; 見出し を記入
AAMを有効化します
%prm
int1, int2, int3
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: AAMの値(128～254)

%inst
; 解説文 を記入
AAMを有効化します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
AAMの値は128～254を指定します。範囲外の場合は近似値が設定されます。

stat が 1 の場合は成功しています。
1  = 成功
0  = 失敗
-1 = 操作ハンドル無効
-2 = 引数エラー(値が範囲外)

%sample
; サンプルスクリプト を記入
smart_EnableAam hSmart, 0, 254
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_EnableAam "smart_EnableAam" int, int, int


%index
smart_EnableApm
; 見出し を記入
APMを有効化します
%prm
int1, int2, int3
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: APMの値(1～254)

%inst
; 解説文 を記入
APMを有効化します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
APMの値は1～254を指定します。範囲外の場合は近似値が設定されます。

stat が 1 の場合は成功しています。
1  = 成功
0  = 失敗
-1 = 操作ハンドル無効
-2 = 引数エラー(値が範囲外)

%sample
; サンプルスクリプト を記入
smart_EnableApm hSmart, 0, 254
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_EnableApm "smart_EnableApm" int, int, int


%index
smart_GetAamValue
; 見出し を記入
AAMの現在値を取得します
%prm
(int1, int2)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
AAMの現在値を取得します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
AAMが無効化されている場合でもAAMをサポートしていれば取得可能です。

戻り値
0          = AAMに未対応
128 ～ 254 = AAM値
-1         = 操作ハンドル無効
-2         = 引数エラー(値が範囲外) 


%sample
; サンプルスクリプト を記入
mes smart_GetAamValue(hSmart, 0)
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetApmValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetAamValue "smart_GetAamValue" int, int


%index
smart_GetApmValue
; 見出し を記入
APMの現在値を取得します
%prm
(int1, int2)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
APMの現在値を取得します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
APMが無効化されている場合でもAPMをサポートしていれば取得可能です。

戻り値
0          = APMに未対応
1 ～ 254   = APM値
-1         = 操作ハンドル無効
-2         = 引数エラー(値が範囲外) 

%sample
; サンプルスクリプト を記入
mes smart_GetApmValue(hSmart, 0)
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetRecommendAamValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetApmValue "smart_GetApmValue" int, int


%index
smart_GetRecommendAamValue
; 見出し を記入
AAMのメーカー推奨値を取得します
%prm
(int1, int2)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
AAMのメーカー推奨値を取得します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
AAMが無効化されている場合でもAAMをサポートしていれば取得可能です。

戻り値
0          = AAMに未対応
128 ～ 254 = AAM値
-1         = 操作ハンドル無効
-2         = 引数エラー(値が範囲外) 
%sample
; サンプルスクリプト を記入
mes smart_GetRecommendAamValue(hSmart, 0)
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendApmValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetRecommendAamValue "smart_GetRecommendAamValue" int, int


%index
smart_GetRecommendApmValue
; 見出し を記入
APMのメーカー推奨値を取得します
%prm
(int1, int2)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)

%inst
; 解説文 を記入
APMのメーカー推奨値を取得します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
APMが無効化されている場合でもAPMをサポートしていれば取得可能です。

戻り値
0          = APMに未対応
1 ～ 254   = APM値
-1         = 操作ハンドル無効
-2         = 引数エラー(値が範囲外) 
%sample
; サンプルスクリプト を記入
mes smart_GetRecommendApmValue(hSmart, 0)
%href
; 関連項目 を記入
smart_DiskScan
smart_DisableAam
smart_DisableApm
smart_EnableAam
smart_EnableApm
smart_GetAamValue
smart_GetApmValue
smart_GetRecommendAamValue
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetRecommendApmValue "smart_GetRecommendApmValue" int, int


%index
smart_GetInfoStringSizeW
; 見出し を記入
文字列型情報の格納に必要なサイズを取得
%prm
(int1, int2, int3)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(smart_GetInfoStringW参照)


%inst
; 解説文 を記入
文字列型情報の格納に必要なサイズを取得します。
smart_GetInfoStringW で使用します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_ENCLOSURE			// ディスクエンクロージャ
INFO_SERIALNUMBER		// シリアルナンバー
INFO_SERIALNUMBERREVERSE	// シリアルナンバーを逆転したもの
INFO_FIRMWAREREV		// ファームウェアのレヴィジョン
INFO_FIRMWAREREVREVERSE		// ファームウェアのレヴィジョンを逆転したもの
INFO_MODEL			// モデル名
INFO_MODELREVERSE		// モデル名を逆転したもの
INFO_MODELWMI			// WMIから取得したモデル名
INFO_MODELSERIAL		// モデル名
INFO_DRIVEMAP			// ドライブマップ(C: D: とか)
INFO_MAXTRANSFERMODE		// 最大転送モード
INFO_CURRENTTRANSFERMODE	// 現在の転送モード
INFO_MAJORVERSION		// 対応規格
INFO_MINORVERSION		// 対応規格
INFO_INTERFACE			// インターフェース(SATAとか)
INFO_ENCLOSURE2			// ディスクエンクロージャ
INFO_COMMANDTYPESTRING		// ？
INFO_SSDVENDORSTRING		// SSDベンダー名
INFO_DEVICENOMINALFORMFACTOR	// ファクター(2.5インチとか3.5インチ)
INFO_PNPDEVICEID		// PnpDeviceId
INFO_SMARTKEYNAME		// S.M.A.R.T.項目名抽出用キー名

戻り値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-4 = バッファ領域不足
-5 = 対応していないID

%sample
; サンプルスクリプト を記入
// 格納に必要なサイズを取得
size = smart_GetInfoStringSizeW(hSmart, 0, INFO_MODEL)
if size > 0{
	sdim buf, size + 2
	smart_GetInfoStringW hSmart, 0, INFO_MODEL, buf, size
	mes stat
	mes cnvwtos(buf)
}
%href
; 関連項目 を記入
smart_GetInfoStringW


INFO_LIST
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetInfoStringSizeW "smart_GetInfoStringW" int, int, int, nullptr, nullptr


%index
smart_GetInfoStringW
; 見出し を記入
ディスクの情報を取得(文字列型/UTF-16)
%prm
int1, int2, int3, var4, int5
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)
var4	: 情報が格納される変数
int5	: 変数のサイズ

%inst
; 解説文 を記入
ディスクの情報を取得します。(文字列型/UTF-16)
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_ENCLOSURE			// ディスクエンクロージャ
INFO_SERIALNUMBER		// シリアルナンバー
INFO_SERIALNUMBERREVERSE	// シリアルナンバーを逆転したもの
INFO_FIRMWAREREV		// ファームウェアのレヴィジョン
INFO_FIRMWAREREVREVERSE		// ファームウェアのレヴィジョンを逆転したもの
INFO_MODEL			// モデル名
INFO_MODELREVERSE		// モデル名を逆転したもの
INFO_MODELWMI			// WMIから取得したモデル名
INFO_MODELSERIAL		// モデル名
INFO_DRIVEMAP			// ドライブマップ(C: D: とか)
INFO_MAXTRANSFERMODE		// 最大転送モード
INFO_CURRENTTRANSFERMODE	// 現在の転送モード
INFO_MAJORVERSION		// 対応規格
INFO_MINORVERSION		// 対応規格
INFO_INTERFACE			// インターフェース(SATAとか)
INFO_ENCLOSURE2			// ディスクエンクロージャ
INFO_COMMANDTYPESTRING		// コマンドタイプ
INFO_SSDVENDORSTRING		// SSDベンダー名
INFO_DEVICENOMINALFORMFACTOR	// フォームファクター(2.5インチとか3.5インチ)
INFO_PNPDEVICEID		// PnpDeviceId
INFO_SMARTKEYNAME		// S.M.A.R.T.項目名抽出用キー名

変数はあらかじめ領域を確保しておいてください。
サイズはsmart_GetInfoStringSizeW()で取得できます。
文字列はUnicodeで返ってきます。
cnvwtosなどで変換する必要があります。


stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-4 = バッファ領域不足
-5 = 対応していないID

%sample
; サンプルスクリプト を記入
// 格納に必要なサイズを取得
size = smart_GetInfoStringSizeW(hSmart, 0, INFO_MODEL)
if size > 0{
	sdim buf, size + 2
	smart_GetInfoStringW hSmart, 0, INFO_MODEL, buf, size
	mes stat
	mes cnvwtos(buf)
}
%href
; 関連項目 を記入
smart_GetInfoStringSizeW
INFO_LIST
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetInfoStringW "smart_GetInfoStringW" int, int, int, var, int


%index
smart_GetInfoInt
; 見出し を記入
ディスクの情報を取得(32bit数値型)
%prm
int1, int2, int3, var4
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)
var4	: 情報が格納される変数

%inst
; 解説文 を記入
ディスクの情報を取得します。(32bit数値型)
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_USBPRODUCTID			// USBプロダクトID
INFO_USBVENDORID			// USBベンダーID
INFO_ISSMARTENABLED			// S.M.A.R.T.が有効かどうか？(0 = 無効, 1 = 有効)
INFO_ISIDINFOINCORRECT			// IsIdInfoIncorrect？(0 = No, 1 = Yes)
INFO_ISSMARTCORRECT			// IsSmartCorrect？(0 = No, 1 = Yes)
INFO_ISTHRESHOLDCORRECT			// IsThresholdCorrect？(0 = No, 1 = Yes)
INFO_ISCHECKSUMERROR			// チェックサムエラーの検出有効？(0 = 無効, 1 = 有効)
INFO_ISWORD88				// IsWord88？(0 = No, 1 = Yes)
INFO_ISWORD64_76			// IsWord64_76？(0 = No, 1 = Yes)
INFO_ISRAWVALUES8			// IsRawValues8？(0 = No, 1 = Yes)
INFO_ISRAWVALUES7			// IsRawValues7？(0 = No, 1 = Yes)
INFO_IS9126MB				// 9126MBかどうか？(HDD容量の壁？)(0 = No, 1 = Yes)
INFO_ISTHRESHOLDBUG			// 特定機種のファームバグ検出？(0 = No, 1 = Yes)
INFO_ISSMARTSUPPORTED			// S.M.A.R.T.をサポートしているかどうか？(0 = No, 1 = Yes)
INFO_ISLBA48SUPPORTED			// LBA48対応？(0 = No, 1 = Yes)
INFO_ISAAMSUPPORTED			// AAM対応？(0 = No, 1 = Yes)
INFO_ISAPMSUPPORTED			// APM対応？(0 = No, 1 = Yes)
INFO_ISAAMENABLED			// AAM有効？(0 = 無効, 1 = 有効)
INFO_ISAPMENABLED			// APM有効？(0 = 無効, 1 = 有効)
INFO_ISNCQSUPPORTED			// NCQ対応？(0 = No, 1 = Yes)
INFO_ISNVCACHESUPPORTED			// NVキャッシュをサポートしてる？(0 = No, 1 = Yes)
INFO_ISMAXTORMINUTE			// MaxtorMinute(0 = No, 1 = Yes)
INFO_ISSSD				// SSDかどうか？ (0 = No, 1 = Yes)
INFO_ISTRIMSUPPORTED			// SSDがTrimをサポートしているか？(0 = No, 1 = Yes)
INFO_PHYSICALDRIVEID			// 物理ドライブID
INFO_SCSIPORT				// SCSIポート
INFO_SCSITARGETID			// SCSIターゲットID
INFO_SCSIBUS				// SCSIバス
INFO_SILICONIMAGETYPE			// Silicon Image Controller タイプ
INFO_TOTALDISKSIZE			// 最大ディスクサイズ
INFO_CYLINDER				// シリンダー数
INFO_HEAD				// ヘッド数
INFO_SECTOR				// セクタ数
INFO_SECTOR28				// セクタ数(28bit)
INFO_DISKSIZECHS			// CHSで取得したディスクサイズ
INFO_DISKSIZELBA28			// LBA28で取得したディスクサイズ
INFO_DISKSIZELBA48			// LBA48で取得したディスクサイズ
INFO_DISKSIZEWMI			// WMIで取得したディスクサイズ
INFO_BUFFERSIZE				// バッファサイズ
INFO_TRANSFERMODETYPE			// 転送モード(戻り値はTRANSFER_MODE参照)
INFO_DETECTEDTIMEUNITTYPE		// Measured Time(使用時間)単位(戻り値はPOWER_ON参照)
INFO_MEASUREDTIMEUNITTYPE		// Detected Time(検出時間)単位(戻り値はPOWER_ON参照)
INFO_ATTRIBUTECOUNT			// S.M.A.R.T.の項目数(最大30)
INFO_DETECTEDPOWERONHOURS		// 使用時間
INFO_MEASUREDPOWERONHOURS		// 検出時間
INFO_POWERONRAWVALUE			// 使用時間生の値
INFO_POWERONSTARTRAWVALUE		// 使用開始時間生の値
INFO_POWERONCOUNT			// 電源投入回数
INFO_TEMPERATURE			// 温度
INFO_NOMINALMEDIAROTATIONRATE		// 回転数(5400RPMとか7200RPMなど)
INFO_HOSTWRITES				// 総書込量 (ホスト)
INFO_HOSTREADS				// 総読込量 (ホスト)
INFO_GBYTESERASED			// 消去データ量(GB単位)
INFO_NANDWRITES				// 総書込量 (NAND)
INFO_WEARLEVELINGCOUNT			// ウェアレベリング回数
INFO_LIFE				// 寿命
INFO_MAJOR				// メジャー
INFO_MINOR				// マイナー
INFO_DISKSTATUS				// ディスクステータス(smart_CheckDiskStatus()で取得できる値と同じ)
INFO_DRIVELETTERMAP			// ドライブレターマップ
INFO_ALARMTEMPERATURE			// 警報温度
INFO_ALARMHEALTHSTATUS			// 警報健康状態
INFO_DISKVENDORID			// ディスクベンダーID
INFO_USBVENDORID2			// USBベンダーID
INFO_USBPRODUCTID2			// USBプロダクトID
INFO_THRESHOLD05			// 注意と判定する05 代替処理済セクタ数(0～255)
INFO_THRESHOLDC5			// 注意と判定するC5 代替処理保留中セクタ数(0～255)
INFO_THRESHOLDC6			// 注意と判定するC6 回復不能セクタ数(0～255)
INFO_TARGET				// ？
INFO_INTERFACETYPE			// インターフェース(INTERFACEを参照)
INFO_COMMANDTYPE			// コマンドタイプ(COMMANDを参照)
INFO_THRESHOLDFF			// 注意と判定するFF 残り寿命(0～255)
INFO_ISDEVICESLEEPSUPPORTED		// DevSleepに対応しているか？
INFO_HOSTREADSWRITESUNIT		// ホストの読み書き単位？(HOSTREADSWRITESUNITを参照)
INFO_ISNVME						// NVMe かどうか？
INFO_ISUASP						// UASP かどうか？
INFO_IS_LOGICALSECTORSIZE		// LogicalSectorSize

成功すると、statが0になり、指定した変数に値が格納されます。
変数に格納される値はディスク情報IDによって違います。

stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-5 = 対応していないID
%sample
; サンプルスクリプト を記入
// 温度取得
i = 0
smart_GetInfoInt hSmart, 0, INFO_TEMPERATURE, i
mes i
%href
; 関連項目 を記入
INFO_LIST
TRANSFER_MODE
POWER_ON
INTERFACE
COMMAND
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetInfoInt "smart_GetInfoInt" int, int, int, var


%index
smart_GetInfoDouble
; 見出し を記入
ディスクの情報を取得(64bit実数型)
%prm
int1, int2, int3, var4
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)
var4	: 情報が格納される変数

%inst
; 解説文 を記入
ディスクの情報を取得します。(64bit実数型)
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_TEMPERATUREMULTIPLIER			// 温度で使用する倍数値(通常1.0)

情報を格納する変数はあらかじめ初期化しておいてください。
d = 0.0 や ddim d, 1 で初期化できます。
成功すると、statが0になり、指定した変数に値が格納されます。
変数に格納される値はディスク情報IDによって違います。

stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-5 = 対応していないID

%sample
; サンプルスクリプト を記入
// 情報取得
d = 0.0
smart_GetInfoDouble hSmart, 0, INFO_TEMPERATUREMULTIPLIER, d
mes d
%href
; 関連項目 を記入
INFO_LIST
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetInfoDouble "smart_GetInfoDouble" int, int, int, var


%index
smart_GetInfoInt64
; 見出し を記入
ディスクの情報を取得(64bit数値型/32bit分割タイプ)
%prm
int1, int2, int3, var4, var5
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)
var4	: 情報が格納される変数(LowPart)
var5	: 情報が格納される変数(HighPart)

%inst
; 解説文 を記入
ディスクの情報を取得します。(64bit数値型/32bit分割タイプ)
64bit値をLowPart(32bit)、HighPart(32bit)に分割して取得します。
64bit値そのまま取得する場合は、smart_GetInfoInt64Exを使用してください。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_SECTOR48			// 48ビットLBAのセクタ数
INFO_NUMBEROFSECTORS		// セクタの数
INFO_NVCACHESIZE		// NVキャッシュのサイズ

成功すると、statが0になり、指定した変数に値が格納されます。
変数に格納される値はディスク情報IDによって違います。

stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-5 = 対応していないID

%sample
; サンプルスクリプト を記入
// 情報取得
lp = 0 : hp = 0
smart_GetInfoInt64 hSmart, 0, INFO_SECTOR48, lp, hp
mes lp
mes hp
%href
; 関連項目 を記入
smart_GetInfoInt64Ex
INFO_LIST
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetInfoInt64 "smart_GetInfoInt64" int, int, int, var, var


%index
smart_GetInfoInt64Ex
; 見出し を記入
ディスクの情報を取得(64bit数値型)
%prm
int1, int2, int3, var4
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)
var4	: 情報が格納される変数

%inst
; 解説文 を記入
ディスクの情報を取得します。(64bit数値型)
64bit値を直接取得します。
64bit値を分割して取得する場合は、smart_GetInfoInt64を使用してください。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_SECTOR48			// 48ビットLBAのセクタ数
INFO_NUMBEROFSECTORS		// セクタの数
INFO_NVCACHESIZE		// NVキャッシュのサイズ

成功すると、statが0になり、指定した変数に値が格納されます。
変数はあらかじめdimやddim、doubleなどで8byte分、初期化してください。
変数に格納される値はディスク情報IDによって違います。

stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-5 = 対応していないID
%sample
; サンプルスクリプト を記入
// 情報取得
dim int64, 2
smart_GetInfoInt64Ex hSmart, 0, INFO_SECTOR48, int64
mes int64.0
mes int64.1
%href
; 関連項目 を記入
smart_GetInfoInt64
INFO_LIST
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetInfoInt64Ex "smart_GetInfoInt64Ex" int, int, int, var


%index
smart_GetInfoStructSize
; 見出し を記入
構造体/配列型情報の格納に必要なサイズを取得
%prm
(int1, int2, int3)
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)


%inst
; 解説文 を記入
構造体/配列型情報の格納に必要なサイズを取得します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。
INFO_IDENTIFYDEVICE		// IDENTIFY_DEVICE 構造体取得
INFO_SMARTREADDATA		// S.M.A.R.T. データ BYTE配列[512] 取得
INFO_SMARTREADTHRESHOLD		// S.M.A.R.T. しきい値データ BYTE配列[512] 取得
INFO_ATTRIBUTE			// SMART_ATTRIBUTE 構造体[30]取得(S.M.A.R.T.値)
INFO_THRESHOLD			// SMART_THRESHOLD 構造体[30]取得(S.M.A.R.T.しきい値)

戻り値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-4 = バッファ領域不足
-5 = 対応していないID

%sample
; サンプルスクリプト を記入
size = smart_GetInfoStructSize(hSmart, 0, INFO_ATTRIBUTE)
sdim buf, size
smart_GetInfoStruct hSmart, 0, INFO_ATTRIBUTE, buf, size
mes stat
%href
; 関連項目 を記入
smart_GetInfoStruct
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetInfoStructSize "smart_GetInfoStruct" int, int, int, nullptr, nullptr


%index
smart_GetInfoStruct
; 見出し を記入
ディスクの情報を取得(構造体/配列型)
%prm
int1, int2, int3, var4, int5
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 取得したいディスク情報ID(INFO_LISTも参照)
var4	: 情報が格納される変数
int5	: 変数のサイズ

%inst
; 解説文 を記入
ディスクの情報を取得します。(構造体/配列型)
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

INFO_IDENTIFYDEVICE		// IDENTIFY_DEVICE 構造体取得
INFO_SMARTREADDATA		// S.M.A.R.T. データ BYTE配列[512] 取得
INFO_SMARTREADTHRESHOLD		// S.M.A.R.T. しきい値データ BYTE配列[512] 取得
INFO_ATTRIBUTE			// SMART_ATTRIBUTE 構造体[30]取得(S.M.A.R.T.値)
INFO_THRESHOLD			// SMART_THRESHOLD 構造体[30]取得(S.M.A.R.T.しきい値)

情報を格納する変数はあらかじめ初期化しておいてください。
必要なサイズは smart_GetInfoStructSize で取得できます。
成功すると、statが0になり、指定した変数に値が格納されます。
変数に格納される値はディスク情報IDによって違います。

戻り値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)
-3 = NULLポインタエラー
-4 = バッファ領域不足
-5 = 対応していないID

------------------------------------------------------------
// 構造体情報

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
; サンプルスクリプト を記入
size = smart_GetInfoStructSize(hSmart, 0, INFO_ATTRIBUTE)
sdim buf, size
smart_GetInfoStruct hSmart, 0, INFO_ATTRIBUTE, buf, size
mes stat
%href
; 関連項目 を記入
smart_GetInfoStructSize
INFO_LIST
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetInfoStruct "smart_GetInfoStruct" int, int, int, var, int


%index
smart_GetSmartInfoInt64Ex
; 見出し を記入
S.M.A.R.T. 情報を取得します(64bit)
%prm
int1, int2, var3, var4, var5, var6, var7, var8
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
var3	: S.M.A.R.T. ID を格納する配列変数(32bit整数)
var4	: ステータスフラグを格納する配列変数(32bit整数)
var5	: 現在値を格納する配列変数(32bit整数)
var6	: 最悪値を格納する配列変数(32bit整数)
var7	: しきい値を格納する配列変数(32bit整数)
var8	: 生の値を格納する配列変数(64bit整数[HSPではdoubleで代用します])

%inst
; 解説文 を記入
S.M.A.R.T. 情報を取得します。
64bit値を分割して取得する場合は smart_GetSmartInfoInt64 を使用してください。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)

%sample
; サンプルスクリプト を記入
smart_max = smart_GetSmartMaxAttribute()
dim Id, smart_max
dim StatusFlags, smart_max
dim CurrentValue, smart_max
dim WorstValue, smart_max
dim ThresholdValue, smart_max
ddim RawValue, smart_max
smart_GetSmartInfoInt64Ex hSmart, 0, Id, StatusFlags, CurrentValue, WorstValue, ThresholdValue, RawValue
sdim out_smart, 1024
out_smart = "ID\t現在値\t最悪値\t閾値\t生の値\n"
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
; 関連項目 を記入
smart_GetSmartInfoInt64
smart_GetSmartAttributeName
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetSmartInfoInt64Ex "smart_GetSmartInfoInt64Ex" int, int, var, var, var, var, var, var


%index
smart_GetSmartInfoInt64
; 見出し を記入
S.M.A.R.T. 情報を取得します(64bitを32bitずつ分割)
%prm
int1, int2, var3, var4, var5, var6, var7, var8, var9
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
var3	: S.M.A.R.T. ID を格納する配列変数(32bit整数)
var4	: ステータスフラグを格納する配列変数(32bit整数)
var5	: 現在値を格納する配列変数(32bit整数)
var6	: 最悪値を格納する配列変数(32bit整数)
var7	: しきい値を格納する配列変数(32bit整数)
var8	: 生の値(LowPart)を格納する配列変数(32bit)
var9	: 生の値(HighPart)を格納する配列変数(32bit)
%inst
; 解説文 を記入
S.M.A.R.T. 情報を取得します。
64bit値は32bitずつ分割して取得されます。
64bit値を直接取得する場合は smart_GetSmartInfoInt64Ex を使用してください。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。
取得したいディスク情報ID は以下のものが指定できます。

stat値
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(ディスク番号が範囲外)

%sample
; サンプルスクリプト を記入
smart_max = smart_GetSmartMaxAttribute()
dim Id, smart_max
dim StatusFlags, smart_max
dim CurrentValue, smart_max
dim WorstValue, smart_max
dim ThresholdValue, smart_max
ddim RawValue, smart_max
smart_GetSmartInfoInt64Ex hSmart, 0, Id, StatusFlags, CurrentValue, WorstValue, ThresholdValue, RawValue
sdim out_smart, 1024
out_smart = "ID\t現在値\t最悪値\t閾値\t生の値\n"
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
; 関連項目 を記入
smart_GetSmartInfoInt64Ex
smart_GetSmartAttributeName
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_GetSmartInfoInt64 "smart_GetSmartInfoInt64" int, int, var, var, var, var, var, var, var


%index
smart_GetSmartMaxAttribute
; 見出し を記入
S.M.A.R.T.の項目の最大数取得
%prm
()

%inst
; 解説文 を記入
S.M.A.R.T.の項目の最大数が返ります。
通常は30です。
S.M.A.R.T.の項目数を取得する場合は、smart_GetInfoIntのINFO_ATTRIBUTECOUNTを呼び出してください。

%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
smart_GetInfoInt
smart_GetSmartAttributeName
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #cfunc smart_GetSmartMaxAttribute "smart_GetSmartMaxAttribute"


%index
smart_ShellExecuteExAdminW
; 見出し を記入
指定プロセスを管理者権限つきで起動する
%prm
wstr1, wstr2
wstr1	: 実行ファイル名(文字列, 整数値)
wstr2	: コマンドライン(文字列, 整数値)

%inst
; 解説文 を記入
指定プロセスを管理者権限つきで起動します。
文字エンコードはUnicodeですが、自動でShift_JISからUTF-16に変換されるため、cnvstowなどで変換する必要はないです。

通常は、実行ファイル名、コマンドラインに文字列を指定します。
以下は特殊な使い方について説明してあります。

実行ファイル名を整数値の0にした場合は、自分自身が指定されます。（自分自身の起動）
実行ファイル名が "test.exe"の場合、
smart_ShellExecuteExAdminW 0, "-help"
と
smart_ShellExecuteExAdminW "test.exe", "-help"
は同じ意味になります。

実行ファイル名、コマンドライン共に整数値の0にした場合は、自分自身が起動され、自分自身のコマンドラインが指定されます。
smart_ShellExecuteExAdminW 0, 0

コマンドラインが必要ない場合は、"" と空文字にしてください。
smart_ShellExecuteExAdminW 0, ""

smart_ShellExecuteExAdminW 0, 0
と記述した場合は
smart_AdminSelfRunW
と同じ動作になります。

正常に実行された場合はstatに 0 が代入されます。
0  = 正常終了
-1 = コマンドラインのエラー
-2 = 実行エラー
%sample
; サンプルスクリプト を記入
// メモ帳を開いてみる(ファイルを用意する必要あり)
smart_ShellExecuteExAdminW "notepad", "\"C:\\日本語テスト.txt\""
%href
; 関連項目 を記入
smart_IsCurrentUserLocalAdministrator
smart_AdminSelfRunW
smart_Init
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_ShellExecuteExAdminW "smart_ShellExecuteExAdminW" wstr, wstr


%index
smart_AdminSelfRunW
; 見出し を記入
自分自身を管理者権限付きで起動する
%prm
引数なし

%inst
; 解説文 を記入
自分自身を管理者権限付きで起動します。
起動時に付加されたコマンドラインは引き継がれます。
引き継ぐ必要がない場合は、smart_ShellExecuteExAdminWを使用してください。
内部的には smart_ShellExecuteExAdminWを引数を0で呼び出しています。
正常に実行された場合はstatに 0 が代入されます。
0  = 正常終了
-1 = コマンドラインのエラー
-2 = 実行エラー
%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
smart_ShellExecuteExAdminW
smart_IsCurrentUserLocalAdministrator
%group
; グループ を記入
hspsmart.dll
; 定義 : [hspsmart.hsp] #func smart_AdminSelfRunW "smart_ShellExecuteExAdminW" nullptr, nullptr


%index
smart_GetInfoMax
; 見出し を記入
取得可能なディスク情報IDの最大数を取得
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
()

%inst
; 解説文 を記入
取得可能なディスク情報IDの最大数を取得します。
%sample
; サンプルスクリプト を記入
mes smart_GetInfoMax()
%href
; 関連項目 を記入

%group
; グループ を記入
hspsmart.dll
%index
smart_SetThreshold
; 見出し を記入
健康状態の基準値(閾値)を指定
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
int1, int2, int3, int4, int5, int6
int1	: 操作ハンドル(smart_Init()を実行して取得する)
int2	: ディスク番号(0～)
int3	: 05 代替処理済セクタ数(0～255, -1 を指定すると無視されます)
int4	: C5 代替処理保留中セクタ数(0～255, -1 を指定すると無視されます)
int5	: C6 回復不能セクタ数(0～255, -1 を指定すると無視されます)
int6	: FF 残り寿命(0～255, -1 を指定すると無視されます)
%inst
; 解説文 を記入
健康状態の基準値(閾値)を指定します。
健康状態の基準値(閾値)の現在値を取得するには、smart_GetInfoInt()を実行します。
ディスク番号は0番から始まり、最大数は smart_GetCount() で取得できます。

変更する必要のないところは -1 を指定すると、変更されません。

stat が 0 の場合は成功しています。
0  = 成功
-1 = 操作ハンドル無効
-2 = 引数エラー(値が範囲外)

%sample
; サンプルスクリプト を記入
smart_SetThreshold hSmart, 0, 1, 1, 1, -1
%href
; 関連項目 を記入
smart_CheckDiskStatus
smart_GetInfoInt
%group
; グループ を記入
hspsmart.dll
%index
smart_GetSmartAttributeName
; 見出し を記入
S.M.A.R.T. の項目名を取得します
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
(str1, int1, str2)
str1 : SMARTキー名(smart_GetInfoStringWのINFO_SMARTKEYNAMEから取得できます)
int1 : smartID
str2 : S.M.A.R.T. の項目名が記述されたiniファイルパス(絶対パス)
%inst
; 解説文 を記入
S.M.A.R.T. の項目名を取得します。

%sample
; サンプルスクリプト を記入
#include "hspsmart.as"

	title "ディスクを選択してください"
	
	// 初期化する
	hSmart = smart_Init()
	
	// USB/IEEE1394接続のHDDを検出対象にする
	smart_SetUSB1394 hSmart, FLAG_USB_ALL
	// IDE/ATA_PASS_THROUGH を使用します(問題がある場合はOFFに)
	smart_SetAtaPassThroughSmart hSmart, 1
	// IntelRAID環境下でCSMIを自動有効にする
	smart_SetCsmiType hSmart, CSMI_TYPE_ENABLE_AUTO
	
	// ディスクを検出する(CDIの再検出と同じ)
	// 初回起動時やディスクが後から追加・変更・削除されたりしたときに実行してください
	// この処理はやや重いです。再生中の音声が一瞬途切れることもあります。
	smart_DiskScan hSmart, 1, 1, 0, 1, 1
	
	if smart_GetCount(hSmart) <= 0{
		dialog "ディスクがないか、エラーが発生しました"
		end
	}
	
	// ディスク一覧作成
	sdim disklist, 1024
	repeat smart_GetCount(hSmart)
		// 格納に必要なサイズを取得
		size = smart_GetInfoStringSizeW(hSmart, cnt, INFO_MODEL)
		sdim buf, size + 2
		// モデル名取得
		smart_GetInfoStringW hSmart, cnt, INFO_MODEL, buf, size
		disklist += cnvwtos(buf) + "\n"
	loop
	
	// GUI
	width 320, 200
	objsize 320, 180
	listbox disk_id, 0, disklist
	objsize 320, 20
	button "選択したディスクの情報を見る", *go

stop
*go
	cls
	
	notesel disklist
	noteget diskname, disk_id
	title diskname
	
	width 640, 480
	// SMARTキー名取得
	size = smart_GetInfoStringSizeW(hSmart, disk_id, INFO_SMARTKEYNAME)
	sdim keyname, size + 2
	smart_GetInfoStringW hSmart, disk_id, INFO_SMARTKEYNAME, keyname, size
	keyname = cnvwtos(keyname)
	
	// SMART情報取得
	smart_max = smart_GetSmartMaxAttribute()
	dim Id, smart_max
	dim StatusFlags, smart_max
	dim CurrentValue, smart_max
	dim WorstValue, smart_max
	dim ThresholdValue, smart_max
	ddim RawValue, smart_max
	smart_GetSmartInfoInt64Ex hSmart, disk_id, Id, StatusFlags, CurrentValue, WorstValue, ThresholdValue, RawValue
	sdim out_smart, 1024
	out_smart = "ID\t項目名\t\t\t\t\t現在値\t最悪値\t閾値\t生の値\n"
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
; 関連項目 を記入
smart_GetSmartInfoInt64
smart_GetSmartInfoInt64Ex
smart_GetSmartMaxAttribute
%group
; グループ を記入

hspsmart.dll
%index
INFO_LIST
; 見出し を記入
取得可能なディスク情報ID一覧
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
命令・関数ではありません
%inst
; 解説文 を記入

【文字列型】【smart_GetInfoStringW】で指定可能なディスク情報ID
-------------------------------------------------------------------
INFO_ENCLOSURE			// ディスクエンクロージャ
INFO_SERIALNUMBER		// シリアルナンバー
INFO_SERIALNUMBERREVERSE	// シリアルナンバーを逆転したもの
INFO_FIRMWAREREV		// ファームウェアのレヴィジョン
INFO_FIRMWAREREVREVERSE		// ファームウェアのレヴィジョンを逆転したもの
INFO_MODEL			// モデル名
INFO_MODELREVERSE		// モデル名を逆転したもの
INFO_MODELWMI			// WMIから取得したモデル名
INFO_MODELSERIAL		// モデル名
INFO_DRIVEMAP			// ドライブマップ(C: D: とか)
INFO_MAXTRANSFERMODE		// 最大転送モード
INFO_CURRENTTRANSFERMODE	// 現在の転送モード
INFO_MAJORVERSION		// 対応規格
INFO_MINORVERSION		// 対応規格
INFO_INTERFACE			// インターフェース(SATAとか)
INFO_ENCLOSURE2			// ディスクエンクロージャ
INFO_COMMANDTYPESTRING		// コマンドタイプ
INFO_SSDVENDORSTRING		// SSDベンダー名
INFO_DEVICENOMINALFORMFACTOR	// フォームファクタ(2.5インチとか3.5インチ)
INFO_PNPDEVICEID		// PnpDeviceId
INFO_SMARTKEYNAME		// S.M.A.R.T.項目名抽出用キー名
-------------------------------------------------------------------
【32bit数値型】【smart_GetInfoInt】で指定可能なディスク情報ID
-------------------------------------------------------------------
INFO_USBPRODUCTID			// USBプロダクトID
INFO_USBVENDORID			// USBベンダーID
INFO_ISSMARTENABLED			// S.M.A.R.T.が有効かどうか？(0 = 無効, 1 = 有効)
INFO_ISIDINFOINCORRECT			// IsIdInfoIncorrect？(0 = No, 1 = Yes)
INFO_ISSMARTCORRECT			// IsSmartCorrect？(0 = No, 1 = Yes)
INFO_ISTHRESHOLDCORRECT			// IsThresholdCorrect？(0 = No, 1 = Yes)
INFO_ISCHECKSUMERROR			// チェックサムエラーの検出有効？(0 = 無効, 1 = 有効)
INFO_ISWORD88				// IsWord88？(0 = No, 1 = Yes)
INFO_ISWORD64_76			// IsWord64_76？(0 = No, 1 = Yes)
INFO_ISRAWVALUES8			// IsRawValues8？(0 = No, 1 = Yes)
INFO_ISRAWVALUES7			// IsRawValues7？(0 = No, 1 = Yes)
INFO_IS9126MB				// 9126MBかどうか？(HDD容量の壁？)(0 = No, 1 = Yes)
INFO_ISTHRESHOLDBUG			// 特定機種のファームバグ検出？(0 = No, 1 = Yes)
INFO_ISSMARTSUPPORTED			// S.M.A.R.T.をサポートしているかどうか？(0 = No, 1 = Yes)
INFO_ISLBA48SUPPORTED			// LBA48対応？(0 = No, 1 = Yes)
INFO_ISAAMSUPPORTED			// AAM対応？(0 = No, 1 = Yes)
INFO_ISAPMSUPPORTED			// APM対応？(0 = No, 1 = Yes)
INFO_ISAAMENABLED			// AAM有効？(0 = 無効, 1 = 有効)
INFO_ISAPMENABLED			// APM有効？(0 = 無効, 1 = 有効)
INFO_ISNCQSUPPORTED			// NCQ対応？(0 = No, 1 = Yes)
INFO_ISNVCACHESUPPORTED			// NVキャッシュをサポートしてる？(0 = No, 1 = Yes)
INFO_ISMAXTORMINUTE			// MaxtorMinute(0 = No, 1 = Yes)
INFO_ISSSD				// SSDかどうか？ (0 = No, 1 = Yes)
INFO_ISTRIMSUPPORTED			// SSDがTrimをサポートしているか？(0 = No, 1 = Yes)
INFO_PHYSICALDRIVEID			// 物理ドライブID
INFO_SCSIPORT				// SCSIポート
INFO_SCSITARGETID			// SCSIターゲットID
INFO_SCSIBUS				// SCSIバス
INFO_SILICONIMAGETYPE			// Silicon Image Controller タイプ
INFO_TOTALDISKSIZE			// 合計ディスクサイズ
INFO_CYLINDER				// シリンダー数
INFO_HEAD				// ヘッド数
INFO_SECTOR				// セクタ数
INFO_SECTOR28				// セクタ数(28bit)
INFO_DISKSIZECHS			// CHSで取得したディスクサイズ
INFO_DISKSIZELBA28			// LBA28で取得したディスクサイズ
INFO_DISKSIZELBA48			// LBA48で取得したディスクサイズ
INFO_DISKSIZEWMI			// WMIで取得したディスクサイズ
INFO_BUFFERSIZE				// バッファサイズ
INFO_TRANSFERMODETYPE			// 転送モード(戻り値はTRANSFER_MODE参照)
INFO_DETECTEDTIMEUNITTYPE		// Measured Time(使用時間)単位(戻り値はPOWER_ON参照)
INFO_MEASUREDTIMEUNITTYPE		// Detected Time(検出時間)単位(戻り値はPOWER_ON参照)
INFO_ATTRIBUTECOUNT			// S.M.A.R.T.の項目数(最大30)
INFO_DETECTEDPOWERONHOURS		// 使用時間
INFO_MEASUREDPOWERONHOURS		// 検出時間
INFO_POWERONRAWVALUE			// 使用時間生の値
INFO_POWERONSTARTRAWVALUE		// 使用開始時間生の値
INFO_POWERONCOUNT			// 電源投入回数
INFO_TEMPERATURE			// 温度
INFO_NOMINALMEDIAROTATIONRATE		// 回転数(5400RPMとか7200RPMなど)
INFO_HOSTWRITES				// 総書込量 (ホスト)
INFO_HOSTREADS				// 総読込量 (ホスト)
INFO_GBYTESERASED			// 消去データ量(GB単位)
INFO_NANDWRITES				// 総書込量 (NAND)
INFO_WEARLEVELINGCOUNT			// ウェアレベリング回数
INFO_LIFE				// 寿命
INFO_MAJOR				// メジャー
INFO_MINOR				// マイナー
INFO_DISKSTATUS				// ディスクステータス(smart_CheckDiskStatus()で取得できる値と同じ)
INFO_DRIVELETTERMAP			// ドライブレターマップ
INFO_ALARMTEMPERATURE			// 警報温度
INFO_ALARMHEALTHSTATUS			// 警報健康状態
INFO_DISKVENDORID			// ディスクベンダーID
INFO_USBVENDORID2			// USBベンダーID
INFO_USBPRODUCTID2			// USBプロダクトID
INFO_THRESHOLD05			// 注意と判定する05 代替処理済セクタ数(0～255)
INFO_THRESHOLDC5			// 注意と判定するC5 代替処理保留中セクタ数(0～255)
INFO_THRESHOLDC6			// 注意と判定するC6 回復不能セクタ数(0～255)
INFO_TARGET				// ？
INFO_INTERFACETYPE			// インターフェース(INTERFACEを参照)
INFO_COMMANDTYPE			// コマンドタイプ(COMMANDを参照)
INFO_THRESHOLDFF			// 注意と判定するFF 残り寿命(0～255)
INFO_ISDEVICESLEEPSUPPORTED		// DevSleepに対応しているか？
INFO_HOSTREADSWRITESUNIT		// ホストの読み書き単位？(HOSTREADSWRITESUNITを参照)
INFO_ISNVME						// NVMe かどうか？
INFO_ISUASP						// UASP かどうか？
INFO_IS_LOGICALSECTORSIZE		// LogicalSectorSize
-------------------------------------------------------------------
【64bit実数型】【smart_GetInfoDouble】で指定可能なディスク情報ID
-------------------------------------------------------------------
INFO_TEMPERATUREMULTIPLIER			// 温度で使用する倍数値(通常1.0)
-------------------------------------------------------------------
【構造体/配列型】【smart_GetInfoStruct】で指定可能なディスク情報ID
-------------------------------------------------------------------
INFO_IDENTIFYDEVICE		// IDENTIFY_DEVICE 構造体取得
INFO_SMARTREADDATA		// S.M.A.R.T. データ BYTE配列[512] 取得
INFO_SMARTREADTHRESHOLD		// S.M.A.R.T. しきい値データ BYTE配列[512] 取得
INFO_ATTRIBUTE			// SMART_ATTRIBUTE 構造体[30]取得(S.M.A.R.T.値)
INFO_THRESHOLD			// SMART_THRESHOLD 構造体[30]取得(S.M.A.R.T.しきい値)
-------------------------------------------------------------------
【64bit整数型】【smart_GetInfoInt64/Ex】で指定可能なディスク情報ID
-------------------------------------------------------------------
INFO_SECTOR48			// 48ビットLBAのセクタ数
INFO_NUMBEROFSECTORS		// セクタの数
INFO_NVCACHESIZE		// NVキャッシュのサイズ

%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
smart_GetInfoStringW
smart_GetInfoInt
smart_GetInfoDouble
smart_GetInfoStruct
smart_GetInfoInt64
smart_GetInfoInt64Ex
%group
; グループ を記入
hspsmart.dll
%index
TRANSFER_MODE
; 見出し を記入
転送モード
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
命令・関数ではありません
%inst
; 解説文 を記入
smart_GetInfoIntでINFO_TRANSFERMODETYPEを指定した時に返ってきます。
TRANSFER_MODE_UNKNOWN 		= 0	 // 不明
TRANSFER_MODE_PIO		= 1	 // PIOモード
TRANSFER_MODE_PIO_DMA		= 2	 // PIO/DMAモード
TRANSFER_MODE_ULTRA_DMA_16	= 3	 // UltraDMA16モード
TRANSFER_MODE_ULTRA_DMA_25	= 4	 // UltraDMA25モード
TRANSFER_MODE_ULTRA_DMA_33	= 5	 // UltraDMA33モード
TRANSFER_MODE_ULTRA_DMA_44	= 6	 // UltraDMA44モード
TRANSFER_MODE_ULTRA_DMA_66	= 7	 // UltraDMA66モード
TRANSFER_MODE_ULTRA_DMA_100	= 8	 // UltraDMA100モード
TRANSFER_MODE_ULTRA_DMA_133	= 9	 // UltraDMA133モード
TRANSFER_MODE_SATA_150		= 10	 // SATA/150
TRANSFER_MODE_SATA_300		= 11	 // SATA/300
TRANSFER_MODE_SATA_600		= 12	 // SATA/600
%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
smart_GetInfoInt
INFO_LIST
%group
; グループ を記入
hspsmart.dll
%index
POWER_ON
; 見出し を記入
時間単位
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
命令・関数ではありません
%inst
; 解説文 を記入
smart_GetInfoIntでINFO_DETECTEDTIMEUNITTYPE、MEASUREDTIMEUNITTYPEを指定した時に返ってきます。

POWER_ON_UNKNOWN	 = 0	// 不明
POWER_ON_HOURS		 = 1	// 1時間単位
POWER_ON_MINUTES	 = 2	// 1分間単位
POWER_ON_HALF_MINUTES	 = 3	// 30秒単位
POWER_ON_SECONDS	 = 4	// 1秒単位
POWER_ON_10_MINUTES	 = 5	// 10分単位
POWER_ON_MILLI_SECONDS	 = 6	// 1ミリ秒単位
%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
INFO_LIST
smart_GetInfoInt
%group
; グループ を記入
hspsmart.dll
%index
INTERFACE
; 見出し を記入
インターフェース
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
命令・関数ではありません
%inst
; 解説文 を記入
#define	global INTERFACE_TYPE_UNKNOWN	 	 0	// 不明
#define	global INTERFACE_TYPE_PATA	 		 1	// パラレルATA/IDE
#define	global INTERFACE_TYPE_SATA	 		 2	// シリアルATA
#define	global INTERFACE_TYPE_USB	 		 3	// USB
#define	global INTERFACE_TYPE_IEEE1394	 	 4	// IEEE1394
#define global INTERFACE_TYPE_SCSI			 5	// SCSI
%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
INFO_LIST
smart_GetInfoInt
%group
; グループ を記入
hspsmart.dll
%index
COMMAND
; 見出し を記入
コマンドタイプ
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
命令・関数ではありません
%inst
; 解説文 を記入
// 定数値は変更される可能性があります
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
; サンプルスクリプト を記入

%href
; 関連項目 を記入
INFO_LIST
smart_GetInfoInt
%group
; グループ を記入
hspsmart.dll
%index
HOSTREADSWRITESUNIT
; 見出し を記入
コマンドタイプ
%prm
; パラメータリスト を記入
; パラメータ説明文 を記入
命令・関数ではありません
%inst
; 解説文 を記入
// 定数値は変更される可能性があります
HOST_READS_WRITES_UNKNOWN = 0
HOST_READS_WRITES_512B    = 1
HOST_READS_WRITES_32MB    = 2
HOST_READS_WRITES_GB      = 3
%sample
; サンプルスクリプト を記入

%href
; 関連項目 を記入
INFO_LIST
smart_GetInfoInt
%group
; グループ を記入
hspsmart.dll
