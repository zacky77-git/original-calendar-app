class CreateWeeklyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_targets do |t|
      t.string :weekly_content,default: ''
      t.integer :week_id, default: '',unique: true 
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
