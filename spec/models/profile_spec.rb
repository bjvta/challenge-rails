# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    subject { Profile.new(username: 'something') }
    it { should validate_uniqueness_of(:username) }
  end
end
