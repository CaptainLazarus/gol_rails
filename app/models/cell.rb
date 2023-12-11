# frozen_string_literal: true

class Cell < ApplicationRecord # rubocop:disable Style/Documentation
  validates_uniqueness_of :x, scope: :y
  validates_presence_of :x, :y, :alive
end
