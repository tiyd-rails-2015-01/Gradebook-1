json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :name, :date_on, :point_value
  json.url achievement_url(achievement, format: :json)
end
