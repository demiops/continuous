json.extract! billing, :id, :firstname, :lastname, :address, :phone, :city, :state, :country, :email, :created_at, :updated_at
json.url billing_url(billing, format: :json)
