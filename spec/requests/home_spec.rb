# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET /' do
    subject(:get_index) { get '/' }

    it 'increments the view count' do
      view_count = ViewCount.find_or_create_by(path: '/')
      expect { get_index }.to change { view_count.reload.views }.from(0).to(1)
    end

    # This test ca reproduce the production environment, with 1000 users
    # it 'multiple request' do
    #   view_count = ViewCount.find_or_create_by(path: '/')
    #   expect {
    #     threads = 1000.times.map do
    #       Thread.new do
    #         get '/'
    #       end
    #     end
    #     threads.map(&:join)
    #   }.to change { view_count.reload.views }.by(1000)
    # end
  end
end
