json.array!(@profiles) do |profile|
  json.(profile, :username)
  json.repositories profile[:repositories] do |repository|
    json.(repository, :id, :name, :tags)
  end
end
