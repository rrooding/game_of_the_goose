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

  describe 'Next position' do
    let(:position) { 1 }
    let(:move) { 5 }
    let(:new_position) { subject.next_position(position, move) }

    context 'landing on regular field' do

      it 'the new position is equal to move' do
        expect(new_position).to eq position + move
      end
    end

    context 'landing on goose field' do
      before do
        subject.goose_at(position + move)
      end

      it 'the new position is equal to twice the move' do
        expect(new_position).to eq position + (move * 2)
      end
    end
  end
end
