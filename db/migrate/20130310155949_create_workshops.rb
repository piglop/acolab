class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.string :state
      t.text :content

      t.timestamps
    end
  end
end
