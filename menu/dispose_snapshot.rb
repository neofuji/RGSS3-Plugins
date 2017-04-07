#==============================================================================
# ■ スナップショット自動解放 RGSS3 v1.0          MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　メニューの背景に使用されるスナップショットを適当なタイミングで解放します。
# マップや戦闘でのメモリ使用量が 1 MB ほど削減できます。
#==============================================================================

class << SceneManager
  #--------------------------------------------------------------------------
  # ● 呼び出しスタックのクリア【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_clear clear
  def clear
    toruic_clear
    dispose_background_bitmap
  end
  #--------------------------------------------------------------------------
  # ● 【新規】背景用ビットマップの解放
  #--------------------------------------------------------------------------
  def dispose_background_bitmap
    return unless @background_bitmap
    @background_bitmap.dispose
    @background_bitmap = nil
  end
end
