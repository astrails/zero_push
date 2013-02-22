require 'minitest/spec'
require 'minitest/autorun'
require 'zero_push'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :faraday
  c.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [:method, :uri, :headers]
  }
end

#TODO: remove this once Faraday 0.9.0 comes out
require 'net/https'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
#Faraday.default_connection_options = {ssl: {verify: false}}
