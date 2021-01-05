class CreateDailyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_targets do |t|
      t.string :daily_content,default: ''
      t.date :date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
