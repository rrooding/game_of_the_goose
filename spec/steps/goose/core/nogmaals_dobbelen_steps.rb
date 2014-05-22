steps_for :core do
  step 'op het :position vakje mag je nogmaals dobbelen' do |position|
    @game.board.goose_at position.to_i, Goose::Core::RollDiceAgainField.new
  end

  step :assert_current_player,
       'is :player_name weer aan de beurt om te dobbelen'
end
