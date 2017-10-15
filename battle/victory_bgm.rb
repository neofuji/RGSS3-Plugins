#==============================================================================
# ■ 戦闘勝利BGM RGSS3 v2.0                       MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　戦闘勝利時、ME 演奏後に BGM を演奏します。イベントコマンド［スクリプト］に
# $game_system.battle_victory_bgm =
#   RPG::BGM.new("ファイル名", ボリューム, ピッチ)
# と記述することで戦闘勝利 BGM をゲーム中に変更することもできます。
# ME は演奏せず BGM のみを演奏する場合、別途 ME を (なし) に設定してください。
# 逆に BGM のファイル名を "" (なし) に設定すると、ME 演奏後無音にできます。
#==============================================================================

class Game_System
  #--------------------------------------------------------------------------
  # ● 定数
  #--------------------------------------------------------------------------
  DEFAULT_BATTLE_VICTORY_BGM = RPG::BGM.new("Scene4", 100, 100) # 既定の BGM
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_initialize initialize
  def initialize
    toruic_initialize
    @battle_victory_bgm = nil
  end
  #--------------------------------------------------------------------------
  # ● 【新規】戦闘勝利 BGM の取得
  #--------------------------------------------------------------------------
  def battle_victory_bgm
    @battle_victory_bgm || DEFAULT_BATTLE_VICTORY_BGM
  end
  #--------------------------------------------------------------------------
  # ● 【新規】戦闘勝利 BGM の設定
  #--------------------------------------------------------------------------
  def battle_victory_bgm=(battle_victory_bgm)
    @battle_victory_bgm = battle_victory_bgm
  end
end
#------------------------------------------------------------------------------
class << BattleManager
  #--------------------------------------------------------------------------
  # ● 勝利の処理【※再定義※】
  #--------------------------------------------------------------------------
  def process_victory
    play_battle_end_me
    if $game_system.battle_victory_bgm
      $game_system.battle_victory_bgm.play
    else
      replay_bgm_and_bgs
    end
    $game_message.add(sprintf(Vocab::Victory, $game_party.name))
    display_exp
    gain_gold
    gain_drop_items
    gain_exp
    SceneManager.return
    battle_end(0)
    return true
  end
end
#------------------------------------------------------------------------------
class Scene_Battle
  #--------------------------------------------------------------------------
  # ● 終了処理【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_terminate terminate
  def terminate
    toruic_terminate
    BattleManager.replay_bgm_and_bgs if $game_system.battle_victory_bgm
  end
end
