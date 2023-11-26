# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe 'double representative test' do
    it 'Task 1.1 Refactoring Legacy Code' do
      repinfo = instance_double('repinfo')
      allow(repinfo).to receive(:officials).and_return([
        instance_double('official', name: 'John Doe'),
      ])
      office1 = instance_double('office', name: 'Office A', division_id: '1123', official_indices: [0])
      allow(repinfo).to receive(:offices).and_return([office1])
      representatives = described_class.civic_api_to_representative_params(repinfo)
      puts "Debugging information:"
      puts "officials: #{representatives.inspect}"

      repinfo2 = instance_double('repinfo2')
      allow(repinfo2).to receive(:officials).and_return([
        instance_double('official', name: 'Jane Doe')
      ])
      office2 = instance_double('office', name: 'Office B', division_id: '1223', official_indices: [0])
      allow(repinfo2).to receive(:offices).and_return([office2])

      representatives = described_class.civic_api_to_representative_params(repinfo2)
      puts "Debugging information:"
      puts "officials: #{representatives.inspect}"

      repinfo3 = instance_double('repinfo3')
      allow(repinfo3).to receive(:officials).and_return([
        instance_double('official', name: 'John Doe')
      ])
      office3 = instance_double('office', name: 'Office C', division_id: '1233', official_indices: [0])
      allow(repinfo3).to receive(:offices).and_return([office3])

      representatives = Representative.civic_api_to_representative_params(repinfo3)
      puts "Debugging information:"
      puts "officials: #{representatives.inspect}"
      representative = representatives.first
      puts "#{representative.inspect}"
      expect(representative.id).to eq(1)
    end
  end
end
