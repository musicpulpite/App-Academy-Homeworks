class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    return if game_over

    round_success_message
    sequence_length += 1
  end

  def show_sequence
    add_random_color

    seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    seq.each do |color|
      user_input = gets.chomp

      if user_input != color
        game_over = true
        break
      end

      sleep 0.25
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "You successfully returned the given color sequence!"
  end

  def game_over_message
    "You failed to return the given color sequence. Try again?"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
