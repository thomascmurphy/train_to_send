class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user, index: true, foreign_key: true
      t.string :label
      t.integer :parent_goal_id, index: true, foreign_key: true
      t.boolean :public, default: false
      t.date :deadline
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
