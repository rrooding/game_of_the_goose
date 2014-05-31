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
  step 'staat de paarse pion op het :position vakje' do |position|
    position = position.to_i

    players = @game.players
    player = players.for_color('paars')

    expect(player.position).to eq position
  end

  step 'de blauwe pion staat op het :position vakje' do |position|
    position = position.to_i
    @game.turn(double('Dice', roll: position))
    @game.end_turn
  end
end
