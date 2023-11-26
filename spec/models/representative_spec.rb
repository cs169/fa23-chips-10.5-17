# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe 'double representative test' do
    def setup_representatives(repinfo, office_name, division_id, person_index)
      allow(repinfo).to receive(:officials).and_return([
        instance_double(Official, name: 'John Doe'),
        instance_double(Official, name: 'Jane Chung')
      ])
      office = instance_double(Office, name: office_name, division_id: division_id, official_indices: [person_index])
      allow(repinfo).to receive(:offices).and_return([office])

      described_class.civic_api_to_representative_params(repinfo)
    end

    it 'Task 1.1 Refactoring Legacy Code' do

      representatives1 = setup_representatives(instance_double('repinfo'), 'Office A', 'A1', 0)
      puts "officials: " + representatives1.inspect.to_s

      representatives2 = setup_representatives(instance_double('repinfo2'), 'Office B', 'B2', 1)
      puts "officials: " + representatives1.inspect.to_s

      representatives3 = setup_representatives(instance_double('repinfo3'), 'Office C', 'C3', 0)
      puts "officials: " + representatives1.inspect.to_s

      representative = representatives3.first
      puts representative.inspect.to_s

      expect(representative.id).to eq(1)
      expect(representative.ocdid).to eq("C3")
    end
  end
end
