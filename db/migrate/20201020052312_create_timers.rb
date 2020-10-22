class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :paused_at
      t.datetime :ended_at
      t.integer :duration_in_seconds, default: 0, null: false
      t.integer :value_in_seconds, default: 0, null: false
      t.boolean :countdown, default: false, null: false
      t.string :session_id, null: false
      t.index :session_id
      t.timestamps
    end
  end
end
