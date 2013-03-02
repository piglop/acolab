class AddPositionToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :position, :integer, default: 0
  end
end
