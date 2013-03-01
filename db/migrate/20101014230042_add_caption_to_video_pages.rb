class AddCaptionToVideoPages < ActiveRecord::Migration
  def change
    add_column Refinery::VideoPage.table_name, :caption, :text
  end
end
