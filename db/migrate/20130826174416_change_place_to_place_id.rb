class ChangePlaceToPlaceId < ActiveRecord::Migration
  def change
    remove_column :runs, :place, :string
    add_column :runs, :place_id, :integer
  end
end
