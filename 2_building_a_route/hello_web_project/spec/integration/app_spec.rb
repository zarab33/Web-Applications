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
end