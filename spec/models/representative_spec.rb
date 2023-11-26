require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe 'double representative test' do
    it 'Task 1.1 Refactoring Legacy Code, if I have the same representative, update instead of creating new one' do

    repinfo = double('repinfo')
    allow(repinfo).to receive(:officials).and_return([
      double('official', name: 'John Doe'),
    ])
    office1 = double('office', name: 'Office A', division_id: '1123', official_indices: [0])
    allow(repinfo).to receive(:offices).and_return([office1])
    representatives = Representative.civic_api_to_representative_params(repinfo)
    puts "Debugging information:"
    puts "officials: #{representatives.inspect}"

    repinfo2 = double('repinfo2')
    allow(repinfo2).to receive(:officials).and_return([
      double('official', name: 'Jane Doe')
    ])
    office2 = double('office', name: 'Office B', division_id: '1223', official_indices: [0])
    allow(repinfo2).to receive(:offices).and_return([office2])

    representatives = Representative.civic_api_to_representative_params(repinfo2)
    puts "Debugging information:"
    puts "officials: #{representatives.inspect}"

    repinfo3 = double('repinfo3')
    allow(repinfo3).to receive(:officials).and_return([
      double('official', name: 'John Doe')
    ])
    office3 = double('office', name: 'Office C', division_id: '1233', official_indices: [0])
    allow(repinfo3).to receive(:offices).and_return([office3])

    representatives = Representative.civic_api_to_representative_params(repinfo3)
    puts "Debugging information:"
    puts "officials: #{representatives.inspect}"

    end
  end
end
