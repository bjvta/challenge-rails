# frozen_string_literal: true

json.array!(@profiles) do |profile|
  json.call(profile, :username)
  json.repositories profile[:repositories] do |repository|
    json.call(repository, :id, :name, :tags)
  end
end
