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
      it 'increases the position of the current player with the amount returned by the dice' do
        Goose::Core::Dice.stub(:roll).and_return 4

        expect {
          subject.turn
        }.to change { current_player.position }.by(4)
      end

      it 'ends the turn of the current player' do
        subject.turn
        expect(subject.current_player).to_not eql current_player
      end
    end

    context 'landing on goose position'
  end
end
