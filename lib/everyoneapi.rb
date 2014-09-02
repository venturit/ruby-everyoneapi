require "everyoneapi/version"
require "net/http"
require 'json'

module Everyoneapi

  API_ENDPOINT = 'https://api.everyoneapi.com'
  API_VERSION = 'v1'



  def person(phone_number)
     options = {}
     options[:data] = "name"
     options[:account_sid] = ENV['EVERYONEAPI_SID']
     options[:auth_token] = ENV['EVERYONEAPI_TOKEN']

     url = [API_ENDPOINT, API_VERSION,"phone",phone_number.strip].join("/")
     uri = URI.parse(url)
     uri.query = URI.encode_www_form(options)

     http = Net::HTTP.new(uri.host, uri.port)

     http.use_ssl = true

     request = Net::HTTP::Get.new(uri.request_uri)

     res = http.request(request)

     raise Error.new res.message unless res.kind_of? Net::HTTPOK
     
     return Person.new  JSON.parse(res.body,:symbolize_names => true)
  end

  module_function :person
  
  class Person
    attr_accessor :name
    def initialize(options = {})
      @name = options[:data][:name] unless options[:data].nil?
    end
  end


end
