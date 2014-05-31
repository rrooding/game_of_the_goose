steps_for :core do

  def select_current_player(player)
    while @game.current_player.name != player
      @game.end_turn
    end
  end

  step ':player :number dobbelt' do |player, number|
    select_current_player(player)

    dice = double(roll: number.to_i)
    @game.turn dice
  end

  step ':player is aan de beurt om te dobbelen' do |player|
    select_current_player(player)
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