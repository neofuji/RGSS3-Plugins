#==============================================================================
# ■ 文章途中で顔グラフィック変更 RGSS3 v1.2      MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　［文章の表示］の途中、任意の時点で顔グラフィックを変更できるようにします。
# 例えば文章中に \F[1] と入力するとその時点で表示されているファイルの 1 番目の
# 顔グラフィックに変更します。顔グラフィックの番号には変数も指定できます。
#==============================================================================

class Window_Message
  #--------------------------------------------------------------------------
  # ● 制御文字の処理【エイリアス】
  #     code : 制御文字の本体部分（「\C[1]」なら「C」）
  #     text : 描画処理中の文字列バッファ（必要なら破壊的に変更）
  #     pos  : 描画位置 {:x, :y, :new_x, :height}
  #--------------------------------------------------------------------------
  alias tic_process_escape_character process_escape_character
  def process_escape_character(code, text, pos)
    case code.upcase
    when 'F'
      $game_message.face_index = obtain_escape_param(text) - 1
      contents.clear_rect(0, 0, 96, 96)
      draw_face($game_message.face_name, $game_message.face_index, 0, 0)
    else
      tic_process_escape_character(code, text, pos)
    end
  end
end
