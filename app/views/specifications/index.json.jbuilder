json.array!(@specifications) do |specification|
  json.extract! specification, :id, :show_order, :spec_text, :status
  json.url specification_url(specification, format: :json)
end
