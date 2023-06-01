# Albums POST Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:

- the HTTP method: POST
- the path: /albums
- any query parameters (passed in the URL)
- or body parameters (passed in the request body)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Response when the post is found: 200 OK -->

Surfer Rosa Waterloo Super Trouper Bossanova Lover Folklore I Put a Spell on You
Baltimore Here Comes the Sun Fodder on My Wings Ring Ring
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /albums

# Expected response:

Response for 200 OK
```

Surfer Rosa
Waterloo
Super Trouper
Bossanova
Lover
Folklore
I Put a Spell on You
Baltimore
Here Comes the Sun
Fodder on My Wings
Ring Ring

```

## 4. Encode as Tests Examples

```

# EXAMPLE

# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

# This is so we can use rack-test helper methods.

include Rack::Test::Methods

# We need to declare the `app` value by instantiating the Application

# class so our tests work.

let(:app) { Application.new }

context 'GET /albums' do
it "should return a list of albums" do
response = get("/albums")

      expected_response = ("Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring")

          expect(response.status).to eq(200)
          expect(response.body).to eq(expected_response)

    end

end

context 'POST /albums' do
it "should create a new album" do
response = post('/albums', title: 'Voyage',
release_year: '2022',
artist_id: '2')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response =get('/albums')

      expect(response.body).to include('Voyage')
    end

end
end

```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

```
