require 'spec_helper'

RSpec.shared_examples 'a field' do
  let(:position) { 1 }
  let(:roll) { Goose::Core::Roll.new 5 }

  context 'landing on a field' do
    describe '#next position' do
      let(:new_position) { subject.apply_field_rule(position, roll) }

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
  end
end
