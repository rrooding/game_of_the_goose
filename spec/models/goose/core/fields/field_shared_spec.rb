require 'spec_helper'

RSpec.shared_examples 'a field' do
  let(:roll) { Goose::Core::Roll.new 5 }
  let(:next_player) { Goose::Core::Pawn.new :green, 10 }
  let(:last_player) { Goose::Core::Pawn.new :yellow, 15 }
  let(:opponents_positions) { [last_player, next_player] }

  context 'landing on a field' do
    describe '#next position' do
      let(:new_position) { subject.apply_field_rule(position, roll, opponents_positions) }

      it 'the new position is the desired destination' do
        expect(new_position).to eql destination
      end
    end

    describe '#roll_again?' do
      let(:roll_again) { subject.roll_again? roll }

      it 'validate roll again' do
        expect(roll_again).to eql may_roll_again
      end
    end

    describe '#skip_turns' do
      let(:skip_turns) { subject.skip_turns }

      it 'validate roll again' do
        expect(skip_turns).to eql turns_to_skip
      end
    end
  end
end
