# RGSS3-Plugins
私が過去に某所で公開していたRGSS3素材をこのたび再公開することになりました。RPGツクールVX Aceで使用できます。

## 利用規約
[MIT License](/LICENSE)に従ってお使いください。
なお、**サポートは一切行っておりません**。

## システム系
- [スキルタイプ別選択位置記憶](/system/last_skill.rb) v1.1
  - 最後に選択したスキルをスキルタイプ別に記憶します。
+ [プレイ中画面OFF抑制](/system/display_required.rb) v1.0
  + プレイ中にディスプレイの電源が切れたりスクリーンセーバーが起動したりしないようにします。
  + ゲームパッドでのプレイや、長時間の放置を要する場合に有用です。
+ [アニメーション別速度設定](/system/animation_rate.rb) v1.0
  + アニメーションの名前に `%2` のように数値を指定すると、アニメーションの速度をその数値で置き換えます。
  + 数値が小さいほどアニメーションは速く再生されます。
+ [レベル増減時HPとMP割合保持](/system/preserve_mhp.rb) v1.0
  + アクターのレベルが増減したとき、HP と MP の数値ではなく割合を保持します。
  + 例えば HP が満タンでレベルアップすれば、最大 HP が増えても満タンのままです。

## バトル系/システム
- [ステート自動付加・解除特徴](/battle/state_feature.rb) v2.0
  - 特定のタイミングでステートを自動的に付加・解除する特徴を作ります。
- [逃走不能特徴](/battle/escape_feature.rb) v1.0
  - 逃走できなくなる特徴を作ります。
- [戦闘勝利BGM](/battle/victory_bgm.rb) v2.0
  - 戦闘勝利時、ME 演奏後に BGM を演奏します。
  - ME は演奏せず BGM のみを演奏する場合、別途 ME を `(なし)` に設定してください。
  - 逆に BGM のファイル名を `""` (なし) に設定すると、ME 演奏後無音にできます。
+ [ドロップアイテム単一化](/battle/unique_dropitem.rb) v1.0
  + 同じ敵が複数ドロップしないようにします。
+ [戦闘敗北BGM](/battle/defeat_bgm.rb) v1.0
  + 戦闘敗北時にBGMを演奏します。
+ [逃走回数の記録【RPGMVバックポート】](/battle/escape_count.rb) v1.1
  + 逃走回数を記録します。
  + イベントコマンド［変数の操作］にて逃走回数を取得するには、オペランドにスクリプト `$game_system.escape_count` を指定します。
+ [勝利回数の記録【RPGMVバックポート】](/battle/win_count.rb) v1.0
  + 勝利回数を記録します。
  + イベントコマンド［変数の操作］にて勝利回数を取得するには、オペランドにスクリプト `$game_system.win_count` を指定します。

## バトル系/画面表示
- [バトルで自分を優先選択](/battle/select_me.rb) v1.1
  - スキル・アイテムの対象アクター選択のカーソル初期位置をその使用者にします。
- [封印済スキルコマンドを無効化](/battle/sealed_skillcommand.rb) v1.1
  - バトル画面で、封印されたスキルタイプのコマンドを選べなくします。
- [ドロップアイテム個数表示](/battle/num_dropitems.rb) v1.0
  - 同じドロップアイテムをまとめ、ドロップアイテムに個数を表示します。
- [バトル画面の枠線の途切れ解消](/battle/battle_border.rb) v1.0
  - ステータスウィンドウに別のウィンドウが重なっても枠線を途切れなくします。
+ [メニューのみのスキル戦闘時非表示](/battle/exclude_menuskill.rb) v1.0
  + メニューのみ使用可能のスキルを戦闘画面から除外します。
+ [レベルアップ能力値表示](/battle/display_paramup.rb) v1.0
  + アクターがレベルアップしたとき、各能力値の上昇量を表示します。
+ [選択中の行動対象点滅【RPGMVバックポート】](/battle/selection_effect.rb) v1.0
  + 戦闘中、行動対象の選択時に対象の画像が点滅するようにします。
+ [武器不適合スキル戦闘時非表示](/battle/hideby_wtype.rb) v1.0
  + 戦闘中、必要武器の条件を満たさないスキルを非表示にします。
+ [スキルの使用時メッセージ修正【RPGMVバックポート】](/battle/skill_message.rb) v1.0
  + スキルの使用時メッセージ 1 行目を空にすると、使用者の名前を非表示にします。

## メニュー系
- [【ステータス】プロフィールをスクロール](/menu/profile_scroll.rb) v2.0
  - 3行以上のプロフィールに対応し、上下スクロールを可能にします。
- [【ショップ】ショップの個数入力を快適化](/menu/shop_number.rb) v1.2
  - 1個のときにさらに減らすと最大個数に、またその逆を可能にします。
- [【メニュー】メニューのアクター選択省略](/menu/quick_swap.rb) v2.0
  - 1人パーティーならスキル・装備・ステータスを選ぶと直ちにそれらを表示します。
  - 2人パーティーなら並び替えを選ぶと直ちに2人を入れ替えます。
- [【ステータス】最高レベルでも経験値を表示](/menu/max_exp.rb) v1.1
  - ステータス画面で、アクターが最高レベルならカンストした経験値を表示します。
- [【タイトル】【ゲーム終了】5文字用タイトルウィンドウ](/menu/title_5.rb) v1.1
  - タイトル・ゲーム終了ウィンドウを5文字分の幅にし、文字を中央揃えにします。
  - 「はじめから」「つづきから」に向いています。
- [【タイトル】タイトル画面に著作権表示](/menu/title_copyright.rb) v1.0
  - タイトル画面に任意の著作権表示を描画します。
- [【セーブ】【ロード】セーブ画面スクロール矢印表示](/menu/save_arrow.rb) v1.1
  - セーブ画面とロード画面にスクロール用矢印を表示します。
+ [スナップショット自動解放](/menu/dispose_snapshot.rb) v1.0
  + メニューの背景に使用されるスナップショットを適当なタイミングで解放します。
  + マップや戦闘でのメモリ使用量が 1 MB ほど削減できます。

## マップ系
- [乗船中のBGM自動切り替え禁止](/map/riding_nonautoplay.rb) v1.0
  - 乗り物に乗っている状態で場所移動したときのBGM自動切り替えを禁止します。
- [テストプレイ機能無効化](/map/disable_testplay.rb) v1.0
  - `$TEST` に依存する処理を取り除き、テストプレイ機能を完全に無効化します。チート対策に。
+ [ロード後マップ名表示](/map/loaded_mapname.rb) v1.0
  + ロード後にマップ名を表示します。
+ [場所移動後のマップ名表示修正](/map/name_display.rb) v1.0
  + マップ名表示が OFF のまま場所移動しても、直後に ON に変更するとマップ名が表示されてしまう不具合を修正します。
+ [遠景床【RPGMVバックポート】](/map/zero_parallax.rb) v1.0
  + ファイル名が `!` で始まる遠景を床（視差ゼロ）として扱うようにします。

## イベント系
- [タイマー一時停止](/event/timer_resume.rb) v1.1
  - タイマー停止後、0分0秒のタイマーを始動することで再開できるようにします。
+ [ゲームオーバー中央揃え](/event/center_gameover.rb) v1.0
  + ゲームオーバー画面で画面サイズと異なる画像を中央揃えにします。
+ [数値入力キャンセル](/event/num_cancel.rb) v1.0
  + 名前に `?` を含む変数に対する数値入力の処理をキャンセルできるようにします。
  + キャンセルした場合、`-1 - 入力した数値`がその変数に格納されます。
+ [文章途中で顔グラフィック変更](/event/change_face_image_in_text.rb) v1.1
  + ［文章の表示］の途中、任意の時点で顔グラフィックを変更できるようにします。
