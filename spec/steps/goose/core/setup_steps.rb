steps_for :core do
  # Player setup
  def player_names
    @players.map { |h| h['naam'] }
  end

  step 'ik heb de volgende spelers met de klok mee:' do |table|
    @players = table.hashes

    table.hashes.each do |hash|
      @game.add_player(hash['naam'], hash['leeftijd'], hash['kleur pion'])
    end

    expect(@game.players.map(&:name)).to match_array(player_names)
  end

  step 'is de bord opstelling als volgt:' do |table|
    players = @game.players

    table.hashes.each do |hash|
      player = players.for_color(hash['pion'])
      expect(player.position).to eq hash['vakje'].to_i
    end
  end

  # Board
  step 'ik heb een speelbord met 63 vakjes' do
    @game = Goose::Core::Game.new
    expect(@game.board.size).to be(63)
  end

  step 'alle pionnen staan op het startvakje' do
    @game.players.each do |player|
      expect(player.position).to eql(0)
    end
  end

  step 'de pionnen staan als volgt opgesteld:' do |table|
    table.hashes.each do |hash|
      @game.move_poin(hash['pion'], hash['vakje'].to_i)
    end
  end

  FIELD_TYPES = {
    'ganzenvakje' => Goose::Core::GooseField.new,
    'brug' => Goose::Core::BridgeField.new,
    'vogelkooi' => Goose::Core::BirdCageField.new
  }

  def set_field_type(position, type)
    @game.board.field_type_at position.to_i, FIELD_TYPES[type]
  end

  # Board / field
  step :set_field_type, 'het :position vakje is een :type'
  step :set_field_type, 'op het :position vakje is een :type'

  step 'op het :position vakje mag je nogmaals dobbelen' do |position|
    @roll_again_field = Goose::Core::RollDiceAgainField.new
    @game.board.field_type_at position.to_i, @roll_again_field
  end

  step 'alleen als je minder dan :dice_value had gegooid' do |dice_value|
    @roll_again_field.dice_upper_limit dice_value.to_i
  end

  step 'daar :x je :direction naar vakje :target' do |_, _, _|
    # part of field type
  end

  step 'op het :position vakje mag je naar vakje :destination' do |position, destination|
    @game.board.field_type_at(
        position.to_i,
        Goose::Core::FixedMovementField.new(destination.to_i)
    )
  end
end
