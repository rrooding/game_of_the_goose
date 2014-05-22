steps_for :core do
  step 'op het :position vakje mag je nogmaals dobbelen' do |position|
    @roll_again_field = Goose::Core::RollDiceAgainField.new
    @game.board.field_type_at position.to_i, @roll_again_field
  end

  step :assert_current_player,
       'is :player_name weer aan de beurt om te dobbelen'

  step 'alleen als je minder dan :dice_value had gegooid' do |dice_value|
    @roll_again_field.dice_upper_limit dice_value.to_i
  end

  step 'de blauwe pion staat op het :position vakje' do |position|
    position = position.to_i
    @game.turn( double('Dice', roll: position))
    @game.end_turn
  end
end
