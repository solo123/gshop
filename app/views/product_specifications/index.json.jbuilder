json.array!(@product_specifications) do |product_specification|
  json.extract! product_specification, :id, :product_id, :specification_id, :spec_text
  json.url product_specification_url(product_specification, format: :json)
end
