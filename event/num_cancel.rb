#==============================================================================
# ■ 数値入力キャンセル RGSS3 v1.0                MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　名前に ? を含む変数に対する数値入力の処理をキャンセルできるようにします。
# キャンセルした場合、-1 - 入力した数値がその変数に格納されます。
#==============================================================================

class Window_NumberInput
  #--------------------------------------------------------------------------
  # ● キャンセルボタンが押されたときの処理【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_process_cancel process_cancel
  def process_cancel
    toruic_process_cancel
    if $data_system.variables[$game_message.num_input_variable_id].include?('?')
      Sound.play_cancel
      $game_variables[$game_message.num_input_variable_id] = -1 - @number
      deactivate
      close
    end
  end
end
