require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it "returns a 200 status code" do
      get "/users/"

      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get "/users/"

      expect(response).to render_template('users/index')
    end

    it "includes the correct placeholder text" do
      get "/users/"
      expect(response).to be_successful

      doc = Nokogiri::HTML(response.body)

      expect(doc.text).to include('Users index page')
    end
  end
end
