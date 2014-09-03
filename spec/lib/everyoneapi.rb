require 'spec_helper'


describe Everyoneapi do

  describe 'Everyoneapi' do
    it 'should load the person name and address by phone number' do
      expect(Everyoneapi.person("+15551234567").name).to eq "Michael Seaver"
      expect(Everyoneapi.person("+15551234567").street).to eq "15 Robin Hood Lane"
      expect(Everyoneapi.person("+15551234567").latitude).to eq "40.799787"
    end
  end
end
