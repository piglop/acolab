class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.text :description
      t.text :skills
      t.text :projects
      t.text :wishes

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
