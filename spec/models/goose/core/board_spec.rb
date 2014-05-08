require 'spec_helper'

describe Goose::Core::Board do
  subject { described_class.new }

  it 'has a default size of 63' do
    expect(subject.size).to eq 63
  end

  describe 'different size' do
    let(:size) { 69 }
    subject { described_class.new(size) }

    it 'has the specified size' do
      expect(subject.size).to eq size
    end
  end

  describe '#multiplier_for' do
    let(:position) { 5 }
    let(:multiplier) { subject.multiplier_for(position) }

    context 'regular field' do
      it 'is 1' do
        expect(multiplier).to eq 1
      end
    end

    context 'goose field' do
      before do
        subject.goose_at position
      end

      it 'is 2' do
        expect(multiplier).to eq 2
      end
    end
  end
end
