require 'spec_helper'

describe 'field types' do
  let(:may_roll_again) { false }
  let(:turns_to_skip) { 0 }

  describe Goose::Core::RegularField do
    subject { described_class.new }

    let(:destination) { position }


    it_behaves_like 'a field'
  end

  describe Goose::Core::GooseField do
    subject { described_class.new }

    let(:destination) { position + roll.total }

    it_behaves_like 'a field'
  end

  describe Goose::Core::RollDiceAgainField do
    subject { described_class.new }
    let(:destination) { position }

    context 'default' do
      let(:may_roll_again) { true }

      it_behaves_like 'a field'
    end

    context 'with limit' do
      before do
        subject.dice_upper_limit(roll.total - 1)
      end

      it_behaves_like 'a field'
    end
  end

  describe Goose::Core::FixedMovementField do
    subject { described_class.new fixed_destination }

    let(:fixed_destination) { 8 }
    let(:destination) { fixed_destination }

    it_behaves_like 'a field'
  end

  describe Goose::Core::BounceField do
    subject { described_class.new bounce }

    let(:bounce) { 8 }
    let(:destination) { position - bounce }

    it_behaves_like 'a field'
  end

  describe Goose::Core::SkipTurnField do
    subject { described_class.new turns_to_skip }

    let(:turns_to_skip) { 2 }
    let(:destination) { position }

    it_behaves_like 'a field'
  end
end
