require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it "returns a 200 status code" do
      get "/users/123/posts"

      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get "/users/123/posts"

      expect(response).to render_template('posts/index')
    end

    it "includes the correct placeholder text" do
      get "/users/123/posts"
      expect(response).to be_successful

      doc = Nokogiri::HTML(response.body)

      expect(doc.text).to include('Here\'s a list of posts for a given user with the id 123')
    end
  end
end
