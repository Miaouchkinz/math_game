require_relative './Player'

class Game

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @round = 0
  end

  def setup_phase
    puts "----- NEW TURN -----"

    @players.rotate!
    @round += 1
  end

  def new_turn
    setup_phase
    
    first_number = (1..20).to_a.sample(1).first
    second_number = (1..20).to_a.sample(1).first
    result = first_number + second_number
    answer = player_answer(first_number, second_number)

    evaluate_input(result, answer)
  end

  def player_answer(first_number, second_number)
    puts "#{@players.first.name}: What does #{first_number} plus #{second_number} equal?"
    gets.chomp.to_i
  end

  def evaluate_input(result, answer)
    if answer == result
      puts "#{@players.first.name}: YES! You are correct"
    else
      @players.first.score -= 1
      puts "#{@players.first.name}: I'm sorry, that's no the correct answer."
    end
  end

  def turn_summary
    puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
  end

  def game_over?
    @players.each do | player |
      return true if player.lost?
    end
    return false
  end

  def winner
    @players.select do | player |
      player.lost? == false
    end
  end

  def play
    until (game_over?) do
      new_turn
      turn_summary
    end

    puts "#{winner.first.name} wins with a score of #{winner.first.score}/3"
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end

end