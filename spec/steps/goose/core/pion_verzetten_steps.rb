steps_for :core do
  step ':player_name :number dobbelt' do |player_name, number|
    while @game.current_player.name != player_name
      Goose::Core::Dice.stub(:roll).and_return 0
      @game.turn
    end

    Goose::Core::Dice.stub(:roll).and_return number.to_i
    @game.turn
  end

  step ':player_name gooit altijd :number met de dobbelsteen' do |player_name, number|
    raise player_name.inspect
  end

  step 'het :position vakje is een ganzenvakje' do |position|
    position = position.to_i

    raise position.inspect
  end

  step 'staat de paarse pion op het :position vakje' do |position|
    position = position.to_i

    players = @game.players
    player = players.for_color('paars')

    expect(player.position).to eq position
  end
end
