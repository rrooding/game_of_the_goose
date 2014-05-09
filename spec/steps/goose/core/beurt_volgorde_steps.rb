steps_for :core do
  step 'ik heb een speelbord met 63 vakjes' do
    @game = Goose::Core::Game.new
    expect(@game.board.size).to be(63)
  end

  def player_names
    @players.map { |h| h['naam'] }
  end

  step 'ik heb de volgende spelers met de klok mee:' do |table|
    @players = table.hashes

    table.hashes.each do |hash|
      @game.add_player(hash['naam'], hash['leeftijd'], hash['kleur pion'])
    end

    expect(@game.players.map(&:name)).to match_array(player_names)
  end

  step 'alle pionnen staan op het startvakje' do
    @game.players.each do |player|
      expect(player.position).to eql(0)
    end
  end

  def assert_current_player(player_name)
    expect(@game.current_player.name).to eql(player_name)
  end

  step :assert_current_player,
       'is :player_name aan de beurt om te dobbelen omdat hij de jongste ' \
       'speler is'
  step :assert_current_player,
       'is :player_name aan de beurt om te dobbelen'

  step 'de beurt van :player_name is geweest' do |player_name|
    assert_current_player(player_name)
    @game.end_turn
  end
end
