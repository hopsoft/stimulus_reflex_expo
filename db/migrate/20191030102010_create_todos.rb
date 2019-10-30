class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :session_id, null: false
      t.string :title, null: false
      t.boolean :completed, null: false, default: false
      t.timestamps

      t.index :session_id
      t.index :completed
    end
  end
end
