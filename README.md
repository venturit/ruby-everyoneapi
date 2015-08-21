# Ruby::Everyoneapi

Ruby library to interface with Everyone API. https://www.everyoneapi.com/docs

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-everyoneapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-everyoneapi

## Usage
   Get person name by phone number 

   Everyoneapi.person('+15551234567').name
   
## Spec
   Run spec 

   EVERYONEAPI_SID=XXXX EVERYONEAPI_TOKEN=XXXX  be rspec spec/lib/everyoneapi.rb

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruby-everyoneapi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
