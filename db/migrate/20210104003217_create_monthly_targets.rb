class CreateMonthlyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_targets do |t|
      t.string :monthly_content
      t.timestamps
    end
  end
end
