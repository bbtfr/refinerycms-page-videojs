class TranslatePageVideoCaptions < ActiveRecord::Migration
  def up
    add_column Refinery::VideoPage.table_name, :id, :primary_key

    Refinery::VideoPage.reset_column_information
    unless defined?(Refinery::VideoPage::Translation) && Refinery::VideoPage::Translation.table_exists?
      Refinery::VideoPage.create_translation_table!({
        :caption => :text
      }, {
        :migrate_data => true
      })
    end
  end

  def down
    Refinery::VideoPage.reset_column_information

    Refinery::VideoPage.drop_translation_table! :migrate_data => true

    remove_column Refinery::VideoPage.table_name, :id
  end
end
