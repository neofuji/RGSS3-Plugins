#==============================================================================
# ■ 全体攻撃の適用順シャッフル RGSS3 v1.0        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　効果範囲が全体のスキル／アイテムのメモ欄に <shuffle_targets> と記入すると、
# 通常先頭のバトラーから順となっている効果適用順序をランダムに変化させます。
#==============================================================================

class Game_Action
  #--------------------------------------------------------------------------
  # ● ターゲットの配列作成【エイリアス】
  #--------------------------------------------------------------------------
  alias tic_make_targets make_targets
  def make_targets
    result = tic_make_targets
    result.shuffle! if item.note.include?("<shuffle_targets>")
    result
  end
end
