json.extract! donation, :id, :donor, :date_given, :amount, :created_at, :updated_at
json.url donation_url(donation, format: :json)
