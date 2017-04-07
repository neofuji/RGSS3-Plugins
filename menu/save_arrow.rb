#==============================================================================
# ■ セーブ画面スクロール矢印表示 RGSS3 v1.0      MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　セーブ画面とロード画面にスクロール用矢印を表示します。
#==============================================================================

class Window_SaveFileArrow < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(rect)
    super(rect.x, rect.y, rect.width, rect.height)
    self.opacity = 0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ内容の高さを計算
  #--------------------------------------------------------------------------
  def contents_height
    super + 2
  end
end
#------------------------------------------------------------------------------
class Scene_File
  #--------------------------------------------------------------------------
  # ● セーブファイルビューポートの作成【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_create_savefile_viewport create_savefile_viewport
  def create_savefile_viewport
    toruic_create_savefile_viewport
    @arrow_window = Window_SaveFileArrow.new(@savefile_viewport.rect)
  end
  #--------------------------------------------------------------------------
  # ● 先頭のインデックスの設定【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_top_index= top_index=
  def top_index=(index)
    self.toruic_top_index = index
    return @arrow_window.oy = 0 if top_index == 0
    return @arrow_window.oy = 2 if bottom_index == item_max - 1
    return @arrow_window.oy = 1
  end
end
