require 'spec_helper'

describe Goose::Core::GooseField do
  let(:board) { Goose::Core::Board.new }
  let(:position) { 1 }
  let(:roll) { Goose::Core::Roll.new 5 }
  let(:goose_field_position) { position + roll.total }

  before do
    board.field_type_at goose_field_position, described_class.new
  end

  context 'landing on goose field' do
    describe 'Next position' do
      let(:new_position) { board.next_position(position, roll) }

      it 'the new position is equal to twice the move' do
        expect(new_position).to eq position + (roll.total * 2)
      end
    end

    describe 'roll again' do
      let(:roll_again) { board.roll_again? goose_field_position, roll }

      it 'not rolling again' do
        expect(roll_again).to be_false
      end
    end
  end
end
