class ChangeVideoPageToPolymorphic < ActiveRecord::Migration
  def change
    add_column Refinery::VideoPage.table_name, :page_type, :string, :default => "page"
  end
end
