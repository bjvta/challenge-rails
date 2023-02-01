# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportService do
  describe '#generate' do
    it 'should return an array with data as profiles' do
      profiles = [{
        "id": 1,
        "username": 'eat-music-4',
        "superuser": false
      },
                  {
                    "id": 2,
                    "username": 'leopard-7',
                    "superuser": false
                  },
                  {
                    "id": 3,
                    "username": 'espresso-talk-5',
                    "superuser": false
                  }].to_json
      repositories = [{
        "id": 1,
        "name": 'balance-mocha-6',
        "tags": 'linux,swift,mysql',
        "profile_id": 1
      },
                      {
                        "id": 2,
                        "name": 'drink-owl-8',
                        "tags": 'bsd,python,postgresql',
                        "profile_id": 14
                      }].to_json
      allow_any_instance_of(::External::Client).to receive(:fetch_profiles).and_return(JSON.parse(profiles))
      allow_any_instance_of(::External::Client).to receive(:fetch_repositories).and_return(JSON.parse(repositories))

      profiles = ReportService.new.generate
      expect(profiles).to be_a Array
      expect(profiles.count).to eq 3
      expect(profiles[0][:username]).to eq 'eat-music-4'
    end
    it 'should return an empty array when request does not respond' do
      allow_any_instance_of(::External::Client).to receive(:fetch_profiles).and_return([])
      allow_any_instance_of(::External::Client).to receive(:fetch_repositories).and_return([])
      profiles = ReportService.new.generate
      expect(profiles).to be_a Array
      expect(profiles.count).to eq 0
    end
  end
end
