require 'spec_helper'

describe Goose::Core::Game do
  subject { described_class.new }

  before do
    subject.add_player('player1', 0, 'paars')
    subject.add_player('player2', 0, 'groen')
  end

  describe '#turn' do
    let!(:current_player) { subject.current_player }

    context 'landing on regular position' do
      it 'moves the specified amount of steps' do
        dice = double(roll: 4)

        expect { subject.turn dice }.to \
          change { current_player.position }.by(4)
      end

      it 'ends the turn of the current player' do
        subject.turn
        expect(subject.current_player).to_not eql current_player
      end
    end

    context 'landing on goose position'
  end

  describe '#winner' do
    context 'no players >= position 63' do
      it 'returns nil' do
        expect(subject.winner).to be_nil
      end
    end

    context 'a player with position 63' do
      let!(:winning_player) { subject.add_player('player3', 0, 'rood') }

      before do
        winning_player.position = 63
      end

      it 'returns the winning player' do
        expect(subject.winner).to eq winning_player
      end
    end
  end
end
