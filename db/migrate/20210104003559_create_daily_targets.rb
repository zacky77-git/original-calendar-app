class CreateDailyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_targets do |t|
      t.string :daily_content
      t.timestamps
    end
  end
end
