require 'spec_helper'
require 'goose/console'

describe Goose::Console::Cli do
  let (:msg) { "Welkom\n" }
  let (:output) { StringIO.new }
  let (:input) { nil }
  subject { Goose::Console::Cli.new output, input}

  after(:each) do
    reset_output
  end

  def reset_output
    #output = ''
    output.rewind
  end

  it 'Prints welkom message' do
    subject.start_app()
    expect(output.string).to start_with(Goose::Console::Game::MSG_WELCOME + "\n")
  end

  it 'Ask for first player name, after welcome message' do
    subject.start_app()
    expect(output.string).to end_with(
                                 Goose::Console::Game::MSG_ADD_PlAYERS + "\n" +
                                 Goose::Console::Game::MSG_ASK_PlAYER_NAME
                             )
  end

  it 'Ask age after name' do
    subject.start_app()
    reset_output
    subject.execute_user_input('Fred')
    expect(output.string).to start_with(Goose::Console::Game::MSG_ASK_PlAYER_AGE)
  end

  it 'On first name do not accept empty (nil), ask for name again' do
    subject.start_app()
    reset_output
    subject.execute_user_input(nil)
    expect(output.string).to start_with(Goose::Console::Game::MSG_ADD_PLAYERS_ONE_NEEDED)
  end

  it 'On first name do not accept empty (empty string), ask for name again' do
    subject.start_app()
    reset_output
    subject.execute_user_input('')
    expect(output.string).to start_with(Goose::Console::Game::MSG_ADD_PLAYERS_ONE_NEEDED)
  end

  it 'Assigns poin color, after age' do
    subject.start_app()
    subject.execute_user_input('Fred')
    reset_output
    subject.execute_user_input('12')
    expect(output.string).to start_with(Goose::Console::Game::MSG_POIN_SELECTED)
  end


  it 'Start game when entering empty name' do
    subject.start_app()
    subject.execute_user_input('Fred')
    subject.execute_user_input('12')
    reset_output
    subject.execute_user_input('')
    expect(output.string).to start_with(Goose::Console::Game::MSG_ROUND + '0')
  end
end
