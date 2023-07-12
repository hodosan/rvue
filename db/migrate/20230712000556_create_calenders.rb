class CreateCalenders < ActiveRecord::Migration[7.0]
  def change
    create_table :calenders do |t|
      t.date :day
      t.datetime :begin_time
      t.datetime :close_time
      t.datetime :interval_s
      t.datetime :interval_e
      t.integer :unit_minute
      t.boolean :no_use

      t.timestamps
    end
  end
end
