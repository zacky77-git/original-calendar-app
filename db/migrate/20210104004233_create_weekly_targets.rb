class CreateWeeklyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_targets do |t|
      t.string :weekly_content
      t.timestamps
    end
  end
end
