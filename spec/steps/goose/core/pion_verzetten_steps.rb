steps_for :core do
  step ':player_name :number dobbelt' do |player_name, number|
    raise player_name.inspect
  end

  step ':player_name gooit altijd :number met de dobbelsteen' do |player_name, number|
    raise player_name.inspect
  end

  step 'het :position vakje is een ganzenvakje' do |position|
    raise position.inspect
  end
end
