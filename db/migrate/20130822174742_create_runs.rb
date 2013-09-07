class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.date :date
      t.time :time
      t.decimal :distance
      t.text :description
      t.string :place

      t.timestamps
    end
  end
end
