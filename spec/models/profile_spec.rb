# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should allow_value('brandon-1').for(:username) }
    it { should_not allow_value(',,,A').for(:username) }
    subject { Profile.new(username: 'something') }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:repositories) }
  end
end
