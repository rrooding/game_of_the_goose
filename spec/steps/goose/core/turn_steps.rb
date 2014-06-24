steps_for :core do

  def select_current_player(player)
    players = @game.players
    player = players.for_name(player)

    @game.select_current_player player
  end

  # setup
  step ':player is aan de beurt om te dobbelen' do |player|
    select_current_player(player)
  end

  step ':player gooit altijd :number met de dobbelsteen' do |player , number|
    @dices = {}
    @dices[player] = Goose::Core::FixedDice.new number.to_i
  end

  # roll
  step ':player_name :number dobbelt' do |player_name, number|
    assert_current_player(player_name)

    dice = Goose::Core::FixedDice.new number.to_i
    @game.roll_dice dice
  end

  step ':player_name een ronde later :roll_value dobbelt' do |player_name, roll_value|
    current_round = @game.current_round
    while @game.current_round == current_round
      @game.roll_dice(Goose::Core::FixedDice.new)
    end

    assert_current_player(player_name)
    @game.roll_dice Goose::Core::FixedDice.new roll_value.to_i
  end

  step 'het hele potje is gespeeld' do
    while @game.winner.nil? || @game.current_round > 500
      @game.roll_dice(Goose::Core::SingleDice.new)
    end
  end

  step 'is er een winnaar bekend' do
    expect(@game.winner.nil?).to eql false
  end

  # result
  step 'de beurt van :player_name is geweest' do |player_name|
    assert_current_player(player_name)
    @game.roll_dice Goose::Core::FixedDice.new
  end

  step 'er 11 speelrondes zijn gespeeld' do
    while @game.current_round < 11
      @game.roll_dice(@dices[@game.current_player.name] ||  Goose::Core::FixedDice.new)
    end
  end

  step 'wint deze een prijs!' do
   # ?!
  end

  step 'heeft :player_name het spel gewonnen' do |player_name|
    expect(@game.winner.name).to eq player_name
  end
end
