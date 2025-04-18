require 'rails_helper'

RSpec.describe "Calculator API", type: :request do
  it "calculates string sum" do
    post "/api/v1/calculate", params: { numbers: "1,2" }
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)["result"]).to eq(3)
  end
end