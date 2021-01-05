class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
