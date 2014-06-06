steps_for :core do

  # player position
  def assert_current_player(player_name)
    expect(@game.current_player.name).to eql(player_name)
  end

  step :assert_current_player,
       'is :player_name aan de beurt om te dobbelen omdat hij de jongste ' \
       'speler is'

  step :assert_current_player,
       'is :player_name aan de beurt om te dobbelen'

  step :assert_current_player,
       'is :player_name weer aan de beurt om te dobbelen'

  # poin position
  step 'staat de :color pion op het :position vakje' do |color, position|
    position = position.to_i
    color = color[0..-2] # remove trailing "e"

    players = @game.players
    player = players.for_color(color)

    expect(player.position).to eq position
  end

  step 'de blauwe pion staat op het :position vakje' do |position|
    position = position.to_i
    @game.roll_dice(Goose::Core::FixedDice.new position)
  end
end
