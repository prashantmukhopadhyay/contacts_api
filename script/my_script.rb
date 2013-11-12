require 'addressable/uri'
require 'rest-client'

def get_request
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

def post_request
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/5.html'
  ).to_s

  puts RestClient.post(url,
                      {user: {name: 'e', email: 'e@ex.com'}})
end

get_request