require 'spec_helper'

describe Goose::Core::Board do
  subject { described_class.new }

  it 'has a default size of 63' do
    expect(subject.size).to eq 63
  end

  describe 'different size' do
    let(:size) { 69 }
    subject { described_class.new(size) }

    it 'has the specified size' do
      expect(subject.size).to eq size
    end
  end

  describe 'Next position' do
    let(:position) { 1 }
    let(:field) { subject.field(position + subject.size) }

    context 'landing on field field beyond board length' do
      it 'the new position is to max board length' do
        expect(field).to be_a(Goose::Core::BounceField)
      end
    end
  end
end
