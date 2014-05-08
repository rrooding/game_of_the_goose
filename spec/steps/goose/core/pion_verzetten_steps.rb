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
    Goose::Core::Dice.stub(:roll).and_return number.to_i
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

  step 'is de bord opstelling als volgt:' do |table|
    players = @game.players

    table.hashes.each do |hash|
      player = players.for_color(hash['pion'])
      expect(player.position).to eq hash['vakje'].to_i
    end
  end

  step 'er 11 speelrondes zijn gespeeld' do
    amount = @game.players.count * 11
    amount.times do
      @game.turn
    end
  end

  step 'heeft :player_name het spel gewonnen' do |player_name|
    players = @game.players
    player = players.with_name(player_name)

    expect(@game.winner).to eq player
  end
end
