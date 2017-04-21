#==============================================================================
# ■ アニメーション別速度設定 RGSS3 v1.0          MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　アニメーションの名前に %2 のように数値を指定すると、アニメーションの速度を
# その数値で置き換えます。数値が小さいほどアニメーションは速く再生されます。
#==============================================================================

class Sprite_Base
  #--------------------------------------------------------------------------
  # ● アニメーションの速度を設定【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_set_animation_rate set_animation_rate
  def set_animation_rate
    if @animation.name =~ /%(\d+)/
      @ani_rate = $1.to_i
      return
    end
    toruic_set_animation_rate
  end
end