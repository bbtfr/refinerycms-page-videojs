class CreatePageVideos < ActiveRecord::Migration
  def change
    create_table Refinery::VideoPage.table_name, :id => false do |t|
      t.integer :video_id
      t.integer :page_id
      t.integer :position
    end

    add_index Refinery::VideoPage.table_name, :video_id
    add_index Refinery::VideoPage.table_name, :page_id
  end
end
