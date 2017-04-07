# RGSS3-Plugins
私が過去に某所で公開していたRGSS3素材をこのたび再公開することになりました。RPGツクールVX Aceで使用できます。

## 利用規約
[MIT License](https://github.com/neofuji/RGSS3-Plugins/blob/master/LICENSE)に従ってお使いください。
なお、**サポートは一切行っておりません**。

## システム系
- [スキルタイプ別選択位置記憶](https://github.com/neofuji/RGSS3-Plugins/blob/master/system/last_skill.rb) v1.1
  - 最後に選択したスキルをスキルタイプ別に記憶します。

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

## マップ系
- [乗船中のBGM自動切り替え禁止](https://github.com/neofuji/RGSS3-Plugins/blob/master/map/riding_nonautoplay.rb) v1.0
  - 乗り物に乗っている状態で場所移動したときのBGM自動切り替えを禁止します。
- [テストプレイ機能無効化](https://github.com/neofuji/RGSS3-Plugins/blob/master/map/disable_testplay.rb) v1.0
  - `$TEST` に依存する処理を取り除き、テストプレイ機能を完全に無効化します。チート対策に。

## イベント系
- [タイマー一時停止](https://github.com/neofuji/RGSS3-Plugins/blob/master/event/timer_resume.rb) v1.0
  - タイマー停止後、0分0秒のタイマーを始動することで再開できるようにします。
