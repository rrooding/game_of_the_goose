require 'goose/core'

steps_for :core do
  step 'ik heb een speelbord met 63 vakjes' do
    @game = Goose::Core::Game.new
    expect(@game.positions.length).to be(63)
  end
end
