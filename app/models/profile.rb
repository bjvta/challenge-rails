# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :username, presence: true
  validates_uniqueness_of :username
end
