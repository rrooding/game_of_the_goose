require 'spec_helper'

describe Goose::Core::Players do
  subject { described_class.new }

  describe '#for_color' do
    let(:returned_player) { subject.for_color('paars') }

    context 'no players' do
      it 'returns nil' do
        expect(returned_player).to be_nil
      end
    end

    context 'no player with given color' do
      before do
        subject.add_player('naam', 0, 'groen')
      end

      it 'returns nil' do
        expect(returned_player).to be_nil
      end
    end

    context 'player with given color' do
      let!(:player) { subject.add_player('naam', 0, 'paars') }

      it 'returns the player' do
        expect(returned_player).to eq player
      end
    end
  end
end
