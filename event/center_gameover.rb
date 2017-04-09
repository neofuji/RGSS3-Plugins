#==============================================================================
# ■ ゲームオーバー中央揃え RGSS3 v1.0            MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　ゲームオーバー画面で画面サイズと異なる画像を中央揃えにします。
#==============================================================================

class Scene_Gameover
  #--------------------------------------------------------------------------
  # ● 背景の作成【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_create_background create_background
  def create_background
    toruic_create_background
    @sprite.ox = @sprite.bitmap.width / 2
    @sprite.oy = @sprite.bitmap.height / 2
    @sprite.x = Graphics.width / 2
    @sprite.y = Graphics.height / 2
  end
end
