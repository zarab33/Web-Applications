require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new }

    context "GET /names" do
        it "should return 200 OK" do
            response = get("/names")

            expect(response.status).to eq(200)
            expect(response.body).to eq("Julia, Mary, Karim")
        end
    end

    context "POST /sort-names" do
        it "should return names sorted alphabetically" do
            response = post("/sort-names")

            expect(response.status).to eq(200)
            expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
        end
    end

    context "GET /hello" do
        it 'contains a h1 title' do
        response = get("/hello")

        expect(response.body).to include('<h1>Hello!</h1>')
  
        end
    end
end