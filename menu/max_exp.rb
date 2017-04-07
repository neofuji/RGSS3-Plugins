#==============================================================================
# ■ 最高レベルでも経験値を表示 RGSS3 v1.1        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　ステータス画面で、アクターが最高レベルならカンストした経験値を表示します。
#==============================================================================

class Window_Status
  #--------------------------------------------------------------------------
  # ● 経験値情報の描画【※再定義※】
  #--------------------------------------------------------------------------
  def draw_exp_info(x, y)
    s1 = @actor.max_level? ? @actor.current_level_exp : @actor.exp
    s2 = @actor.max_level? ? "-------" : @actor.next_level_exp - @actor.exp
    s_next = sprintf(Vocab::ExpNext, Vocab::level)
    change_color(system_color)
    draw_text(x, y + line_height * 0, 180, line_height, Vocab::ExpTotal)
    draw_text(x, y + line_height * 2, 180, line_height, s_next)
    change_color(normal_color)
    draw_text(x, y + line_height * 1, 180, line_height, s1, 2)
    draw_text(x, y + line_height * 3, 180, line_height, s2, 2)
  end
end
