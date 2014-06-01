require 'spec_helper'

describe Goose::Core::Dice do
  subject { described_class.new }

  describe '#roll' do
    it 'is an integer' do
      expect(subject.roll).to be_an Goose::Core::Roll
    end
  end
end
