require 'spec_helper'

describe Goose::Core::RegularField do
  let(:board) { Goose::Core::Board.new }
  let(:position) { 1 }
  let(:roll) { Goose::Core::Roll.new 5 }

  context 'landing on regular field' do
    describe 'Next position' do
      let(:new_position) { board.next_position(position, roll) }

      it 'the new position is equal to the move' do
        expect(new_position).to eq position + roll.total
      end
    end

    describe 'roll again' do
      let(:roll_again) { board.roll_again? position, roll }

      it 'not rolling again' do
        expect(roll_again).to be_false
      end
    end
  end
end
