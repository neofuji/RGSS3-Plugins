#==============================================================================
# ■ ステート自動付加・解除特徴 RGSS3 v2.0        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　アクター・職業・武器・防具・敵キャラ・ステートのメモ欄に以下のキーワードを
# 入力すると、そのタイミングでステートを自動的に付加・解除します(複数指定可)。
#
# ・<戦闘開始時ステートi付加 r%>  …戦闘開始後にステートi番を付加します。
# ・<戦闘開始時ステートi解除 r%>  …戦闘開始後にステートi番を解除します。
# ・<ターン開始時ステートi付加 r%>…ターン開始前にステートi番を付加します。
# ・<ターン開始時ステートi解除 r%>…ターン開始前にステートi番を解除します。
# ・<行動開始時ステートi付加 r%>  …戦闘行動開始前にステートi番を付加します。
# ・<行動開始時ステートi解除 r%>  …戦闘行動開始前にステートi番を解除します。
# ・<行動終了時ステートi付加 r%>  …戦闘行動終了後にステートi番を付加します。
# ・<行動終了時ステートi解除 r%>  …戦闘行動終了後にステートi番を解除します。
# ・<ターン終了時ステートi付加 r%>…ターン終了後にステートi番を付加します。
# ・<ターン終了時ステートi解除 r%>…ターン終了後にステートi番を解除します。
# ・<戦闘終了時ステートi付加 r%>  …戦闘終了前にステートi番を付加します。
# ・<戦闘終了時ステートi解除 r%>  …戦闘終了前にステートi番を解除します。
#
# 　r%は成功率(整数)です。省略すると100%となります。ステート有効度は無視します。
# 　敵がステートを自動付加されたときは味方用のメッセージを表示します。
# (例)「○○を眠らせた！」→「○○は眠ってしまった！」
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  # ● 【新規】特徴によるステート付加・解除
  #--------------------------------------------------------------------------
  def affect_states_by_feature(timing)
    remove_regexp = /<#{timing}時ステート(\d+)解除\s*(?:(\d+)%)?>/
    add_regexp = /<#{timing}時ステート(\d+)付加\s*(?:(\d+)%)?>/
    feature_objects.each do |obj|
      obj.note.scan(remove_regexp) do |values|
        remove_state(values[0].to_i) if !values[1] || rand(100) < values[1].to_i
      end
      obj.note.scan(add_regexp) do |values|
        add_state(values[0].to_i) if !values[1] || rand(100) < values[1].to_i
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 【新規】戦闘行動開始時の処理
  #--------------------------------------------------------------------------
  def on_action_start
    @result.clear
    affect_states_by_feature("行動開始")
  end
  #--------------------------------------------------------------------------
  # ● 【新規】ターン開始時の処理
  #--------------------------------------------------------------------------
  def on_turn_start
    @result.clear
    affect_states_by_feature("ターン開始")
  end
  #--------------------------------------------------------------------------
  # ● 戦闘用ステートの解除【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_remove_battle_states remove_battle_states
  def remove_battle_states
    affect_states_by_feature("戦闘終了")
    toruic_remove_battle_states
  end
  #--------------------------------------------------------------------------
  # ● 戦闘開始処理【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_on_battle_start on_battle_start
  def on_battle_start
    toruic_on_battle_start
    @result.clear
    affect_states_by_feature("戦闘開始")
  end
  #--------------------------------------------------------------------------
  # ● 戦闘行動終了時の処理【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_on_action_end on_action_end
  def on_action_end
    toruic_on_action_end
    affect_states_by_feature("行動終了")
  end
  #--------------------------------------------------------------------------
  # ● ターン終了処理【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_on_turn_end on_turn_end
  def on_turn_end
    toruic_on_turn_end
    affect_states_by_feature("ターン終了") if $game_party.in_battle
  end
end
#------------------------------------------------------------------------------
class Window_BattleLog
  #--------------------------------------------------------------------------
  # ● 影響を受けたステータスの表示【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_display_affected_status display_affected_status
  def display_affected_status(target, item)
    @state_auto_added = !item if target.result.status_affected?
    toruic_display_affected_status(target, item)
  end
  #--------------------------------------------------------------------------
  # ● ステート付加の表示【※再定義※】
  #--------------------------------------------------------------------------
  def display_added_states(target)
    is_message1 = target.actor? || @state_auto_added
    @state_auto_added = nil
    target.result.added_state_objects.each do |state|
      state_msg = is_message1 ? state.message1 : state.message2
      target.perform_collapse_effect if state.id == target.death_state_id
      next if state_msg.empty?
      replace_text(target.name + state_msg)
      wait
      wait_for_effect
    end
  end
end
#------------------------------------------------------------------------------
class Scene_Battle
  #--------------------------------------------------------------------------
  # ● ターン開始【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_turn_start turn_start
  def turn_start
    toruic_turn_start
    all_battle_members.each do |battler|
      battler.on_turn_start
      refresh_status
      @log_window.display_auto_affected_status(battler)
      @log_window.wait_and_clear
    end
  end
  #--------------------------------------------------------------------------
  # ● 戦闘行動の処理【※再定義※】
  #--------------------------------------------------------------------------
  def process_action
    return if scene_changing?
    if !@subject || !@subject.current_action
      if @subject = BattleManager.next_subject
        @subject.on_action_start
        refresh_status
        @log_window.display_auto_affected_status(@subject)
        @log_window.wait_and_clear
      end
    end
    return turn_end unless @subject
    if @subject.current_action
      @subject.current_action.prepare
      if @subject.current_action.valid?
        @status_window.open
        execute_action
      end
      @subject.remove_current_action
    end
    process_action_end unless @subject.current_action
  end
end
