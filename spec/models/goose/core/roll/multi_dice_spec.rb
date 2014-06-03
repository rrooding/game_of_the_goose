require 'spec_helper'

describe Goose::Core::MultiDice do
  subject { described_class.new 2 }

  describe '#roll' do
    it 'is an integer' do
      expect(subject.roll).to be_an Goose::Core::Roll
    end

    it 'greather then zero' do
      expect(subject.roll.total).to be > 0
    end

    it 'less then 7' do
      expect(subject.roll.total).to be <  13
    end
  end
end
