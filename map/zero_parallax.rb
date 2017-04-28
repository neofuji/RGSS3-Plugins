#==============================================================================
# ■ 遠景床 RGSS3 v1.0                            MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　ファイル名が ! で始まる遠景を床（視差ゼロ）として扱うようにします。
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # ● 遠景のセットアップ【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_setup_parallax setup_parallax
  def setup_parallax
    toruic_setup_parallax
    @parallax_zero = @parallax_name.start_with?('!')
  end
  #--------------------------------------------------------------------------
  # ● 遠景表示の原点 X 座標の計算【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_parallax_ox parallax_ox
  def parallax_ox(bitmap)
    return @parallax_x * 32 if @parallax_zero
    toruic_parallax_ox(bitmap)
  end
  #--------------------------------------------------------------------------
  # ● 遠景表示の原点 Y 座標の計算【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_parallax_oy parallax_oy
  def parallax_oy(bitmap)
    return @parallax_y * 32 if @parallax_zero
    toruic_parallax_oy(bitmap)
  end
  #--------------------------------------------------------------------------
  # ● 遠景の変更【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_change_parallax change_parallax
  def change_parallax(name, loop_x, loop_y, sx, sy)
    toruic_change_parallax(name, loop_x, loop_y, sx, sy)
    @parallax_zero = @parallax_name.start_with?('!')
  end
end
