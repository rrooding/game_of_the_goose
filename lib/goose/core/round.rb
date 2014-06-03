# responsible for the turns
class Round
  attr_accessor :count

  def  initialize(players)
    @count = 0
    @players = players
  end

  def starting_player
    @players.youngest_player
  end

  def current_player
    @current_player || starting_player
  end

  def end_turn
    @current_player = next_player
    update_round_status
  end

  # hand of god
  def select_current_player(player)
    @current_player = player
  end

  private

  def next_player
    i = @players.index(current_player)
    @players[next_index(i)]
  end

  def next_index(i)
    (i + 1) % @players.length
  end

  def update_round_status
    @count += 1 if starting_player == current_player
  end
end
