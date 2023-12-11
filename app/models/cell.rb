class Cell < ApplicationRecord
  validates_presence_of :x, :y, :alive
end
