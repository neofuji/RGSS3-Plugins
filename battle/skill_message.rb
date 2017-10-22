#==============================================================================
# ■ スキルの使用時メッセージ修正 RGSS3 v1.0      MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　スキルの使用時メッセージ 1 行目を空にすると、使用者の名前を非表示にします。
#==============================================================================

class Window_BattleLog
  #--------------------------------------------------------------------------
  # ● スキル／アイテム使用の表示【※再定義※】
  #--------------------------------------------------------------------------
  def display_use_item(subject, item)
    if item.is_a?(RPG::Skill)
      add_text(subject.name + item.message1) unless item.message1.empty?
      unless item.message2.empty?
        wait unless item.message1.empty?
        add_text(item.message2)
      end
    else
      add_text(sprintf(Vocab::UseItem, subject.name, item.name))
    end
  end
end
