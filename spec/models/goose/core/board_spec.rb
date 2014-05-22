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

    context 'landing on field field beyond board length' do
      let(:move) { subject.size }
      it 'the new position is to max board length' do
        expect(new_position).to eq subject.size
      end
    end

    context 'landing on goose field' do
      before do
        subject.field_type_at(position + move)
      end

      it 'the new position is equal to twice the move' do
        expect(new_position).to eq position + (move * 2)
      end
    end

    context 'landing on "roll dice again field"' do
      before do
        subject.field_type_at(position + move, Goose::Core::RollDiceAgainField.new)
      end

      it 'the new position is equal to twice the move' do
        expect(new_position).to eq position + move
      end
    end

    describe 'roll again' do
      let(:position) { 3 }
      let(:roll_again) { subject.roll_again? position, 1 }

      context 'when landing on regular field' do
        it 'not rolling again' do
          expect(roll_again).to be_false
        end
      end

      context 'when landing on other field' do
        before do
          subject.field_type_at(position, Goose::Core::RollDiceAgainField.new)
        end

        it 'not rolling again' do
          expect(roll_again).to be_true
        end
      end
    end
  end
end
