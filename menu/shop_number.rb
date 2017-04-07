#==============================================================================
# ■ ショップの個数入力を快適化 RGSS3 v1.2        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　1個のときにさらに減らすと最大個数に、またその逆を可能にします。
#==============================================================================

class Window_ShopNumber
  #--------------------------------------------------------------------------
  # ● 個数の更新【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_update_number update_number
  def update_number
    if @number == @max && (Input.trigger?(:RIGHT) || Input.trigger?(:UP))
      return change_number(1 - @max)
    elsif @number == 1 && (Input.trigger?(:LEFT) || Input.trigger?(:DOWN))
      return change_number(@max - 1)
    end
    toruic_update_number
  end
end
