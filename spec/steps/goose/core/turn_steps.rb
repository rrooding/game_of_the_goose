steps_for :core do
  step ':player :number dobbelt' do |player, number|
    while @game.current_player.name != player
      dice = double(roll: 0)
      @game.turn dice
    end

    dice = double(roll: number.to_i)
    @game.turn dice
  end

  step ':player gooit altijd :number met de dobbelsteen' do |player , number|
    @dices = {}
    @dices[player] = double(roll: number.to_i)
  end

  step 'de beurt van :player_name is geweest' do |player_name|
    assert_current_player(player_name)
    @game.end_turn
  end

  step 'er 11 speelrondes zijn gespeeld' do
    while @game.round < 11
      @game.turn(@dices[@game.current_player.name] ||  double(roll: 0))
    end
  end

  step 'heeft :player_name het spel gewonnen' do |player_name|
    expect(@game.winner.name).to eq player_name
  end
end
