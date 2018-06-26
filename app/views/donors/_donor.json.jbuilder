json.extract! donor, :id, :name, :addressline1, :suburb, :state, :postcode, :created_at, :updated_at
json.url donor_url(donor, format: :json)
