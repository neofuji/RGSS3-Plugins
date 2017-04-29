#==============================================================================
# ■ 選択中の行動対象点滅 RGSS3 v1.0              MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　戦闘中、行動対象の選択時に対象の画像が点滅するようにします。
#==============================================================================

class << BattleManager
  attr_accessor :selected_battler
  #--------------------------------------------------------------------------
  # ● メンバ変数の初期化【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_init_members init_members
  def init_members
    toruic_init_members
    @selected_battler = nil     # 選択中のバトラー
  end
end
#------------------------------------------------------------------------------
class Game_Battler
  #--------------------------------------------------------------------------
  # ● 【新規】選択状態の取得
  #--------------------------------------------------------------------------
  def selected?
    BattleManager.selected_battler == self
  end
end
#------------------------------------------------------------------------------
class Sprite_Battler
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_initialize initialize
  def initialize(viewport, battler = nil)
    toruic_initialize(viewport, battler)
    @selection_effect_count = 0
  end
  #--------------------------------------------------------------------------
  # ● エフェクトの更新【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_update_effect update_effect
  def update_effect
    toruic_update_effect
    update_selection_effect unless effect?
  end
  #--------------------------------------------------------------------------
  # ● 【新規】選択エフェクトの更新
  #--------------------------------------------------------------------------
  def update_selection_effect
    if @battler.selected?
      @selection_effect_count += 1
      if @selection_effect_count % 30 < 15
        self.color.set(255, 255, 255, 64)
      else
        self.color.set(0, 0, 0, 0)
      end
    elsif @selection_effect_count > 0
      @selection_effect_count = 0
      self.color.set(0, 0, 0, 0)
    end
  end
end
#------------------------------------------------------------------------------
class Window_BattleActor
  #--------------------------------------------------------------------------
  # ● カーソル位置の設定【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_index= index=
  def index=(index)
    self.toruic_index = index
    BattleManager.selected_battler = $game_party.battle_members[@index]
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウの非表示【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_hide hide
  def hide
    BattleManager.selected_battler = nil
    toruic_hide
  end
end
#------------------------------------------------------------------------------
class Window_BattleEnemy
  #--------------------------------------------------------------------------
  # ● カーソル位置の設定【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_index= index=
  def index=(index)
    self.toruic_index = index
    BattleManager.selected_battler = enemy
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウの非表示【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_hide hide
  def hide
    BattleManager.selected_battler = nil
    toruic_hide
  end
end
