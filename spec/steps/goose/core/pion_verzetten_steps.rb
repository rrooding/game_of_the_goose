steps_for :core do
  step ':player_name :number dobbelt' do |player_name, number|
    while @game.current_player.name != player_name
      dice = double(roll: 0)
      @game.turn dice
    end

    dice = double(roll: number.to_i)
    @game.turn dice
  end

  step ':player_name gooit altijd :number met de dobbelsteen' do |player_name, number|
    fail
  end

  step 'het :position vakje is een ganzenvakje' do |position|
    position = position.to_i

    fail
  end

  step 'staat de paarse pion op het :position vakje' do |position|
    position = position.to_i

    players = @game.players
    player = players.for_color('paars')

    expect(player.position).to eq position
  end
end
