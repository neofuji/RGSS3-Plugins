# RGSS3-Plugins
私が過去に某所で公開していたRGSS3素材をこのたび再公開することになりました。RPGツクールVX Aceで使用できます。

## 利用規約
[MIT License](https://github.com/neofuji/RGSS3-Plugins/blob/master/LICENSE)に従ってお使いください。
なお、**サポートは一切行っておりません**。

## システム系
- [スキルタイプ別選択位置記憶](https://github.com/neofuji/RGSS3-Plugins/blob/master/system/last_skill.rb) v1.1
  - 最後に選択したスキルをスキルタイプ別に記憶します。
+ [プレイ中画面OFF抑制](https://github.com/neofuji/RGSS3-Plugins/blob/master/system/display_required.rb) v1.0
  + プレイ中にディスプレイの電源が切れたりスクリーンセーバーが起動したりしないようにします。
  + ゲームパッドでのプレイや、長時間の放置を要する場合に有用です。

## バトル系
- [バトルで自分を優先選択](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/select_me.rb) v1.1
  - スキル・アイテムの対象アクター選択のカーソル初期位置をその使用者にします。
- [ステート自動付加・解除特徴](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/state_feature.rb) v2.0
  - 特定のタイミングでステートを自動的に付加・解除する特徴を作ります。
- [封印済スキルコマンドを無効化](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/sealed_skillcommand.rb) v1.1
  - バトル画面で、封印されたスキルタイプのコマンドを選べなくします。
- [ドロップアイテム個数表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/num_dropitems.rb) v1.0
  - 同じドロップアイテムをまとめ、ドロップアイテムに個数を表示します。
- [逃走不能特徴](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/escape_feature.rb) v1.0
  - 逃走できなくなる特徴を作ります。
- [バトル画面の枠線の途切れ解消](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/battle_border.rb) v1.0
  - ステータスウィンドウに別のウィンドウが重なっても枠線を途切れなくします。
- [戦闘勝利BGM](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/victory_bgm.rb) v1.0
  - 戦闘勝利時にMEの代わりにBGMを演奏します。
+ [ドロップアイテム単一化](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/unique_dropitem.rb) v1.0
  + 同じ敵が複数ドロップしないようにします。
+ [戦闘敗北BGM](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/defeat_bgm.rb) v1.0
  + 戦闘敗北時にBGMを演奏します。
+ [メニューのみのスキル戦闘時非表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/exclude_menuskill.rb) v1.0
  + メニューのみ使用可能のスキルを戦闘画面から除外します。
+ [レベルアップ能力値表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/battle/display_paramup.rb) v1.0
  + アクターがレベルアップしたとき、各能力値の上昇量を表示します。

## メニュー系
- [プロフィールをスクロール](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/profile_scroll.rb) v2.0
  - 3行以上のプロフィールに対応し、上下スクロールを可能にします。
- [ショップの個数入力を快適化](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/shop_number.rb) v1.2
  - 1個のときにさらに減らすと最大個数に、またその逆を可能にします。
- [メニューのアクター選択省略](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/quick_swap.rb) v2.0
  - 1人パーティーならスキル・装備・ステータスを選ぶと直ちにそれらを表示します。
  - 2人パーティーなら並び替えを選ぶと直ちに2人を入れ替えます。
- [最高レベルでも経験値を表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/max_exp.rb) v1.1
  - ステータス画面で、アクターが最高レベルならカンストした経験値を表示します。
- [5文字用タイトルウィンドウ](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/title_5.rb) v1.1
  - タイトル・ゲーム終了ウィンドウを5文字分の幅にし、文字を中央揃えにします。
  - 「はじめから」「つづきから」に向いています。
- [タイトル画面に著作権表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/title_copyright.rb) v1.0
  - タイトル画面に任意の著作権表示を描画します。
- [セーブ画面スクロール矢印表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/save_arrow.rb) v1.0
  - セーブ画面とロード画面にスクロール用矢印を表示します。
+ [スナップショット自動解放](https://github.com/neofuji/RGSS3-Plugins/blob/master/menu/dispose_snapshot.rb) v1.0
  + メニューの背景に使用されるスナップショットを適当なタイミングで解放します。
  + マップや戦闘でのメモリ使用量が 1 MB ほど削減できます。

## マップ系
- [乗船中のBGM自動切り替え禁止](https://github.com/neofuji/RGSS3-Plugins/blob/master/map/riding_nonautoplay.rb) v1.0
  - 乗り物に乗っている状態で場所移動したときのBGM自動切り替えを禁止します。
- [テストプレイ機能無効化](https://github.com/neofuji/RGSS3-Plugins/blob/master/map/disable_testplay.rb) v1.0
  - `$TEST` に依存する処理を取り除き、テストプレイ機能を完全に無効化します。チート対策に。
+ [ロード後マップ名表示](https://github.com/neofuji/RGSS3-Plugins/blob/master/map/loaded_mapname.rb) v1.0
  + ロード後にマップ名を表示します。

## イベント系
- [タイマー一時停止](https://github.com/neofuji/RGSS3-Plugins/blob/master/event/timer_resume.rb) v1.1
  - タイマー停止後、0分0秒のタイマーを始動することで再開できるようにします。
+ [ゲームオーバー中央揃え](https://github.com/neofuji/RGSS3-Plugins/blob/master/event/center_gameover.rb) v1.0
  + ゲームオーバー画面で画面サイズと異なる画像を中央揃えにします。
+ [数値入力キャンセル](https://github.com/neofuji/RGSS3-Plugins/blob/master/event/num_cancel.rb) v1.0
  + 名前に `?` を含む変数に対する数値入力の処理をキャンセルできるようにします。
  + キャンセルした場合、`-1 - 入力した数値`がその変数に格納されます。
