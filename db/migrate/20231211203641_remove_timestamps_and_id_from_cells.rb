# frozen_string_literal: true

class RemoveTimestampsAndIdFromCells < ActiveRecord::Migration[7.1]
  def change
    remove_column :cells, :created_at, :datetime
    remove_column :cells, :updated_at, :datetime
    remove_column :cells, :id, :integer
  end
end
