# frozen_string_literal: true

json.extract! repository, :id, :name, :tags, :profile_id, :created_at, :updated_at
json.url repository_url(repository, format: :json)
