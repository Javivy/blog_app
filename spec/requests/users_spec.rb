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

    it "renders the show template" do
      get "/users/123"

      expect(response).to render_template('users/show')
    end

    it "includes the correct placeholder text" do
      get "/users/"
      expect(response).to be_successful

      doc = Nokogiri::HTML(response.body)

      expect(doc.text).to include('Users index page')
    end

    it "includes the correct placeholder text" do
      get "/users/123"
      expect(response).to be_successful

      doc = Nokogiri::HTML(response.body)

      expect(doc.text).to include('User ID from the URL: 123')
    end
  end
end
