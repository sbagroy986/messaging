json.array!(@mailinglists) do |mailinglist|
  json.extract! mailinglist, :id, :name, :list
  json.url mailinglist_url(mailinglist, format: :json)
end
