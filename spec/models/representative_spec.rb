# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe 'double representative test' do
    def setup_representatives(repinfo, office_name, division_id, person_index)
      allow(repinfo).to receive(:officials).and_return([
        instance_double('official', name: 'John Doe'),
        instance_double('official', name: 'Jane Chung')
      ])
      office = instance_double('office', name: office_name, division_id: division_id, official_indices: [person_index])
      allow(repinfo).to receive(:offices).and_return([office])

      described_class.civic_api_to_representative_params(repinfo)
    end

    it 'Task 1.1 Refactoring Legacy Code' do
      puts "Debugging information:"

      representatives1 = setup_representatives(instance_double('repinfo'), 'Office A', '1123', 0)
      puts "officials: #{representatives1.inspect}"

      representatives2 = setup_representatives(instance_double('repinfo2'), 'Office B', '1223', 1)
      puts "officials: #{representatives2.inspect}"

      representatives3 = setup_representatives(instance_double('repinfo3'), 'Office C', '1233', 0)
      puts "officials: #{representatives3.inspect}"

      representative = representatives3.first
      puts "#{representative.inspect}"

      expect(representative.id).to eq(1)
    end
  end
end
