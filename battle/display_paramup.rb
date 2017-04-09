#==============================================================================
# ■ レベルアップ能力値表示 RGSS3 v1.0            MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　アクターがレベルアップしたとき、各能力値の上昇量を表示します。
#==============================================================================

module Vocab
  # 戦闘終了メッセージ
  ParamUp = "%sが %s 上がった！"
end
#------------------------------------------------------------------------------
class Game_Actor
  #--------------------------------------------------------------------------
  # ● 経験値の変更【エイリアス】
  #     show : レベルアップ表示フラグ
  #--------------------------------------------------------------------------
  alias toruic_change_exp change_exp
  def change_exp(exp, show)
    @last_params = Array.new(8) {|i| param(i) }
    toruic_change_exp(exp, show)
    remove_instance_variable(:@last_params)
  end
  #--------------------------------------------------------------------------
  # ● レベルアップメッセージの表示【※再定義※】
  #     new_skills : 新しく習得したスキルの配列
  #--------------------------------------------------------------------------
  def display_level_up(new_skills)
    $game_message.new_page
    $game_message.add(sprintf(Vocab::LevelUp, @name, Vocab::level, @level))
    @last_params.each_with_index do |last_param, i|
      d = param(i) - last_param
      $game_message.add(sprintf(Vocab::ParamUp, Vocab.param(i), d)) if d > 0
    end
    new_skills.each do |skill|
      $game_message.add(sprintf(Vocab::ObtainSkill, skill.name))
    end
  end
end
