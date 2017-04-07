#==============================================================================
# ■ メニューのアクター選択省略 RGSS3 v2.0        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　1人パーティーならスキル・装備・ステータスを選ぶと直ちにそれらを表示します。
# 　2人パーティーなら並び替えを選ぶと直ちに2人を入れ替えます。
#==============================================================================

class Scene_Menu
  #--------------------------------------------------------------------------
  # ● コマンド［スキル］［装備］［ステータス］【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_command_personal command_personal
  def command_personal
    if $game_party.members.size == 1
      $game_party.menu_actor = $game_party.members[0]
      on_personal_ok
      return
    end
    toruic_command_personal
  end
  #--------------------------------------------------------------------------
  # ● コマンド［並び替え］【エイリアス】
  #--------------------------------------------------------------------------
  alias toruic_command_formation command_formation
  def command_formation
    if $game_party.members.size == 2
      $game_party.swap_order(0, 1)
      @status_window.refresh
      @command_window.activate
      return
    end
    toruic_command_formation
  end
end
