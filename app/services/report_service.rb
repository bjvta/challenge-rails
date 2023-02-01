# frozen_string_literal: true

require 'external/client'

class ReportService
  def generate
    external_client = ::External::Client.new
    profiles = external_client.fetch_profiles
    profiles.map{ |p| p['repositories'] = [] }
    repositories = external_client.fetch_repositories
    repositories.each do |repository|
      profile = profiles.find { |p| p['id'] == repository['profile_id'] }
      profile['repositories'].append(repository) unless profile.nil?
    end
    convert_to_sym profiles
  end

  def convert_to_sym profiles
    profiles.map{ |profile| profile.deep_symbolize_keys }
  end
end
