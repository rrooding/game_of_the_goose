require 'spec_helper'

describe Goose::Core::Roll do
  subject { described_class.new dice_values }

  context 'single dice' do
    let(:dice_values) { 4 }

    describe '#total' do
      it 'is an integer' do
        expect(subject.total).to be_an Integer
      end

      it 'has the single rolled value' do
        expect(subject.total).to eql(4)
      end
    end
  end

  context 'multi dice' do
    let(:dice_values) { [4, 3] }

    describe '#total' do
      it 'is an integer' do
        expect(subject.total).to be_an Integer
      end

      it 'has the single rolled value' do
        expect(subject.total).to eql(7)
      end
    end
  end
end
