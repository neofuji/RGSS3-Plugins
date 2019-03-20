#==============================================================================
# ■ 初回起動時タイトルスキップ RGSS3 v1.1        MIT License; see git.io/tic
#------------------------------------------------------------------------------
# 　セーブファイルが存在しない場合、タイトル画面を表示せずニューゲームします。
# イベントコマンド［タイトル画面に戻す］、メニューからは通常どおり表示します。
#==============================================================================

class << SceneManager
  #--------------------------------------------------------------------------
  # ● 最初のシーンクラスを取得【エイリアス】
  #--------------------------------------------------------------------------
  alias tic_first_scene_class first_scene_class
  def first_scene_class
    result = tic_first_scene_class
    if result == Scene_Title && !DataManager.save_file_exists?
      DataManager.setup_new_game
      Graphics.brightness = 0
      $game_map.autoplay
      result = Scene_Map
    end
    result
  end
end
