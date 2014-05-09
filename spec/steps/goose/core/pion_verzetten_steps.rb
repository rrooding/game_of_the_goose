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

  step 'het :position vakje is een ganzenvakje' do |position|
    @game.board.goose_at position.to_i
  end

  step 'staat de paarse pion op het :position vakje' do |position|
    position = position.to_i

    players = @game.players
    player = players.for_color('paars')

    expect(player.position).to eq position
  end

  step 'is de bord opstelling als volgt:' do |table|
    players = @game.players

    table.hashes.each do |hash|
      player = players.for_color(hash['pion'])
      expect(player.position).to eq hash['vakje'].to_i
    end
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
