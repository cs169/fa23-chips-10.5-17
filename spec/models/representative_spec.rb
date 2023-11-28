# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe 'double representative test' do
    def setup_representatives(office_name, division_id, person_index)
      repinfo = double('repinfo')
      allow(repinfo).to receive(:officials).and_return([
        double("Official", name: 'John Doe'),
        double("Official", name: 'Jane Chung'),
        double("Official", name: 'Joseph R. Biden')
      ])
      office = double("Office", name: office_name, division_id: division_id, official_indices: [person_index])
      allow(repinfo).to receive(:offices).and_return([office])

      described_class.civic_api_to_representative_params(repinfo)
    end

    context 'Office A' do
      it 'assigns A to John' do
        representatives1 = setup_representatives('Office A', 'A1', 0)
        puts 'officials: ' + representatives1.inspect.to_s
        representative = representatives1.first
        expect(representative.id).to eq(1)
        expect(representative.ocdid).to eq("A1")
      end
    end

    context 'Office B' do
      it 'assigns B to Jane' do
        representatives2 = setup_representatives('Office B', 'B2', 1)
        puts 'officials: ' + representatives2.inspect.to_s
        representative = representatives2.second
        expect(representative.id).to eq(2)
        expect(representative.ocdid).to eq("B2")
      end
    end

    context 'Office C' do
      it 'assigns B to John' do
        representatives3 = setup_representatives('Office C', 'C3', 0)
        puts 'officials: ' + representatives3.inspect.to_s
        representative = representatives3.first
        expect(representative.id).to eq(1)
        expect(representative.ocdid).to eq("C3")
      end
    end

    context 'Joe' do
      it 'assigns Something to Joe' do
        representatives3 = setup_representatives('Office C', 'C3', 2)
        puts 'officials: ' + representatives3.inspect.to_s
        representative = representatives3.first
        expect(representative.id).to eq(1)
        expect(representative.ocdid).to eq("C3")
      end
    end
  end
end
