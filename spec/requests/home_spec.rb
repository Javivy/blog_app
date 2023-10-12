require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    describe 'GET /index' do
      it "returns a 200 status code" do
        get "/"
  
        expect(response.status).to eq(200)
      end
  
      it "renders the index template" do
        get "/"
  
        expect(response).to render_template('home/index')
      end
  
      it "includes the correct placeholder text" do
        get "/"
        expect(response).to be_successful
  
        doc = Nokogiri::HTML(response.body)
  
        expect(doc.text).to include('Welcome to the Home Page')
      end
    end
  end
end
