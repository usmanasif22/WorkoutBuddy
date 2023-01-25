class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :title , null: false
      t.integer :load
      t.integer :reps
      t.timestamps
    end
  end
end
