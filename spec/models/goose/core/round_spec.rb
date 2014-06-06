require 'spec_helper'

describe Goose::Core::Round do
  subject { described_class.new players}


  let(:player1) { Goose::Core::Player.new('player1', 1, 'paars') }
  let(:player2) { Goose::Core::Player.new('player2', 0, 'groen') }
  let(:players) {
    p = Goose::Core::Players.new
    p.add player1
    p.add player2
    p
  }

  it 'youngest player to start' do
    expect(subject.current_player).to eql(player2)
  end

  it 'next player start' do
    expect(subject.current_player).to eql(player2)
    subject.select_next_player
    expect(subject.current_player).to eql(player1)
  end

  it 'next player is same player if other player needs to skip turn' do
    player1.skip_turns = 1
    subject.select_next_player
    expect(subject.current_player).to eql(player2)
  end

end
