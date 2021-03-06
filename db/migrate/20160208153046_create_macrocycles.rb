class CreateMacrocycles < ActiveRecord::Migration
  def change
    create_table :macrocycles do |t|
      t.string :label
      t.string :macrocycle_type
      t.references :user, index: true, foreign_key: true
      t.integer :reference_id

      t.timestamps null: false
    end
  end
end
