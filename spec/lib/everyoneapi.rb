require 'spec_helper'


describe Everyoneapi do

  describe 'Everyoneapi' do
    it 'should load the persons' do
      Everyoneapi.person("+15551234567").name ==  "Michael Seaver"
    end
  end
end
