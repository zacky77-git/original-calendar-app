class CreateMonthlyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_targets do |t|
      t.string :monthly_content,default: ''
      t.integer :month_id, default: '',unique: true 
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
