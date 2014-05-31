require 'spec_helper'

describe Goose::Core::RollDiceAgainField do
  let(:board) { Goose::Core::Board.new }
  let(:position) { 1 }
  let(:move) { 5 }
  let(:roll_again_field_position) { position + move }

  before do
    board.field_type_at roll_again_field_position, described_class.new
  end

  context 'landing on roll dice again field' do
    describe 'Next position' do
      let(:new_position) { board.next_position(position, move) }

      it 'the new position is equal to the move' do
        expect(new_position).to eq position + move
      end
    end

    describe 'roll again' do
      let(:roll_again) { board.roll_again? roll_again_field_position, move }

      it 'not rolling again' do
        expect(roll_again).to be_true
      end
    end
  end
end
