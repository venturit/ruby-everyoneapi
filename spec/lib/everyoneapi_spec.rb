require 'spec_helper'


describe Everyoneapi do

  describe 'Everyoneapi' do
    test_tel_num = '+15551234567'
    it 'should load the person name and address by phone number' do
      expect(Everyoneapi.person(test_tel_num).name).to eq 'Michael Seaver'
      expect(Everyoneapi.person(test_tel_num).first_name).to eq 'Michael'
      expect(Everyoneapi.person(test_tel_num).last_name).to eq 'Seaver'
      expect(Everyoneapi.person(test_tel_num).street).to eq '15 Robin Hood Lane'
      expect(Everyoneapi.person(test_tel_num).latitude).to eq '40.799787'
    end
  end
end
