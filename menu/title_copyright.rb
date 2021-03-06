#==============================================================================
# ■ タイトル画面に著作権表示 RGSS3 v1.0          MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　タイトル画面に任意の著作権表示を描画します。
#==============================================================================

class Scene_Title
  #--------------------------------------------------------------------------
  # ● 定数
  #--------------------------------------------------------------------------
  Copyright = "©20XX Your Name."          # 著作権表示
  #--------------------------------------------------------------------------
  # ● 前景の作成【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_create_foreground create_foreground
  def create_foreground
    toruic_create_foreground
    draw_copyright
  end
  #--------------------------------------------------------------------------
  # ● 【新規】著作権表示の描画
  #--------------------------------------------------------------------------
  def draw_copyright
    @foreground_sprite.bitmap.font.size = 24
    rect = Rect.new(0, Graphics.height - 32, Graphics.width, 24)
    @foreground_sprite.bitmap.draw_text(rect, Copyright, 1)
  end
end
