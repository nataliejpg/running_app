class ChangeTimeToDuration < ActiveRecord::Migration
  def change
    remove_column :runs, :time, :time
    add_column :runs, :duration, :integer
  end
end
