require 'spec_helper'

describe Goose::Core::RegularField do
  subject { described_class.new }

  let(:destination) { position }
  let(:may_roll_again) { false }

  it_behaves_like 'a field'
end

describe Goose::Core::GooseField do
  subject { described_class.new }

  let(:destination) { position + roll.total }
  let(:may_roll_again) { false }

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
    let(:may_roll_again) { false }

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
  let(:may_roll_again) { false }

  it_behaves_like 'a field'
end

describe Goose::Core::BounceField do
  subject { described_class.new bounce }

  let(:bounce) { 8 }
  let(:destination) { position - bounce }
  let(:may_roll_again) { false }

  it_behaves_like 'a field'
end
