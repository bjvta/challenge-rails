# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z0-9-]*(-)?\z/,
                                 message: 'Invalid format, it should be <username> or <username>-<word or number>' }
  validates_uniqueness_of :username

  has_many :repositories
end
