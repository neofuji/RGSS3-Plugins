#==============================================================================
# ■ スキルタイプ別選択位置記憶 RGSS3 v1.1        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　最後に選択したスキルをスキルタイプ別に記憶します。
#==============================================================================

class Game_Actor
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader   :last_skills              # カーソル記憶用 : タイプ別スキル
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_initialize initialize
  def initialize(actor_id)
    toruic_initialize(actor_id)
    @last_skills = []
  end
end
#------------------------------------------------------------------------------
class Window_SkillList
  #--------------------------------------------------------------------------
  # ● 前回の選択位置を復帰【※再定義※】
  #--------------------------------------------------------------------------
  def select_last
    if @actor.last_skills[@stype_id]
      select(@data.index(@actor.last_skills[@stype_id].object) || 0)
    else
      select(0)
    end
  end
end
#------------------------------------------------------------------------------
class Scene_Skill
  #--------------------------------------------------------------------------
  # ● アイテム［決定］【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_on_item_ok on_item_ok
  def on_item_ok
    @actor.last_skills[item.stype_id] ||= Game_BaseItem.new
    @actor.last_skills[item.stype_id].object = item
    toruic_on_item_ok
  end
end
#------------------------------------------------------------------------------
class Scene_Battle
  #--------------------------------------------------------------------------
  # ● スキル［決定］【※再定義※】
  #--------------------------------------------------------------------------
  def on_skill_ok
    @skill = @skill_window.item
    BattleManager.actor.input.set_skill(@skill.id)
    BattleManager.actor.last_skills[@skill.stype_id] ||= Game_BaseItem.new
    BattleManager.actor.last_skills[@skill.stype_id].object = @skill
    BattleManager.actor.last_skill.object = @skill
    if !@skill.need_selection?
      @skill_window.hide
      next_command
    elsif @skill.for_opponent?
      select_enemy_selection
    else
      select_actor_selection
    end
  end
end
