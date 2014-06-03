steps_for :core do

  def select_current_player(player)
    players = @game.players
    player = players.for_name(player)

    @game.select_current_player player
  end

  step ':player :number dobbelt' do |player, number|
    select_current_player(player)

    dice = Goose::Core::FixedDice.new number.to_i
    @game.roll_dice dice
  end

  step ':player is aan de beurt om te dobbelen' do |player|
    select_current_player(player)
  end

  step ':player gooit altijd :number met de dobbelsteen' do |player , number|
    @dices = {}
    @dices[player] = Goose::Core::FixedDice.new number.to_i
  end

  step 'de beurt van :player_name is geweest' do |player_name|
    assert_current_player(player_name)
    @game.roll_dice Goose::Core::FixedDice.new
  end

  step 'er 11 speelrondes zijn gespeeld' do
    while @game.current_round < 11
      @game.roll_dice(@dices[@game.current_player.name] ||  Goose::Core::FixedDice.new)
    end
  end

  step 'heeft :player_name het spel gewonnen' do |player_name|
    expect(@game.winner.name).to eq player_name
  end
end
