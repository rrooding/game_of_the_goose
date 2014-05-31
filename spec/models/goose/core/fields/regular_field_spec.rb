require 'spec_helper'

describe Goose::Core::RegularField do
  let(:board) { Goose::Core::Board.new }
  let(:position) { 1 }
  let(:move) { 5 }

  context 'landing on regular field' do
    describe 'Next position' do
      let(:new_position) { board.next_position(position, move) }

      it 'the new position is equal to the move' do
        expect(new_position).to eq position + move
      end
    end

    describe 'roll again' do
      let(:roll_again) { board.roll_again? position, move }

      it 'not rolling again' do
        expect(roll_again).to be_false
      end
    end
  end
end
