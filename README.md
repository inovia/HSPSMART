# HSPSMART
================================================================================
【名    称】  HSPSMART.dll Version 1.11 (based CrystalDiskInfo 8.2.3)
【登 録 名】  hspsmart_111.zip hspsmart_111.7z
【制作者名】  イノビア 
【動作環境】  Windows 7, 8.1, 10
【ランタイム】HSP 3.0 以降
【公 開 日】  2013.05.28
【更 新 日】　2019.08.12
【開発環境】　Microsoft Visual Studio 2017
--------------------------------------------------------------------------------
【種　　別】  フリーソフト
【再 配 布】  改造を含め自由にどうぞ。ただし、CrystalDiskInfoのライセンスに準拠してください。
              http://crystalmark.info/software/CrystalDiskInfo/manual-ja/License.html
              本DLLも継承して MIT ライセンス で提供します。
================================================================================
 サポートURL : https://www.hinekure.net/
             : https://hsp.moe/
             : https://twitter.com/hk1v/
================================================================================
 本DLLのお問い合わせはイノビアの方にお願いします。
 CrystalDiskInfoでも同様の不具合が起きているなど、事象があきらかな場合を除いて、
 hiyohiyo氏に本DLLについて問い合わせをしないでください。
================================================================================
 本DLLを使用したことによる一切の損害に対し、作者は責任を負いません。
 予めご了承したうえでご使用ください。
================================================================================

 * 概要 - information

  当DLLはHSP3.0以降でディスクの情報やS.M.A.R.T.情報を取得することができます。
 HSP 3.5 beta3以降であれば、64bitネイティブ版が使用できます。

 hiyohiyo氏のCrystalDiskInfoのソースコードが使用されております。
 http://crystalmark.info/software/CrystalDiskInfo/
 ソースコードをsrcフォルダに格納してあります。

 本DLLを使用したソフトを配布する際は、Readme.txtなどにhiyohiyo氏の著作権表示や、
 CrystalDiskInfoのソースコードが使用されているという表示が必要です。

 COPYRIGHT.txt
 COPYRIGHT-ja.txt

 を参照してください。

 ちなみに、CrystalDiskInfo には付与されているデジタル署名は本DLLには付与していませんので、
 予めご了承のうえ使用してください。

 * インストール	- install

  hspsmart.dll、hspsmart64.dll を、HSP3がインストールされているフォルダにコピー、
 hspsmart.as、hspsmart64.as をHSP3がインストールされているフォルダの中のcommonフォルダの中にコピー、
 hspsmart.hs をHSP3がインストールされているフォルダの中のhsphelpフォルダの中にコピーしてください。

 * 64bit版ランタイム - 64bit runtime

  "64bit版HSPランタイム(HSP3.5beta3相当)" フォルダに 64bit版HSPランタイムを同梱しています。
 binフォルダの中身をHSPの実行環境にまるっとコピーしてお使いください。(HSP3.5 beta3 環境推奨)
 このランタイムを使用することで、「_x64.hsp」で終わるファイル名のサンプルが実行できます。

 * 使い方 - how to use

  使いたいスクリプトで #include "hspsmart.as" を記述すれば利用可能になります。
 "hspsmart.as"は"common"フォルダに入れるなりご自由にどうぞ。
 64bit版を使用する場合は、"hspsmart.as"の代わりに、"hspsmart64.as" を使用してください。

 それと、多少癖のある命令仕様があると思いますが、ご了承ください。
 サンプルを付属しておきましたのでご自由にご覧ください。

 * 命令仕様 - guide
 
 同梱している hspsmart.hs ファイルをHDLに読み込ませて命令マニュアルをご覧ください。

 * 更新履歴 - history

 1.00 -> 初版リリース
 1.01 -> 
　・CrystalDiskInfo 6.0.1対応
　・DevSleep検出対応(smart_GetInfoInt関数から取得可能)
　・[引数変更] smart_DiskScan命令に第7引数が追加されています。
　　S.M.A.R.T.に対応していないディスクを隠す機能です。
　・[引数変更] smart_SetThreshold命令に第6引数が追加されています。
　　SSDのFF 残り寿命の基準値(閾値)が設定できます。
　・IDENTIFY_DEVICE構造体のメンバ名が変更されています。
　　ReservedForFutureSerialAta→SerialAtaAdditionalCapabilities
　・定数の値が一部変更・追加されています。
　　DLLのバージョンとasファイルのバージョンが一致しないと、正常に動作しない場合が可能性があります。
　　すでにコンパイル済みのEXEの場合、DLLを差し替えただけでは正常に動作しない場合が可能性があります。
　　再コンパイルする必要があります。
 1.02 -> 
　・CrystalDiskInfo 6.0.4対応
　・asファイルとDLLのバージョンをチェックする機能を追加しました（自動でチェックされます）
　　チェックしたくない場合は、
　　#define global SMART_NO_CHECK_DLL_ERROR
　　#include "hspsmart.as"
　　のような感じで、インクルードの前に SMART_NO_CHECK_DLL_ERROR を定義してください。
　・CrystalDiskInfo 6.0.4のソースコードをそのまま使用したら、WMI使用時にHDDの台数がおかしくなる現象が発生するので、
　　AtaSmart.cpp内のCAtaSmart::GetTimeUnitType()内のモデル名の大文字化処理を別の変数にコピーしてから行うようにしています。
　　(実際のCrystalDiskInfo 6.0.4では発生していないので、修正されてる・・・？)
　　→1.03にて修正を確認。
 1.03 -> 
　・CrystalDiskInfo 6.1.8対応
 1.04 -> 
　・CrystalDiskInfo 6.1.12対応
 1.05 -> 
　・未リリース
　・CrystalDiskInfo 6.1.14対応
 1.06 -> 
　・CrystalDiskInfo 6.2.1対応
　・ATA_SMART_INFO構造体のPlextorNandWritesUnitメンバが廃止されたため、バージョンアップ時には注意してください。
　　（DLLのバージョンとasファイルのバージョンが一致しないと、正常に動作しない場合が可能性があります。
　　すでにコンパイル済みのEXEの場合、DLLを差し替えただけでは正常に動作しない場合が可能性があります。
　　再コンパイルする必要があります。）
　・コンソール版サンプルを追加
 1.07 -> 
　・CrystalDiskInfo 6.3.2対応
　・クラスポインタを直接渡していた箇所をインデックスによる管理に変更（hspsmart.cpp）
　（HSP側のソースは変更ない為、クラスポインタをごにょごにょしていない限りは、以前のバージョンと互換性があります）
　・64bit版DLL同梱
　　#runtime "hsp3_64"
　　#include "hspsmart64.as"
　　と記述すると使用できるようになります。
　・64bit版HSPランタイム同梱（3.5beta2相当）
 1.08 -> 
　・CrystalDiskInfo 6.7.5対応
　・64bit版HSP3CLランタイム同梱（3.5beta3相当）
　・定数の値が一部変更・追加されています。
　　DLLのバージョンとasファイルのバージョンが一致しないと、正常に動作しない場合が可能性があります。
　　すでにコンパイル済みのEXEの場合、DLLを差し替えただけでは正常に動作しない場合が可能性があります。
　　再コンパイルする必要があります。
 1.09 -> 
　・CrystalDiskInfo 7.0.0対応
　・定数の値が一部変更・追加されています。
     ⇒ CMD_TYPE_LOGITEC の廃止。 CMD_TYPE_LOGITEC1 と CMD_TYPE_LOGITEC2 の追加。
     ⇒ CMD_TYPE_NVME_STORAGE_QUERY の追加。
     ⇒ FLAG_USB_LOGITEC の廃止。 FLAG_USB_LOGITEC1 と FLAG_USB_LOGITEC2 の追加。
 1.10 -> 
　・CrystalDiskInfo 7.1.1対応
  ・C#版を暫定同梱(未実装部あり)。

 1.10 -> 
　・CrystalDiskInfo 8.2.3対応