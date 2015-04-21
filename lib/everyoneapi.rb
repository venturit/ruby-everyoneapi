require "everyoneapi/version"
require "net/http"
require 'json'

module Everyoneapi

  API_ENDPOINT = 'https://api.everyoneapi.com'
  API_VERSION = 'v1'



  def person(phone_number,data=nil)
     options = {}
     options[:data] = "name,address" if data.nil?
     options[:account_sid] = ENV['EVERYONEAPI_SID']
     options[:auth_token] = ENV['EVERYONEAPI_TOKEN']

     url = [API_ENDPOINT, API_VERSION,"phone",phone_number.strip].join("/")
     uri = URI.parse(url)
     uri.query = URI.encode_www_form(options)

     http = Net::HTTP.new(uri.host, uri.port)

     http.use_ssl = true

     request = Net::HTTP::Get.new(uri.request_uri)

     res = http.request(request)

     raise RuntimeError.new res.message unless res.kind_of? Net::HTTPOK
     
     return Person.new  JSON.parse(res.body,:symbolize_names => true)
  end

  module_function :person
  
  class Person

    attr_accessor :name, :street, :city, :state, :zip, :latitude, :longitude     

    def initialize(options = {})
      unless options[:data].nil?
        @name = options[:data][:name]
        @street = options[:data][:address] 
        unless  options[:data][:location].nil?
          @city = options[:data][:location][:city]
          @state = options[:data][:location][:state]
          @zip = options[:data][:location][:zip]
          unless  options[:data][:location][:geo].nil?
            @latitude = options[:data][:location][:geo][:latitude]
            @longitude = options[:data][:location][:geo][:longitude]
          end
        end
      end
    end
  end


end
