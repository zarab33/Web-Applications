# Albums POST Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:

- the HTTP method: GET
- the path: /artists

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Response when the post is found: 200 OK -->

1 Pixies Rock 2 ABBA Pop 3 Taylor Swift Pop 4 Nina Simone Pop 5 Kiasmos
Experimental
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /artists

# Expected response:

Response for 200 OK
```

Pixies,
ABBA,
Taylor Swift,
Nina Simone,
Kiasmos,

```

## 4. Encode as Tests Examples

```

# file: spec/integration/application_spec.rb

context 'GET /artists' do
it 'should return a list of artists' do
response = get('/artists')

      expected_response = ('Pixies,
                            ABBA,
                            Taylor Swift,
                            Nina Simone')

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end

end

xcontext 'POST /artists' do
it 'should create a new artist' do
response = post('/artists')

      expected_response = ('/artists', name: 'Wild nothing'
                            genre: 'Indie')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/artists')

      expect(response.body).to eq('Pixies,
                            ABBA,
                            Taylor Swift,
                            Nina Simone, Wild nothing')
    end

end
end

```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

```
