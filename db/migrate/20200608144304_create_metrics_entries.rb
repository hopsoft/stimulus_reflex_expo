class CreateMetricsEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics_entries do |t|
      t.float :requests_per_second
      t.integer :response_time
      t.date :date

      t.timestamps
    end
  end
end
