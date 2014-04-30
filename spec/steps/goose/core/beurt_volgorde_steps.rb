require 'goose/core'

steps_for :core do
  step 'ik heb een speelbord met 63 vakjes' do
    @game = Goose::Core::Game.new
    expect(@game.positions.length).to be(63)
  end

  def player_names_with_the_clock
    @players.map{|h| h['naam']}
  end

  step 'ik heb de volgende spelers met de klok mee:' do |table|
    @players = table.hashes

    table.hashes.each do |hash|
      @game.add_player(hash['naam'], hash['leeftijd'], hash['kleur pion'])
    end

    expect(@game.players_order).to match_array(player_names_with_the_clock)
  end

  step 'alle pionnen staan op het startvakje' do
    player_names_with_the_clock.each do |name|
      expect(@game.player_position(name)).to  eql(0)
    end
  end
end
