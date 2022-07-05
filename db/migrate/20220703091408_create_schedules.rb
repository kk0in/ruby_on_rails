class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
	  t.integer		:tutor_id
	  t.datetime	:start_time
	  t.integer		:active
	  t.boolean		:applied
	  t.integer		:time_option
      t.timestamps null: false
    end
  end
end
