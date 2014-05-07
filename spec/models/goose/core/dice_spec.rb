require 'spec_helper'

describe Goose::Core::Dice do
  describe '::roll' do
    it 'is an integer' do
      expect(described_class.roll).to be_an Integer
    end
  end
end
