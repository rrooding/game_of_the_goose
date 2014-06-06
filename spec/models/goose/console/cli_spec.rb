require 'spec_helper'
require 'goose/console'

describe Goose::Console::Cli do
  let(:msg) { "Welkom\n" }
  let(:output) { StringIO.new }
  let(:input) { nil }
  let(:player_count) { 0 }
  subject { Goose::Console::Cli.new output, input }

  before do
    @player_count = 0
  end

  after(:each) do
    reset_output
  end

  def reset_output
    output.rewind
  end

  it 'Prints welkom message' do
    subject.start_app
    expect(output.string).to start_with(Goose::Console::Game::MSG_WELCOME + "\n")
  end

  it 'Ask for first player name, after welcome message' do
    subject.start_app
    expect(output.string).to end_with(
                                 Goose::Console::Game::MSG_ADD_PLAYERS + "\n" +
                                 Goose::Console::Game::MSG_ASK_PLAYER_NAME
                             )
  end

  it 'Ask age after name' do
    subject.start_app
    reset_output
    subject.execute_user_input('Fred')
    expect(output.string).to start_with(Goose::Console::Game::MSG_ASK_PLAYER_AGE)
  end

  it 'On first name do not accept empty (nil), ask for name again' do
    subject.start_app
    reset_output
    subject.execute_user_input(nil)
    expect(output.string).to start_with(Goose::Console::Game::MSG_ADD_PLAYERS_ONE_NEEDED)
  end

  it 'On first name do not accept empty (empty string), ask for name again' do
    subject.start_app
    reset_output
    subject.execute_user_input('')
    expect(output.string).to start_with(Goose::Console::Game::MSG_ADD_PLAYERS_ONE_NEEDED)
  end

  it 'Assigns poin color, after age' do
    subject.start_app
    subject.execute_user_input('Fred')
    reset_output
    subject.execute_user_input('12')
    expect(output.string).to start_with(Goose::Console::Game::MSG_POIN_SELECTED)
  end

  def add_player
    @player_count += 1
    subject.execute_user_input('Fred' + @player_count.to_s)
    subject.execute_user_input('12')
  end

  it 'Start game when entering empty name' do
    subject.start_app
    add_player
    reset_output
    subject.execute_user_input('')
    expect(output.string).to start_with(Goose::Console::Game::MSG_ROUND + '0')
  end

  it 'Start game when max players is reached' do
    subject.start_app
    add_player while @player_count < 6
    reset_output
    expect(output.string).to include(Goose::Console::Game::MSG_ROUND + '0')
  end

  it 'Start game when max players is reached' do
    subject.start_app
    add_player
    subject.execute_user_input('')

    subject.execute_user_input('') until subject.finished?

    expect(output.string).to include(format(Goose::Console::Game::MSG_WINNAR, 'Fred1'))
  end
end
