# frozen_string_literal: true

class CreateCalendarEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_events do |t|
      t.string :session_id, null: false
      t.text :description, null: false
      t.datetime :occurs_at, null: false
      t.timestamps
      t.index [:session_id, :occurs_at]
    end
  end
end
