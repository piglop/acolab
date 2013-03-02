class AddSlugs < ActiveRecord::Migration
  def change
    [:projects, :articles, :users].each do |table|
      add_column table, :slug, :string
      add_index table, :slug, unique: true
    end
  end
end
