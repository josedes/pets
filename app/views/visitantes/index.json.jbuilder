json.array!(@visitantes) do |visitante|
  json.extract! visitante, :id
  json.url visitante_url(visitante, format: :json)
end
