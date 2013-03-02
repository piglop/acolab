class CreateContributorAssignations < ActiveRecord::Migration
  def change
    create_table :contributor_assignations do |t|
      t.belongs_to :user
      t.belongs_to :target, polymorphic: true

      t.timestamps
    end
    add_index :contributor_assignations, :user_id
    add_index :contributor_assignations, [:target_type, :target_id]
  end
end
