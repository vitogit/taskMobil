json.array!(@entries) do |entry|
  json.extract! entry, :hours, :date, :category, :comment
  json.url entry_url(entry, format: :json)
end
