#==============================================================================
# ■ 戦闘テストのクラウド同期抑制 RGSS3 v1.0      MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　戦闘テスト開始時に生成されるデータベースのファイル名を改名し、OneDrive や
# Dropbox などのクラウドストレージへ自動的にアップロードされないようにします。
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # ● 戦闘テスト用のデータベースをロード【※再定義※】
  #--------------------------------------------------------------------------
  def self.load_battle_test_database
    $data_actors        = load_data("Data/~$BT_Actors.rvdata2")
    $data_classes       = load_data("Data/~$BT_Classes.rvdata2")
    $data_skills        = load_data("Data/~$BT_Skills.rvdata2")
    $data_items         = load_data("Data/~$BT_Items.rvdata2")
    $data_weapons       = load_data("Data/~$BT_Weapons.rvdata2")
    $data_armors        = load_data("Data/~$BT_Armors.rvdata2")
    $data_enemies       = load_data("Data/~$BT_Enemies.rvdata2")
    $data_troops        = load_data("Data/~$BT_Troops.rvdata2")
    $data_states        = load_data("Data/~$BT_States.rvdata2")
    $data_animations    = load_data("Data/~$BT_Animations.rvdata2")
    $data_tilesets      = load_data("Data/~$BT_Tilesets.rvdata2")
    $data_common_events = load_data("Data/~$BT_CommonEvents.rvdata2")
    $data_system        = load_data("Data/~$BT_System.rvdata2")
  end
end
#------------------------------------------------------------------------------
if $BTEST
  File.rename("Data/BT_Actors.rvdata2", "Data/~$BT_Actors.rvdata2")
  File.rename("Data/BT_Classes.rvdata2", "Data/~$BT_Classes.rvdata2")
  File.rename("Data/BT_Skills.rvdata2", "Data/~$BT_Skills.rvdata2")
  File.rename("Data/BT_Items.rvdata2", "Data/~$BT_Items.rvdata2")
  File.rename("Data/BT_Weapons.rvdata2", "Data/~$BT_Weapons.rvdata2")
  File.rename("Data/BT_Armors.rvdata2", "Data/~$BT_Armors.rvdata2")
  File.rename("Data/BT_Enemies.rvdata2", "Data/~$BT_Enemies.rvdata2")
  File.rename("Data/BT_Troops.rvdata2", "Data/~$BT_Troops.rvdata2")
  File.rename("Data/BT_States.rvdata2", "Data/~$BT_States.rvdata2")
  File.rename("Data/BT_Animations.rvdata2", "Data/~$BT_Animations.rvdata2")
  File.rename("Data/BT_Tilesets.rvdata2", "Data/~$BT_Tilesets.rvdata2")
  File.rename("Data/BT_CommonEvents.rvdata2", "Data/~$BT_CommonEvents.rvdata2")
  File.rename("Data/BT_System.rvdata2", "Data/~$BT_System.rvdata2")
end
